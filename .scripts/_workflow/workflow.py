from __future__ import annotations

import json
import shlex
import shutil
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path

from .config import *
from .metadata import read_merged_record, render_metadata_block, split_file_sections
from .parse import iter_object_blocks, parse_mod_name


@dataclass(frozen=True)
class SnapshotRecord:
    metadata: dict[str, str]
    block: str
    position: int


@dataclass(frozen=True)
class ConflictSource:
    ref: str
    position: int


def _split_ref(ref: str) -> tuple[str, str]:
    """Split <mod_name>/<relative_path> where mod_name may contain '/'."""
    for mod_name in sorted(MODS_TO_CHECK, key=len, reverse=True):
        prefix = f"{mod_name}/"
        if ref.startswith(prefix):
            return mod_name, ref[len(prefix):]
    raise ValueError(f"Unrecognized ref mod prefix: {ref}")


def _derive_output_from_refs(refs: list[str]) -> str:
    """Derive output file path from source refs.
    - Single source mod: FILE_REPLACE_TEMPLATE
    - Anything else (multi-source, compat mod, unrecognized): FILE_MERGE_TEMPLATE
    """
    source_mods_in_refs = {mod_name for ref in refs if (mod_name := _split_ref(ref)[0]) in SOURCE_MODS}
    if len(source_mods_in_refs) == 1:
        source_mod = source_mods_in_refs.pop()
        source_ref = next(ref for ref in refs if _split_ref(ref)[0] == source_mod)
        _, rel_path = _split_ref(source_ref)
        rel = Path(rel_path)
        source_dir = rel.parent.as_posix()
        source_mod_id = SOURCE_MODS[source_mod]
        return FILE_REPLACE_TEMPLATE.format(source_dir=source_dir, source_name=rel.stem, source_mod_id=source_mod_id)
    _, rel_path = _split_ref(refs[0])
    source_dir = Path(rel_path).parent.as_posix()
    return FILE_MERGE_TEMPLATE.format(source_dir=source_dir)


def _read_mod_metadata(mod_name: str) -> dict[str, str]:
    """Extract version and supported_version from mod descriptor file."""
    mod_dir = ROOT / mod_name
    descriptor = mod_dir / "descriptor.mod"
    metadata: dict[str, str] = {}
    if descriptor.exists():
        for line in descriptor.read_text(encoding="utf-8").splitlines():
            match = DESCRIPTOR_RE.match(line)
            if match and match.group("key") in ("version", "supported_version"):
                metadata[match.group("key")] = (
                    match.group("value").strip().removeprefix("v").removeprefix("V")
                )
    return metadata


def _snapshot_path(ref: str, object_id: str) -> Path:
    mod_name, rel_text = _split_ref(ref)
    rel = Path(rel_text)
    name = SNAPSHOT_NAME_TEMPLATE.format(mod_name=mod_name, source_name=rel.stem)
    return TRACKING_DIR / rel.parent / object_id / name


def _merged_path(output_rel: str, object_id: str) -> Path:
    return MERGED_DIR / Path(output_rel).parent / f"{object_id}.txt"


def _copy_patch_metadata() -> None:
    patch_dir = ROOT / PATCH_MOD
    mod_name = parse_mod_name(patch_dir)
    descriptor_src = patch_dir / "descriptor.mod"
    if descriptor_src.exists():
        shutil.copy2(descriptor_src, BUILD_DIR / f"{mod_name}.mod")
    for path in patch_dir.rglob("*"):
        if path.is_file() and path.suffix == ".md":
            out = BUILD_DIR / path.relative_to(patch_dir)
            out.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(path, out)


def _conflicts() -> dict[str, list[ConflictSource]]:
    occurrences: dict[str, dict[str, int]] = defaultdict(dict)
    for mod_name in MODS_TO_CHECK:
        mod_dir = ROOT / mod_name
        for path in sorted(mod_dir.rglob("*.txt")):
            ref = f"{mod_name}/{path.relative_to(mod_dir).as_posix()}"
            for object_id, _, position in iter_object_blocks(path.read_text(encoding="utf-8")):
                occurrences[object_id][ref] = position
    conflicts: dict[str, list[ConflictSource]] = {}
    for object_id, refs_by_ref in sorted(occurrences.items()):
        mods = {_split_ref(ref)[0] for ref in refs_by_ref}
        if len(mods) <= 1:
            continue
        aliases = {PATH_TO_ALIAS.get(mod_name, mod_name.lower()) for mod_name in mods}
        if not aliases.intersection(CONFLICT_FILTER_SOURCE_MODS):
            continue
        conflicts[object_id] = [ConflictSource(ref=ref, position=refs_by_ref[ref]) for ref in sorted(refs_by_ref)]
    return conflicts


def _write_conflicts(conflicts: dict[str, list[ConflictSource]]) -> None:
    CONFLICTS_DIR.mkdir(parents=True, exist_ok=True)
    rendered = json.dumps(
        {object_id: [source.ref for source in refs] for object_id, refs in conflicts.items()},
        ensure_ascii=False,
        indent=2,
    )
    (CONFLICTS_DIR / "conflicts.json").write_text(rendered + "\n", encoding="utf-8")
    print("wrote: _Merged/.conflicts/conflicts.json")
    print(f"summary: {len(conflicts)} conflicting IDs")


def _build_sort_key(object_id: str, ref: str, position: int) -> tuple[int, int, str]:
    mod_name, _ = _split_ref(ref)
    alias = PATH_TO_ALIAS.get(mod_name, mod_name.lower())
    return (MOD_PRIORITY.get(alias, len(MOD_PRIORITY)), position, object_id)


def _snapshot(
    conflicts: dict[str, list[ConflictSource]],
) -> dict[str, dict[str, SnapshotRecord]]:
    wanted_by_file: dict[str, set[str]] = defaultdict(set)
    for object_id, refs in conflicts.items():
        for source in refs:
            wanted_by_file[source.ref].add(object_id)

    snapshots: dict[str, dict[str, SnapshotRecord]] = defaultdict(dict)
    count = 0
    for ref, wanted in sorted(wanted_by_file.items()):
        mod_name, rel_text = _split_ref(ref)
        rel = Path(rel_text)
        metadata = _read_mod_metadata(mod_name)
        for object_id, block, position in iter_object_blocks((ROOT / mod_name / rel).read_text(encoding="utf-8")):
            if object_id in wanted:
                out = _snapshot_path(ref, object_id)
                out.parent.mkdir(parents=True, exist_ok=True)
                content = render_metadata_block(
                    {
                        "source_mod": PATH_TO_ALIAS.get(mod_name, mod_name.lower()),
                        **dict(sorted(metadata.items())),
                        "position": position,
                    }
                ) + block
                out.write_text(content, encoding="utf-8")
                snapshots[object_id][ref] = SnapshotRecord(metadata=dict(metadata), block=block, position=position)
                count += 1
    print(f"snapshot: {count} blocks")
    return snapshots


def _seed(
    conflicts: dict[str, list[ConflictSource]],
    snapshots: dict[str, dict[str, SnapshotRecord]],
) -> None:
    created = skipped = 0
    for object_id, sources_for_object in sorted(conflicts.items()):
        refs = [source.ref for source in sources_for_object]
        output_rel = _derive_output_from_refs(refs)
        merged_path = _merged_path(output_rel, object_id)
        if merged_path.exists():
            skipped += 1
            continue
        seed_ref = refs[0]
        seed_block = snapshots[object_id][seed_ref].block
        source_rows = [
            {
                "ref": source.ref,
                "position": source.position,
                "supported_version": snapshots[object_id][source.ref].metadata.get("supported_version", ""),
            }
            for source in sources_for_object
        ]
        primary_source = min(
            source_rows,
            key=lambda source: (_build_sort_key(object_id, source["ref"], source["position"]), source["ref"]),
        )
        sort_key = _build_sort_key(object_id, primary_source["ref"], primary_source["position"])
        sources = [
            {"ref": row["ref"], "supported_version": row["supported_version"]}
            for row in source_rows
        ]
        merged_path.parent.mkdir(parents=True, exist_ok=True)
        merged_metadata: dict[str, object] = {
            "output": output_rel,
            "supported_version": "",
        }
        merged_metadata["sort_key"] = sort_key
        merged_metadata["sources"] = sources
        merged_path.write_text(
            render_metadata_block(merged_metadata, include_auto_generated=True) + seed_block + "\n",
            encoding="utf-8",
        )
        print(f"seeded: {merged_path.relative_to(ROOT)}")
        created += 1
    print(f"seed: {created} created, {skipped} skipped")


def _write_merge_script(conflicts: dict[str, list[ConflictSource]]) -> None:
    script = [
        "#!/usr/bin/env bash",
        "set -u",
        f"cd {shlex.quote(str(ROOT))}",
        "command -v code >/dev/null 2>&1 || { echo 'VS Code CLI not found: install/enable the `code` shell command first.'; exit 1; }",
        "",
        "# Opens the auto-generated seed file plus source diffs in VS Code. Edit the seed file on the right and save it.",
        "",
    ]
    for object_id, sources_for_object in sorted(conflicts.items()):
        refs = [source.ref for source in sources_for_object]
        merged_path = _merged_path(_derive_output_from_refs(refs), object_id)
        script.append(f"printf '\n=== {object_id} ===\n'")
        script.append(f"code --reuse-window {shlex.quote(str(merged_path))}")
        for ref in refs:
            script.append(f"printf 'source: %s\n' {shlex.quote(ref)}")
            script.append(
                f"code --reuse-window --diff {shlex.quote(str(_snapshot_path(ref, object_id)))} {shlex.quote(str(merged_path))}"
            )
        script.append(f"printf 'after editing, run: git add %s\n' {shlex.quote(str(merged_path))}")
        script.append("read -r -p 'Press Enter for the next object...' _")
        script.append("")
    script.extend([
        "printf '\n=== after all files are resolved ===\n'",
        "printf 'run: python3 .scripts/update_workflow.py build\n'",
        "",
    ])
    CONFLICTS_DIR.mkdir(parents=True, exist_ok=True)
    path = CONFLICTS_DIR / "manual_merge.sh"
    path.write_text("\n".join(script), encoding="utf-8")
    path.chmod(0o755)
    print(f"wrote: {path.relative_to(ROOT)}")
    print(f"run: bash {path.relative_to(ROOT)}")


def run_prep() -> int:
    if TRACKING_DIR.exists():
        shutil.rmtree(TRACKING_DIR)
    conflicts = _conflicts()
    _write_conflicts(conflicts)
    snapshots = _snapshot(conflicts)
    _seed(conflicts, snapshots)
    _write_merge_script(conflicts)
    print("prep: scan, snapshot, conflicted seed, and merge script generation complete")
    return 0


def _collect_preambles() -> dict[str, str]:
    preambles: dict[str, str] = {}
    for mod_name in MODS_TO_CHECK:
        mod_dir = ROOT / mod_name
        for path in sorted(mod_dir.rglob("*.txt")):
            ref = f"{mod_name}/{path.relative_to(mod_dir).as_posix()}"
            output_rel = _derive_output_from_refs([ref])
            if output_rel in preambles:
                continue
            preamble, _, _ = split_file_sections(path.read_text(encoding="utf-8"))
            if preamble:
                preambles[output_rel] = preamble
    return preambles


def run_build() -> int:
    if BUILD_DIR.exists():
        shutil.rmtree(BUILD_DIR)
    BUILD_DIR.mkdir(parents=True, exist_ok=True)
    _copy_patch_metadata()
    output_groups: dict[str, list[tuple[tuple[int, int, str], str]]] = defaultdict(list)
    merged_files = 0
    output_preambles = _collect_preambles()

    for merged_file in sorted(MERGED_DIR.rglob("*.txt")):
        parts = merged_file.relative_to(MERGED_DIR).parts
        if any(part.startswith(".") for part in parts):
            continue
        merged_files += 1
        merged_record = read_merged_record(merged_file)
        if merged_record.body:
            output_groups[merged_record.output_rel].append((merged_record.sort_key, merged_record.body))
    if merged_files == 0:
        print("build: 0 objects → 0 files")
        print("hint: _Merged is empty. Run prep, resolve the seeded files, then build.")
        return 0
    for rel_text, items in sorted(output_groups.items()):
        out = BUILD_DIR / rel_text
        out.parent.mkdir(parents=True, exist_ok=True)
        preamble = output_preambles.get(rel_text, "").strip()
        bodies_sorted = [body for _, body in sorted(items)]
        if preamble:
            rendered = preamble + "\n\n" + "\n\n".join(bodies_sorted) + "\n"
        else:
            rendered = "\n\n".join(bodies_sorted) + "\n"
        out.write_text(rendered, encoding="utf-8")
        print(f"built: {out.relative_to(ROOT)} ({len(items)} objects)")
    print(f"build: {sum(len(v) for v in output_groups.values())} objects → {len(output_groups)} files")
    return 0

# Mod Update Workflow + Coding Helper Contract

## Human Order Of Operations (Short)

Use this sequence when updating the patch:

1. Make sure the repo has an initial commit that includes `README.md`, `.github/`, `.scripts/`, `_Merged/`, and `_My Patch/`.
2. Enable Git's recorded-resolution cache once for this repo:
	 git config rerere.enabled true
	 git config rerere.autoupdate true
3. Keep two long-lived branches:
	 - `resolved` for the manually curated `_Merged/` state
	 - `prep-generated` for raw `prep` output after each upstream refresh
4. Update one or more upstream source mod folders in this workspace on `prep-generated`.
5. Run prep:
	 python3 `.scripts/update_workflow.py` prep
6. Commit the generated `_Merged/` changes on `prep-generated`.
7. Check out `resolved` and merge the generated branch:
	 git merge prep-generated
	 If the same conflict reappears, `rerere` should stage the previous resolution automatically.
8. Open and review: `_Merged/.conflicts/conflicts.json`
9. Run the generated merge helper:
	 bash `_Merged/.conflicts/manual_merge.sh`
10. Edit each `_Merged/<rel_path>/<object_id>.txt` file that still needs human review:
	 - Adjust the `# output:` line if the output filename should differ from the default.
	 - Resolve the conflict below the header and save.
11. Commit the merge resolution on `resolved`.
12. Record the resolution in `_Merged/changes.md`:
	 - Add the object ID or conflict key.
	 - Note which upstream definition won and why.
	 - Mention any special output-file choice or manual compromise that should be reused next time.
13. Run build:
	 python3 `.scripts/update_workflow.py` build
14. Optional, for testing against the reference output:
	 python3 `.scripts/update_workflow.py` compare
15. Deploy `_build/` to your Stellaris mods folder.

Configured upstream mods:
- BPVR - More Building Slots
- Planetary Diversity - More Arcologies
- BPVR - Compatibility Patch

Generated artifacts (do not hand-edit):
- `_Merged/.conflicts/conflicts.json`
- `_Merged/.conflicts/manual_merge.sh`
- `_Merged/.upstream_tracking/`
- `_build/`

Per-object merged file format (`_Merged/<rel>/<object_id>.txt`):

```
# auto-generated
# output: <rel_path/output_filename.txt>   <- controls which _build/ file this object lands in
# from: <mod_name>/<upstream_file.txt>     <- informational; list all upstream sources
# from: ...

<resolved object block>
```

## Architecture

`_Merged/` is the canonical, manually-resolved source. The scripts do not auto-merge semantics; they only:
- detect conflicts
- snapshot upstream object blocks
- seed starter files in `_Merged/`
- generate one VS Code merge helper script
- assemble `_Merged/` into `_build/`
- compare `_build/` against `_build_example/`

Manual git merge / resolve is the expected way to decide content when upstream mods disagree.

**Upstream mods:**
- `BPVR - Compatibility Patch` — Already handles compatibility with `BPVR - More Building Slots`; outputs to the shared common file.
- `BPVR - More Building Slots` — Merged via Compat Patch; outputs to the shared common file.
- `Planetary Diversity - More Arcologies` — Only mod you're adding compatibility for; outputs to its own MOD ID file.

`prep` ignores conflicts that are only between `BPVR - More Building Slots` and `BPVR - Compatibility Patch`.

### Git Merge Memory

- Use `git merge`, not a manual copy-over workflow, when bringing new `prep-generated` output into `resolved`.
- `git rerere` is the primary mechanical memory for already resolved conflicts.
- `_Merged/changes.md` is the human-readable rationale log for why a recorded resolution was kept or changed.
- If `rerere` reapplies a resolution, still review the result before committing the merge.

**Output files (in `_build/common/districts/`):**
- `<Compat Patch common merged filename>` — Merged objects from BPVR Compat Patch and MBS (all mixed together in Compat Patch's file). The filename is read from `BPVR - Compatibility Patch/common/districts/`.
- `pd_arcology_districts_replace_<PD remote_file_id>.txt` — Merged objects from PD Arcologies only (when no Compat Patch definition exists for that object). The mod ID is read from `Planetary Diversity - More Arcologies/descriptor.mod`.

`_build/` should mirror `_My Patch/` for shipped files: copy `.mod` / `.md` metadata from `_My Patch`, then generate only those two `.txt` files in `common/districts/`.

`compare` checks `_build/common/districts/` against `_build_example/common/districts/` semantically:
- ignores formatting differences
- ignores object ordering differences
- ignores comments
- reports missing, extra, or changed object IDs and preamble differences

Snapshot naming rule (per upstream block):
- `_Merged/.upstream_tracking/<rel_path>/<object_id>/<game_version>_<mod_name>_<mod_version>_<source_stem>.txt`

## Coding Helper Contract (Machine-Targeted)

This section provides context and hard constraints for coding helpers.
### Output Expectations

- Resolved object definitions go in `_Merged/<rel_path>/<object_id>.txt`.
	- Each file must begin with a `# output:` line and one or more `# from:` lines.
	- The block body follows immediately after the header.

### Conflict Memory

- `git rerere` is the first-line memory for previously resolved merge conflicts.
- `_Merged/changes.md` is the durable human-readable record for the reasoning behind those resolutions.
- Before resolving or revisiting a conflict, read `_Merged/changes.md` first and reuse the prior decision unless upstream content changed enough to justify a new decision.
- When changing an earlier decision, append a new note that explicitly says the older resolution was superseded and why.
- Update or append `_Merged/changes.md` with:
	- what changed
	- why it changed
	- which conflict key or object ID it addressed
- Keep README structure stable so future automation can parse headings.

### Non-Goals

- Do not perform broad balance redesigns.
- Do not rename files or object IDs for style-only reasons.
- Do not modify generated snapshot history except through the workflow script.

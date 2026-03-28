from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent

BUILD_DIR     = ROOT / "_build"
MERGED_DIR    = ROOT / "_Merged"
CONFLICTS_DIR = ROOT / "_Merged" / ".conflicts"
TRACKING_DIR  = ROOT / "_Merged" / ".upstream_tracking"

FILE_REPLACE_TEMPLATE  = "{source_dir}/{source_name}_replace_{source_mod_id}.txt"
FILE_MERGE_TEMPLATE    = "{source_dir}/����_all_merged_common_items_replace.txt"
SNAPSHOT_NAME_TEMPLATE = "{mod_name}_{source_name}.txt"
METADATA_LINE_TEMPLATE = "# {key}: {value}"

# alias → ROOT-relative path, in scan/seed-priority order (winners first).
# "vanilla" is a stub.
MOD_ALIASES: dict[str, str | None] = {
    "vanilla":      None,
    "bpvr_compat":   "External Mods/BPVR - Compatibility Patch",
    "pd_arcologies": "External Mods/Planetary Diversity - More Arcologies",
    "bpvr_base":     "External Mods/BPVR - More Building Slots",
    "my_patch":      "_My Patch",
}

# Mods whose objects get their own replace-file; others route to the shared merge file.
SOURCE_MOD_ALIASES = {"pd_arcologies", "bpvr_base"}

# Conflicts are only recorded when at least one participant alias is in this set.
CONFLICT_FILTER_SOURCE_MODS = {"vanilla", "pd_arcologies"}

# Output-file sort weight by alias; unlisted mods sort after all listed ones.
MOD_PRIORITY = {"vanilla": 0, "bpvr_compat": 1, "pd_arcologies": 2}

# --- derived ---
ALIAS_TO_PATH = {a: p for a, p in MOD_ALIASES.items() if p is not None}
PATH_TO_ALIAS = {p: a for a, p in ALIAS_TO_PATH.items()}
MODS_TO_CHECK = list(ALIAS_TO_PATH.values())
SOURCE_MODS   = {ALIAS_TO_PATH[a]: a for a in SOURCE_MOD_ALIASES}
PATCH_MOD     = ALIAS_TO_PATH["my_patch"]

# RegEx
DESCRIPTOR_RE   = re.compile(r'^(?P<key>[A-Za-z_]+)="(?P<value>[^"]*)"$')
OBJECT_START_RE = re.compile(r"^([A-Za-z0-9_]+)\s*=\s*{\s*$", re.MULTILINE)

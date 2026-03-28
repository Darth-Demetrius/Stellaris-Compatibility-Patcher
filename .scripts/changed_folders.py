#!/usr/bin/env python3
"""
Scan each top-level mod in the workspace and produce a merged
tree of folder names (excluding `help`, `localisation`, `sound`).
Writes Markdown to `.vscode/changed_folders.md` with nested bullets.

Usage: python3 .vscode/changed_folders.py [workspace_mod_dir]
If no arg is given, the script assumes the parent of this `.vscode` folder.
"""
import os
import sys
from collections import defaultdict


SKIP = {"help", "localisation", "sound"}


def add_path(tree, parts):
    node = tree
    for p in parts:
        if p in SKIP:
            return
        node = node.setdefault(p, {})


def build_tree(workspace_root):
    tree = {}
    # list top-level entries and treat directories (mods)
    for entry in sorted(os.listdir(workspace_root)):
        mod_path = os.path.join(workspace_root, entry)
        if entry == '.vscode':
            continue
        if not os.path.isdir(mod_path):
            continue

        for dirpath, dirnames, filenames in os.walk(mod_path):
            # relative path from mod root
            rel = os.path.relpath(dirpath, mod_path)
            if rel in ('.', ''):
                parts = []
            else:
                parts = rel.split(os.sep)
            # skip any path that contains a skipped component
            if any(p in SKIP for p in parts):
                continue
            if parts:
                add_path(tree, parts)
    return tree


def tree_to_md_lines(tree, level=0):
    lines = []
    for key in sorted(tree.keys(), key=str.lower):
        indent = '  ' * level
        lines.append(f"{indent}- {key}")
        children = tree[key]
        if children:
            lines.extend(tree_to_md_lines(children, level + 1))
    return lines


def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    workspace_root = sys.argv[1] if len(sys.argv) > 1 else os.path.abspath(os.path.join(script_dir, '..'))

    tree = build_tree(workspace_root)

    out_path = os.path.join(script_dir, 'changed_folders.md')
    with open(out_path, 'w', encoding='utf-8') as f:
        f.write('# Changed folders (merged across mods)\n\n')
        if not tree:
            f.write('_No folders found._\n')
        else:
            for line in tree_to_md_lines(tree):
                f.write(line + '\n')

    print(f"Wrote merged folder list to {out_path}")


if __name__ == '__main__':
    main()

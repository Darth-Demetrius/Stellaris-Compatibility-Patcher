from __future__ import annotations

import argparse

from .workflow import run_build, run_prep


def main() -> int:
    parser = argparse.ArgumentParser(description="Stellaris patch workflow.")
    subparsers = parser.add_subparsers(dest="command", required=True)

    subparsers.add_parser("prep",     help="Scan, snapshot, seed, and generate the merge helper script.")
    subparsers.add_parser("build",    help="Assemble _Merged/ object files into _build/ output.")

    args = parser.parse_args()
    if args.command == "prep":
        return run_prep()
    return run_build()

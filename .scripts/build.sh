#!/usr/bin/env bash

# 4) Commit merge resolutions
git add _Merged
git commit -m "Resolve merged update"

# 5) Build output artifacts
python .scripts/update_workflow.py build

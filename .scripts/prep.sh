#!/usr/bin/env bash

python .scripts/update_workflow.py prep
git add _Merged
git commit -m "Prep upstream update"

# 2) Merge prep output into resolved
git checkout resolved
git merge prep-generated

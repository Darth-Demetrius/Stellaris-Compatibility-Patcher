# Copilot Instructions

- The only files in this repository that AI helpers are allowed to edit are:
  - `.**`
  - `README.md`
  - `_Merged/*.md`
- The only files that generates scripts are allowed to edit are:
  - `_Merged/**`
  - `_build/**`

Before making suggestions, edits, or running workflow commands in this repository, AI helpers must read README.md from the repo root and follow its constraints.

Required behavior:
- Treat README.md as the authoritative process and patch-output contract.
- For update or conflict-resolution work, prefer a real `git merge` workflow on tracked `_Merged/` files, with `git rerere` enabled to reuse prior resolutions.
- Read `_Merged/changes.md` if it exists and treat it as the durable record of why a prior merge decision was chosen.
- Re-check README.md if it may have changed during the session.
- If README.md and prior assumptions conflict, follow README.md.
- If user instructions conflict with README.md, follow the user instruction and call out the conflict briefly.
- Offer to update README.md if the user ever has to explain a design constraint or decision.
- When a conflict is resolved, revisited, or superseded, update `_Merged/changes.md` so future sessions can reuse that decision and rationale.
- This is not production code, it is a quick-and-dirty patching workflow. Prioritize simplicity over robustness, and manual review over automation when in doubt.

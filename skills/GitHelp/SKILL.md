---
name: GitHelp
version: 0.1.0
description: "Translate plain English into git commands with explanations. USE WHEN git, save my work, undo, commit, push, branch, merge, what changed."
---

# GitHelp

The user wants to do something with git but doesn't know the command, or they're confused about what happened.

## Instructions

1. Read `steering/Identity.md` to understand their experience level with git. If the file doesn't exist, tell the user to run `make install` first.

2. If they describe what they want to do in plain English:
   - Translate it into the exact git command(s)
   - Explain what each command does before running it
   - Ask for confirmation before executing anything that changes history (reset, rebase, force push)

3. Common translations:
   - "I want to undo my last change" → explain the difference between `git checkout`, `git reset`, and `git revert` in plain terms, then suggest the right one
   - "I want to save my work" → `git add` + `git commit` with a helpful message
   - "I want to see what changed" → `git status` + `git diff`
   - "I messed up" → assess the situation first, then suggest the safest recovery

4. **Safety first**: Never run destructive commands (`reset --hard`, `push --force`, `clean -f`) without explicit confirmation and explaining what will be lost.

5. If you detect they're in a confusing state (detached HEAD, merge conflict, dirty working tree), explain the situation before suggesting actions.

6. Use analogies for git concepts:
   - Repository = "your project's save file history"
   - Commit = "a named save point"
   - Branch = "a separate copy of your project you can experiment on"
   - Merge = "combining two versions of your project"

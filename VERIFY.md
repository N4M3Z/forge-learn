# Verify

Instructions for the AI agent. Run these checks when the user asks to verify their setup, or when something isn't working.

## Check 1: Directory Structure

Verify the expected files exist:

```
.claude-plugin/plugin.json    -- plugin manifest (skills discovery)
CLAUDE.md                     -- AI ground rules
rules/Identity.md             -- user identity
rules/Goals.md                -- user goals
rules/Levels.md               -- progression tracking
skills/*/SKILL.md             -- at least 7 skill files
```

If `.claude-plugin/plugin.json` is missing, the plugin won't load. Recreate it:

```json
{
    "name": "forge-learn",
    "version": "0.2.0",
    "description": "Learning-focused AI skills with guided progression",
    "skills": ["./skills"]
}
```

## Check 2: Identity Personalized

Read `rules/Identity.md`. If the name field still says `Your Name`, the user hasn't personalized it yet. Ask them for their name and preferences, then update the file.

## Check 3: Goals Set

Read `rules/Goals.md`. If it still has the example goals ("Learn to build a personal website", etc.), prompt the user to replace them with their actual goals.

## Check 4: Skills Discovery

List the contents of `skills/`. There should be 7 skill directories, each containing a `SKILL.md`. If any are missing, report which ones.

Expected skills: Explain, FixIt, GitHelp, Kickstart, Progress, Summarize, Tour.

## Check 5: Agent Available

Verify `agents/CodeHelper.md` exists (source file). After install (`make install` on POSIX shells, or `install-agents.exe` on Windows PowerShell), it deploys to `.claude/agents/CodeHelper.md`. If the source is missing, the starter agent won't be available for Level 5 progression.

## Reporting Results

After running all checks, present results concisely:

- **Pass**: "Your setup looks good. Everything is in place."
- **Issues found**: List what's wrong and offer to fix each one.
- **Not personalized**: "Your setup works, but you haven't made it yours yet. Want to update your name and goals now?"

If all checks pass and identity is personalized, suggest: "Try `/Progress` to see where you are in the learning path."

# Verify

Instructions for the AI agent. Run these checks when the user asks to verify their setup, or when something isn't working.

## Check 1: Directory Structure

Verify the expected files exist:

```
.claude-plugin/plugin.json    — plugin manifest (skills discovery)
CLAUDE.md                     — AI ground rules
steering/Identity.md          — user identity
steering/Goals.md             — user goals
steering/Levels.md            — progression tracking
skills/*/SKILL.md             — at least 17 skill files
```

If `.claude-plugin/plugin.json` is missing, the plugin won't load. Recreate it:

```json
{
  "name": "forge-user",
  "version": "0.1.0",
  "description": "Personal AI skills — teach your assistant who you are",
  "skills": ["./skills"]
}
```

## Check 2: Identity Personalized

Read `steering/Identity.md`. If the name field still says `Your Name`, the user hasn't personalized it yet. Ask them for their name and preferences, then update the file.

## Check 3: Goals Set

Read `steering/Goals.md`. If it still has the example goals ("Learn to build a personal website", etc.), prompt the user to replace them with their actual goals.

## Check 4: Skills Discovery

List the contents of `skills/`. There should be 17 skill directories, each containing a `SKILL.md`. If any are missing, report which ones.

Expected skills: CleanText, Emojify, Explain, ExplainSimply, FixGrammar, FixIt, GenerateGlossary, GenerateOutline, GitHelp, Kickstart, MakeLonger, MakeShorter, Progress, RewriteAsTweet, Summarize, Tour, Translate.

## Check 5: Agent Available

Verify `.claude/agents/CodeHelper.md` exists. If missing, the starter agent won't be available for Level 5 progression.

## Reporting Results

After running all checks, present results concisely:

- **Pass**: "Your setup looks good. Everything is in place."
- **Issues found**: List what's wrong and offer to fix each one.
- **Not personalized**: "Your setup works, but you haven't made it yours yet. Want to update your name and goals now?"

If all checks pass and identity is personalized, suggest: "Try `/Progress` to see where you are in the learning path."

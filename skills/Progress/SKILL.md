---
name: Progress
version: 0.1.0
description: "Show your current level, what you've unlocked, and what to try next. USE WHEN progress, level, what's next, what should I do, where am I."
---

# Progress

The user wants to see their progression through the forge-learn leveling system. This skill reads their state, shows where they are, and suggests a specific next action.

## Instructions

### Step 1: Read State

Read `rules/Levels.md`. If the file doesn't exist, tell the user to run `make install` first. Count checked (`- [x]`) and unchecked (`- [ ]`) boxes per level. A level is **complete** when all 3 of its checkboxes are checked.

Determine the user's **current level**: the lowest level with at least one unchecked box. If all boxes in all levels are checked, the user has completed the progression.

### Step 2: Show Progress

Present a concise progress summary. Format:

**Level N: [Name]** — [one-line description]
Progress: [checked]/3 complete
[visual: e.g., "~~Discover~~ > ~~Personalize~~ > **Navigate** > Build > Author > Connect > Forge"]

Then show the specific unchecked items for the current level.

### Step 3: Suggest Next Action

Based on the current level, suggest ONE specific action. Be opinionated — name a specific skill and a specific thing to try it on. Do not list options.

**Level 1 suggestions** (rotate based on what's unchecked):
- "Run `/Explain rules/Identity.md` — see how I break down what each section does."
- "Open `skills/Explain/SKILL.md` in your text editor — that's the instruction file I follow. Read through it."
- "Change one line in `skills/Explain/SKILL.md` (e.g., the explanation style), re-run `/Explain`, and see the behavior change."

**Level 2 suggestions:**
- "Open `rules/Identity.md` in your text editor. Change the name to yours, save it. I'll know who you are next session."
- "Now open `rules/Goals.md` and replace the example goals with what you're actually working on."
- "Type `/Tour` — I'll greet you by name and show what you have."

**Level 3 suggestions:**
- "Try `/Explain rules/Identity.md` — you'll see how I read your files and what I understand from them."
- "Type `/GitHelp save my progress` — I'll walk you through making your first save point."
- "Type `/GitHelp what changed` — you'll see everything you've modified since your last save."

**Level 4 suggestions:**
- "Think of something you want to build — a website, a tool, a document template. Type `/Kickstart` and describe it."
- "If something breaks while building, type `/FixIt` and describe the problem."
- "Try `/Summarize` on your project's README — see how it distills the key points."

**Level 5 suggestions:**
- "Create a file called `rules/MyRules.md`. Write one rule — like 'always use British spelling' or 'never add code comments unless I ask.' Save it and test in your next session."
- "Open `agents/CodeHelper.md` — that's a starter agent. A skill tells me what to do; an agent tells me who to be. Try editing it to match your style, or create a new agent for something you need."
- "Look at any skill in `skills/` — open the SKILL.md file. The format is simple: YAML header with name + description, then markdown instructions. Try writing your own in `skills/MySkill/SKILL.md`."

**Level 6 suggestions:**
- "Start with forge-core — the developer toolkit: `git clone --recurse-submodules https://github.com/N4M3Z/forge-core.git modules/forge-core`. Then run `make install` inside it."
- "Try `/BuildSkill` from forge-core — it walks you through creating a new skill with the right structure, frontmatter, and sidecar."
- "Install a second module — try forge-text for text processing, forge-council for code review, forge-avatar for deep identity, or forge-steering for behavioral rules."

**Level 7 suggestions:**
- "Read `modules/forge-core/CONTRIBUTING.md` — it maps the full contribution workflow from fork to PR."
- "Find something to improve. A confusing explanation, a missing edge case, a skill you wish existed. Every module has room to grow."
- "Create your improvement on a branch, run `make test && make lint` to validate, then open a PR on forge-core."

### Step 4: Check for Level Completion

If all boxes in the current level appear to be satisfied based on the conversation context or what you can verify:

1. State the evidence: "You've [specific thing], [specific thing], and [specific thing]."
2. Ask for confirmation: "Ready to mark Level N: [Name] as complete?"
3. **Only after the user confirms**: Edit `rules/Levels.md` to check the three boxes for that level (change `- [ ]` to `- [x]`).
4. Celebrate briefly, then show what Level N+1 brings.

**Never check boxes without user confirmation.** Never check boxes you cannot verify. If uncertain, ask.

### Step 5: Handle Edge Cases

- **User at Level 1 with no history**: Welcome them. Suggest running /Explain on any file as the single best starting point.
- **User skipped levels**: That's fine — levels are guidance, not gates. Acknowledge what they've done and offer to mark completed levels.
- **All levels complete**: Congratulate them. "You've graduated. You can now build skills, agents, and modules — and contribute them back to forge-core. For the full framework with hooks, vault integration, and module dispatch, see [forge-user](https://github.com/N4M3Z/forge-user)."
- **User asks to reset**: They can manually edit rules/Levels.md to uncheck boxes.

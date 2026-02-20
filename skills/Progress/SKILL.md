---
name: Progress
version: 0.1.0
description: "Show your current level, what you've unlocked, and what to try next. USE WHEN progress, level, what's next, what should I do, where am I."
---

# Progress

The user wants to see their progression through the forge-user leveling system. This skill reads their state, shows where they are, and suggests a specific next action.

## Instructions

### Step 1: Read State

Read `steering/Levels.md`. Count checked (`- [x]`) and unchecked (`- [ ]`) boxes per level. A level is **complete** when all 3 of its checkboxes are checked.

Determine the user's **current level**: the lowest level with at least one unchecked box. If all boxes in all levels are checked, the user has completed the progression.

### Step 2: Show Progress

Present a concise progress summary. Format:

**Level N: [Name]** — [one-line description]
Progress: [checked]/3 complete
[visual: e.g., "~~Spark~~ > ~~Shape~~ > **Navigate** > Build > Steer > Connect > Forge"]

Then show the specific unchecked items for the current level.

### Step 3: Suggest Next Action

Based on the current level, suggest ONE specific action. Be opinionated — name a specific skill and a specific thing to try it on. Do not list options.

**Level 1 suggestions** (rotate based on what's unchecked):
- "Paste a paragraph into the chat and type `/Summarize` — you'll see it condensed to key points."
- "Copy an email or article and try `/ExplainSimply` — it rewrites it so anyone can understand."
- "Try `/Translate Spanish` with any text — instant translation."

**Level 2 suggestions:**
- "Open `steering/Identity.md` in your text editor. Change the name to yours, save it. I'll know who you are next session."
- "Now open `steering/Goals.md` and replace the example goals with what you're actually working on."
- "Type `/Tour` — I'll greet you by name and show what you have."

**Level 3 suggestions:**
- "Try `/Explain steering/Identity.md` — you'll see how I read your files and what I understand from them."
- "Type `/GitHelp save my progress` — I'll walk you through making your first save point."
- "Type `/GitHelp what changed` — you'll see everything you've modified since your last save."

**Level 4 suggestions:**
- "Think of something you want to build — a website, a tool, a document template. Type `/Kickstart` and describe it."
- "If something breaks while building, type `/FixIt` and describe the problem."
- "Try `/RewriteAsTweet` on your project's description — practice sharing your work."

**Level 5 suggestions:**
- "Create a file called `steering/MyRules.md`. Write one rule — like 'always use British spelling' or 'never add code comments unless I ask.' Save it and test in your next session."
- "Open `.claude/agents/CodeHelper.md` — that's a starter agent. A skill tells me what to do; an agent tells me who to be. Try editing it to match your style, or create a new agent for something you need."
- "Look at any skill in `skills/` — open the SKILL.md file. The format is simple: YAML header with name + description, then markdown instructions. Try writing your own in `skills/MySkill/SKILL.md`."

**Level 6 suggestions:**
- "Browse modules at github.com/N4M3Z. Each one adds new capabilities — councils for code review, avatar for deep identity, steering for behavioral rules."
- "Pick a module and install it: `git clone https://github.com/N4M3Z/forge-council.git modules/forge-council`. The module's skills appear automatically."
- "Run a skill from your installed module. Check its README for what's available."

**Level 7 suggestions:**
- "Pick a module you've been using. Read its skills/ directory — each SKILL.md is just instructions you can read and understand."
- "Find something to improve. A confusing explanation, a missing edge case, a skill you wish existed. Every module has room to grow."
- "Share your improvement — open an issue, submit a pull request, or message the author directly."

### Step 4: Check for Level Completion

If all boxes in the current level appear to be satisfied based on the conversation context or what you can verify:

1. State the evidence: "You've [specific thing], [specific thing], and [specific thing]."
2. Ask for confirmation: "Ready to mark Level N: [Name] as complete?"
3. **Only after the user confirms**: Edit `steering/Levels.md` to check the three boxes for that level (change `- [ ]` to `- [x]`).
4. Celebrate briefly, then show what Level N+1 brings.

**Never check boxes without user confirmation.** Never check boxes you cannot verify. If uncertain, ask.

### Step 5: Handle Edge Cases

- **User at Level 1 with no history**: Welcome them. Suggest /ExplainSimply as the single best starting point.
- **User skipped levels**: That's fine — levels are guidance, not gates. Acknowledge what they've done and offer to mark completed levels.
- **All levels complete**: Congratulate them. Mention forge-core as the next frontier: "You've graduated. The developer framework at github.com/N4M3Z/forge-core has hooks, automation, and power tools for everything you've learned here."
- **User asks to reset**: They can manually edit steering/Levels.md to uncheck boxes.

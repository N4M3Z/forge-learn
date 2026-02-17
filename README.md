# forge-user

A set of plain text files that teach your AI assistant who you are.

You edit a file. The AI reads it. That's all that happens.

## What Is This?

When you use an AI coding tool like [Claude Code](https://claude.ai/code), every conversation starts from scratch — the AI doesn't know your name, your preferences, or what you're working on. You repeat yourself every session.

**forge-user fixes that.** It's a collection of plain text files that your AI reads automatically. You tell it who you are once, and it remembers. You add skills — small instruction files — and it learns new abilities.

Everything here is a text file you can open, read, and edit. No magic, no hidden configuration, no compilation. If you can edit a document, you can customize your AI.

## What's Inside

```
steering/      ← Who you are and what you care about
skills/        ← What your AI can do (commands you can run)
modules/       ← Optional add-ons (empty for now)
```

**Steering** is your identity. Open `steering/Identity.md`, change the name to yours, and save. Next session, your AI greets you by name.

**Skills** are actions. Type `/Tour` and your AI walks you through everything. Type `/Explain` and it breaks down any file or error in plain language.

## Quick Start

**What you need first**: [Git](https://git-scm.com/downloads) and [Claude Code](https://docs.anthropic.com/en/docs/claude-code). See [INSTALL.md](INSTALL.md) for step-by-step instructions if you haven't installed these yet.

1. **Download this project.** Open a terminal (Mac: Terminal app, Windows: PowerShell) and paste:
   ```
   git clone https://github.com/N4M3Z/forge-user.git
   cd forge-user
   ```
   This creates a `forge-user` directory on your computer and moves into it.

2. **Make it yours.** Open `steering/Identity.md` in any text editor (VS Code, Notepad, TextEdit — anything). Change `Your Name` to your actual name and save the file.

3. **Start Claude Code** from inside this directory:
   ```
   claude
   ```

4. **Type `/Tour`** — your AI will introduce itself and show you what's available.

That's it. You're set up.

## Available Skills

| Skill | What it does |
|-------|-------------|
| `/Tour` | Walks you through your setup and available skills |
| `/Progress` | Shows your current level and suggests what to try next |
| `/Explain` | Explains any file, error, or concept in plain language |
| `/ExplainSimply` | Rewrites complex content in simple, accessible language |
| `/FixIt` | Diagnoses problems and proposes fixes |
| `/GitHelp` | Translates plain English into git commands |
| `/Kickstart` | Turns "I want to build X" into a plan with starter files |
| `/Summarize` | Extracts key points into a structured summary |
| `/Translate` | Translates text into any target language |
| `/FixGrammar` | Fixes grammar and spelling, preserves everything else |
| `/MakeLonger` | Expands text to roughly twice its length |
| `/MakeShorter` | Condenses text to roughly half its length |
| `/Emojify` | Adds context-appropriate emojis at natural break points |
| `/CleanText` | Strips URLs, HTML tags, and other noise from text |
| `/GenerateGlossary` | Creates an alphabetical glossary of key terms |
| `/GenerateOutline` | Generates a hierarchical outline from any document |
| `/RewriteAsTweet` | Rewrites content as a tweet or tweet thread |

## Learning Path

forge-user has a 7-level progression from first prompt to ecosystem contributor. Type `/Progress` anytime to see where you are and what to try next.

| Level | Name | What you learn |
|-------|------|---------------|
| 1 | Spark | Transform text — summarize, translate, simplify |
| 2 | Shape | Personalize your AI — it learns who you are |
| 3 | Navigate | Work with files and save your progress |
| 4 | Build | Create projects from ideas |
| 5 | Steer | Write custom rules that change AI behavior |
| 6 | Connect | Expand with optional modules |
| 7 | Forge | Contribute improvements to the ecosystem |

See `steering/Levels.md` for the full roadmap with progress tracking.

## How It Works

Your AI tool (Claude Code, etc.) reads the files in this directory at the start of every session:

- `CLAUDE.md` tells it the ground rules
- `steering/Identity.md` tells it who you are
- `steering/Goals.md` tells it what you're working toward
- `skills/*/SKILL.md` gives it abilities you can invoke by name

You change a file, the AI's behavior changes. That's the entire system.

## Privacy Note

The `steering/` files are yours to edit with personal information (your name, goals, preferences). If you plan to push this repository to a public GitHub account, be aware that anything you write in these files will be visible. Consider keeping your fork private, or review your steering files before pushing.

## Want More?

Once you're comfortable, you can expand your setup with optional modules. See [INSTALL.md](INSTALL.md) for recommendations.

## Requirements

- [Git](https://git-scm.com/downloads) — to download and manage this repository
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — the AI tool that reads these files (native binary, no Node.js needed)
- A text editor — anything works (VS Code, Notepad, TextEdit, Sublime, vim)
- **Windows**: Works natively on Windows 10+. See [INSTALL.md](INSTALL.md) for setup details.

## License

[EUPL 1.2](LICENSE)

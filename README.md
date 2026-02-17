# forge-user

A set of plain text files that teach your AI assistant who you are.

You edit a file. The AI reads it. That's all that happens.

## What Is This?

When you use an AI coding tool like [Claude Code](https://claude.ai/code), every conversation starts from scratch — the AI doesn't know your name, your preferences, or what you're working on. You repeat yourself every session.

**forge-user fixes that.** It's a collection of plain text files that your AI reads automatically. You tell it who you are once, and it remembers. You add skills — small instruction files — and it learns new abilities.

Everything here is a text file you can open, read, and edit. No magic, no hidden configuration, no compilation. If you can edit a document, you can customize your AI.

## Supported Tools

forge-user works with any AI coding tool that reads project markdown files:

| Tool | Platform | Notes |
|------|----------|-------|
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | Mac, Linux, Windows | Full plugin support — skills auto-discovered |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | Mac, Linux, Windows | Reads CLAUDE.md, compatible with skill files |
| [Codex CLI](https://github.com/openai/codex) | Mac, Linux, Windows (experimental) | OpenAI's coding agent |
| [OpenCode](https://opencode.ai) | Mac, Linux, Windows | Open-source, 75+ LLM providers |
| [GitHub Copilot](https://github.com/features/copilot) | All platforms via IDE | Reads project instructions from markdown |

## What's Inside

```
steering/      ← Who you are and what you care about
skills/        ← What your AI can do (commands you can run)
modules/       ← Optional add-ons (empty for now)
.claude/       ← Agents (AI personas you can invoke)
```

**Steering** is your identity. Open `steering/Identity.md`, change the name to yours, and save. Next session, your AI greets you by name.

**Skills** are actions. Type `/Tour` and your AI walks you through everything. Type `/Explain` and it breaks down any file or error in plain language.

**Agents** are personas. The starter agent `CodeHelper` explains broken code in plain language. You can edit it or create your own.

## Quick Start

### 1. Install an AI coding tool

Pick any tool from the table above. For Claude Code:

**Mac / Linux:**
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://claude.ai/install.ps1 | iex
```

**Mac (Homebrew):**
```bash
brew install --cask claude-code
```

**Windows (WinGet):**
```powershell
winget install Anthropic.ClaudeCode
```

No Node.js or npm needed — Claude Code is a native binary.

### 2. Download this project

Open a terminal (Mac: Terminal app, Windows: PowerShell or Git Bash) and paste:

```bash
git clone https://github.com/N4M3Z/forge-user.git
cd forge-user
```

This creates a `forge-user` directory on your computer and moves into it.

> **Don't have Git?** Mac: type `git --version` in Terminal and macOS will prompt you to install it. Windows: download from [git-scm.com](https://git-scm.com/downloads/win).

### 3. Make it yours

Open `steering/Identity.md` in any text editor (VS Code, Notepad, TextEdit — anything). Change `Your Name` to your actual name and save the file.

### 4. Start your AI tool

From inside the `forge-user` directory:

```bash
claude
```

### 5. Type `/Tour`

Your AI will introduce itself and show you what's available.

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
| 5 | Steer | Write custom rules, skills, and agents |
| 6 | Connect | Expand with optional modules |
| 7 | Forge | Contribute improvements to the ecosystem |

See `steering/Levels.md` for the full roadmap with progress tracking.

## How It Works

Your AI tool reads the files in this directory at the start of every session:

- `CLAUDE.md` tells it the ground rules
- `steering/Identity.md` tells it who you are
- `steering/Goals.md` tells it what you're working toward
- `skills/*/SKILL.md` gives it abilities you can invoke by name
- `.claude/agents/*.md` gives it personas it can adopt

You change a file, the AI's behavior changes. That's the entire system.

## Privacy Note

The `steering/` files are yours to edit with personal information (your name, goals, preferences). If you plan to push this repository to a public GitHub account, be aware that anything you write in these files will be visible. Consider keeping your fork private, or review your steering files before pushing.

## Want More?

Once you're comfortable, you can expand your setup with optional modules:

| Module | What it adds |
|--------|-------------|
| [forge-council](https://github.com/N4M3Z/forge-council) | Multi-specialist code review — a panel of experts debates your changes |
| [forge-avatar](https://github.com/N4M3Z/forge-avatar) | Deep identity — digital avatar, beliefs, strategies, communication preferences |
| [forge-steering](https://github.com/N4M3Z/forge-steering) | Behavioral rules — teach your AI what to do and what to avoid |

Clone a module into `modules/` and ask your AI to help set it up. For automated module management, see [forge-core](https://github.com/N4M3Z/forge-core).

## Requirements

- [Git](https://git-scm.com/downloads) — to download and manage this repository
- Any [supported AI coding tool](#supported-tools) — Claude Code, Gemini CLI, Codex, OpenCode, or Copilot
- A text editor — anything works (VS Code, Notepad, TextEdit, Sublime, vim)

## License

[EUPL 1.2](LICENSE)

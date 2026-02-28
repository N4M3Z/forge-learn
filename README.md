# forge-learn

Learn to customize your AI by editing text files.

You edit a file. The AI reads it. That's all that happens.

## What Is This?

When you use an AI coding tool like [Claude Code](https://claude.ai/code), every conversation starts from scratch — the AI doesn't know your name, your preferences, or what you're working on. You repeat yourself every session.

**forge-learn fixes that.** It's a collection of plain text files that your AI reads automatically. You tell it who you are once, and it remembers. You add skills — small instruction files — and it learns new abilities.

Everything here is a text file you can open, read, and edit. No magic, no hidden configuration, no compilation. If you can edit a document, you can customize your AI.

## Supported Tools

forge-learn is built for **[Claude Code](https://docs.anthropic.com/en/docs/claude-code)** — skills are auto-discovered and slash commands (`/Tour`, `/Explain`, etc.) work out of the box.

The steering files (`steering/Identity.md`, `Goals.md`) and `CLAUDE.md` are plain markdown, so they're useful with other AI coding tools too — but skill discovery varies:

| Tool | Reads CLAUDE.md | Skills as /commands | Install |
|------|----------------|---------------------|---------|
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | Yes | Yes (full plugin support) | `curl -fsSL https://claude.ai/install.sh \| bash` |
| [OpenCode](https://opencode.ai) | Yes (fallback) | Partial (`.claude/skills/`) | `curl -fsSL https://opencode.ai/install \| bash` |
| [Codex CLI](https://github.com/openai/codex) | No (uses AGENTS.md) | No (Uses $Skill "command" instead) | See [Codex docs](https://developers.openai.com/codex) |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | No (uses GEMINI.md) | No | See [Gemini CLI docs](https://github.com/google-gemini/gemini-cli) |
| [GitHub Copilot](https://github.com/features/copilot) | No (uses .github/copilot-instructions.md) | No | Via IDE |

For tools that don't read `CLAUDE.md`, you can copy the content into their instruction file format (e.g., `AGENTS.md` for Codex, `GEMINI.md` for Gemini CLI).

## What's Inside

```
steering/      <- Who you are and what you care about (templates checked in, personal copies gitignored)
skills/        <- What your AI can do (commands you can run)
agents/        <- AI personas (e.g., CodeHelper)
modules/       <- Optional add-ons (empty for now)
```

**Steering** is your identity. Run `make install` to generate your personal steering files from templates, then edit `steering/Identity.md` with your name. Next session, your AI greets you by name.

**Skills** are actions. Type `/Tour` and your AI walks you through everything. Type `/Explain` and it breaks down any file or error in plain language.

**Agents** are personas. The starter agent `CodeHelper` explains broken code in plain language. You can edit it or create your own.

## Quick Start

### 1. Install Claude Code

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

### 2. Download this project

Open a terminal (Mac: Terminal app, Windows: PowerShell or Git Bash) and paste:

```bash
git clone https://github.com/N4M3Z/forge-learn.git
cd forge-learn
```

This creates a `forge-learn` directory on your computer and moves into it.

> **Don't have Git?** Mac: type `git --version` in Terminal and macOS will prompt you to install it. Windows: download from [git-scm.com](https://git-scm.com/downloads/win).

### 3. Set up

**Let your AI do it** (recommended): Start Claude Code and ask it to follow [INSTALL.md](INSTALL.md) — it checks prerequisites, personalizes your identity files, deploys skills, and runs `/Tour`.

```bash
claude
# then tell it: "Set up forge-learn for me. Follow INSTALL.md."
```

**Or do it yourself:**

1. Deploy agents and skills:
   - Mac/Linux/WSL/Git Bash: run `make install` — this generates your personal steering files from templates and deploys agents and skills
   - Windows PowerShell fallback: run the Windows block in [INSTALL.md](INSTALL.md) (`cargo build --release` + `install-*.exe`)
2. Open `steering/Identity.md` in any text editor — change `Your Name` to your actual name and save
3. Open `steering/Goals.md` — replace the example goals with yours
4. Start Claude Code: `claude`
5. Type `/Tour`

That's it. You're set up.

### Optional: Make skills available everywhere

By default, skills only work inside the `forge-learn` directory. To use `/Explain`, `/GitHelp`, and other skills in any project:

```bash
make install SCOPE=user
```

This installs skills globally so they're available whenever you run `claude`, regardless of which project you're in.

## Available Skills

| Skill | What it does |
|-------|-------------|
| `/Tour` | Walks you through your setup and available skills |
| `/Progress` | Shows your current level and suggests what to try next |
| `/Explain` | Explains any file, error, or concept in plain language |
| `/FixIt` | Diagnoses problems and proposes fixes |
| `/GitHelp` | Translates plain English into git commands |
| `/Kickstart` | Turns "I want to build X" into a plan with starter files |
| `/Summarize` | Extracts key points into a structured summary |

## Learning Path

forge-learn has a 7-level progression from your first skill modification to ecosystem contributor. Type `/Progress` anytime to see where you are and what to try next.

| Level | Name | What you learn |
|-------|------|---------------|
| 1 | Discover | Run a skill, read its source, change one line |
| 2 | Personalize | Edit identity files, see the AI adapt to you |
| 3 | Navigate | Work with files and save your progress |
| 4 | Build | Create projects from ideas |
| 5 | Author | Write custom rules, skills, and agents |
| 6 | Connect | Expand with optional modules |
| 7 | Forge | Contribute improvements to the ecosystem |

See `steering/Levels.md` for the full roadmap with progress tracking. This file is generated from a template by `make install` — your progress is local and won't be pushed to git.

## How It Works

Your AI tool reads the files in this directory at the start of every session:

- `CLAUDE.md` tells it the ground rules
- `steering/Identity.md` tells it who you are
- `steering/Goals.md` tells it what you're working toward
- `skills/*/SKILL.md` gives it abilities you can invoke by name
- `agents/*.md` gives it personas it can adopt (deployed by `make install` or Windows fallback commands in `INSTALL.md`)

You change a file, the AI's behavior changes. That's the entire system.

## Privacy Note

Your personal steering files (`steering/Identity.md`, `Goals.md`, `Levels.md`) are gitignored by default — they won't be pushed to a public repository. Only the `.template` files (with placeholder values) are checked into git. If you add other files to `steering/` (like `MyRules.md`), review them before pushing.

## Want More?

Once you're comfortable, expand your setup with optional modules:

| Module | What it adds |
|--------|-------------|
| [forge-text](https://github.com/N4M3Z/forge-text) | 12 text processing skills — translate, simplify, grammar fix, expand, condense, and more |
| [forge-council](https://github.com/N4M3Z/forge-council) | Multi-specialist code review — a panel of experts debates your changes |
| [forge-avatar](https://github.com/N4M3Z/forge-avatar) | Deep identity — digital avatar, beliefs, strategies, communication preferences |
| [forge-steering](https://github.com/N4M3Z/forge-steering) | Behavioral rules — teach your AI what to do and what to avoid |

Clone a module into `modules/` and ask your AI to help set it up. For automated module management, see [forge-user](https://github.com/N4M3Z/forge-user).

## Requirements

- [Git](https://git-scm.com/downloads) — to download and manage this repository
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — the AI tool that reads these files
- A text editor — anything works (VS Code, Notepad, TextEdit, Sublime, vim)
- Rust toolchain (`cargo`) for first-time local binary builds (`lib/`)
- **Windows**: Works natively on Windows 10+. `make` recipes are POSIX-style; use WSL/Git Bash for `make install`, or use the PowerShell fallback in [INSTALL.md](INSTALL.md).

## License

[EUPL 1.2](LICENSE)

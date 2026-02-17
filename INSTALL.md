# Installation

## Prerequisites

You need two things:

1. **Git** — downloads and tracks your files
   - **Mac**: Open Terminal (find it in Applications > Utilities), type `git --version`. If it's not installed, macOS will prompt you to install it.
   - **Windows**: Download from [git-scm.com](https://git-scm.com/downloads/win). During setup, keep all defaults — this also installs Git Bash, which Claude Code uses.
   - **Linux**: `sudo apt install git` (Ubuntu/Debian) or `sudo dnf install git` (Fedora)

2. **An AI coding tool** — the engine that reads your files

### Installing Claude Code

Claude Code is a native binary — no Node.js, no package manager needed.

**Mac / Linux:**
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://claude.ai/install.ps1 | iex
```

**Windows (CMD):**
```batch
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd
```

**Mac (Homebrew):**
```bash
brew install --cask claude-code
```

**Windows (WinGet):**
```powershell
winget install Anthropic.ClaudeCode
```

See the [Claude Code setup docs](https://docs.anthropic.com/en/docs/claude-code) for more options.

### Windows without WSL

Claude Code runs natively on Windows 10 (1809+) and Windows Server 2019+. You need [Git for Windows](https://git-scm.com/downloads/win) installed — Claude Code uses Git Bash for shell operations.

If you prefer a Unix-like environment, [WSL 2](https://learn.microsoft.com/en-us/windows/wsl/install) works well. Install WSL, then follow the Mac/Linux instructions inside your WSL terminal.

### Alternative tools

forge-user works with any AI coding tool that reads `CLAUDE.md` and discovers skills from `.claude-plugin/plugin.json`. If Claude Code isn't available on your platform:

| Tool | Install | Notes |
|------|---------|-------|
| [OpenCode](https://opencode.ai) | `curl -fsSL https://opencode.ai/install \| bash` | Open-source, 75+ LLM providers, native Windows/Mac/Linux |
| [Codex CLI](https://github.com/openai/codex) | See GitHub README | OpenAI's equivalent |

## Setup

These instructions assume you have a terminal open (Mac: Terminal app, Windows: PowerShell or Git Bash).

```bash
# 1. Download the project
git clone https://github.com/N4M3Z/forge-user.git
cd forge-user

# 2. Open steering/Identity.md in your editor and change "Your Name" to yours

# 3. Start Claude Code from inside this directory
claude

# 4. Type /Tour to see what you have
```

**What "clone" means**: `git clone` copies the project from GitHub to your computer. You'll get a directory called `forge-user` with all the files in it. `cd forge-user` moves into that directory.

## Verify Your Setup

After starting Claude Code, follow the checks in [VERIFY.md](VERIFY.md) to confirm everything works.

## Optional Modules

Once you're comfortable with the basics, you can add modules to expand your AI's capabilities. Modules are independent repositories you clone into the `modules/` directory.

### Recommended Modules

| Module | What it adds |
|--------|-------------|
| [forge-council](https://github.com/N4M3Z/forge-council) | Multi-specialist code review — your AI convenes a panel of experts to debate changes |
| [forge-avatar](https://github.com/N4M3Z/forge-avatar) | Deep identity — digital avatar, beliefs, strategies, communication preferences |
| [forge-steering](https://github.com/N4M3Z/forge-steering) | Behavioral rules — teach your AI what to do and what to avoid |

### Installing a Module

```bash
# From your forge-user directory:
cd modules
git clone https://github.com/N4M3Z/forge-council.git
```

After cloning a module, ask your AI to install it for you:

> "I cloned forge-council into modules/. Can you help me set it up?"

Your AI will read the module's README and walk you through any setup steps. Some modules are standalone Claude Code plugins — check each module's README for instructions.

For automated module management (hook-based dispatch, skill discovery across modules), see [forge-core](https://github.com/N4M3Z/forge-core) below.

## Upgrading to forge-core

If you outgrow forge-user and want the full developer framework (hook system, automated dispatching, Rust-powered tools, multi-vault support), see [forge-core](https://github.com/N4M3Z/forge-core). forge-user skills and steering files are compatible — you can migrate without starting over.

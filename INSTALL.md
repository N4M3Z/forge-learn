# Install

> **This file is for AI agents.** The user's README tells them to point you here. When the user asks to set up forge-learn or troubleshoot their installation, follow these steps.

## Prerequisites Check

Before setup, verify the user has what they need:

1. **Git**: Run `git --version`. If missing, guide them:
   - Mac: "macOS will prompt you to install developer tools -- say yes"
   - Windows: "Download Git from git-scm.com/downloads/win -- keep all defaults during setup"
   - Linux: `sudo apt install git` or `sudo dnf install git`

2. **Claude Code** (or compatible tool): The user is already running it if they're talking to you. If they're setting up for the first time, recommend the native installer:
   - Mac/Linux: `curl -fsSL https://claude.ai/install.sh | bash`
   - Windows PowerShell: `irm https://claude.ai/install.ps1 | iex`
   - Mac Homebrew: `brew install --cask claude-code`
   - Windows WinGet: `winget install Anthropic.ClaudeCode`

3. **Build tooling** (needed on first install to build `forge-lib` binaries):
   - Mac/Linux: ensure `make` and `cargo` are available.
   - Windows: prefer WSL or Git Bash for `make` targets. If staying in PowerShell, use the fallback commands below.
   - Windows install helpers:
     - Rust: `winget install -e --id Rustlang.Rustup`
     - Make: `winget install -e --id ezwinports.make`


## Build and Deploy

If the user wants to deploy agents and skills to all providers, first ask where they want skills installed:

- **Workspace** (this project only): `make install SCOPE=workspace`
- **Global** (all projects): `make install SCOPE=user`

Most users want global — skills like `/Explain` and `/GitHelp` are useful everywhere.

For first-time setup, initialize forge-lib before running the install command:

### POSIX shells (macOS/Linux/WSL/Git Bash)

```bash
git submodule update --init lib     # initialize forge-lib (first time only)
make -C lib build                   # build Rust binaries (first time only)
make verify                         # confirm everything deployed
```

### Windows PowerShell fallback

Use this if `make install` fails due POSIX shell syntax (`if [ ... ]`, `for ...; do`, `ln -sf`, `mkdir -p`):

```powershell
git submodule update --init lib
$env:PATH = "$env:USERPROFILE\.cargo\bin;$env:PATH"
cargo build --release --manifest-path lib/Cargo.toml

.\lib\target\release\install-agents.exe agents --scope workspace
.\lib\target\release\install-skills.exe skills --provider claude --scope workspace
.\lib\target\release\install-skills.exe skills --provider codex --scope workspace
.\lib\target\release\install-skills.exe skills --provider opencode --scope workspace

if (Get-Command gemini -ErrorAction SilentlyContinue) {
  .\lib\target\release\install-skills.exe skills --provider gemini --scope workspace
} else {
  Write-Host "skip gemini skill install (gemini CLI not installed)"
}
```

PowerShell verification quick check:

```powershell
Get-ChildItem .claude\agents,.gemini\agents,.codex\agents,.opencode\agents
Get-ChildItem .claude\skills,.codex\skills,.opencode\skills
Select-String -Path .codex\config.toml -Pattern '\[agents\.CodeHelper\]'
```

## First-Time Setup

If the user just cloned the repo and is starting for the first time:

1. Check if `steering/Identity.md` still has placeholder values (`Your Name`, `beginner`, etc.). If so, ask the user for their name and preferences, then update the file for them.

2. Check if `steering/Goals.md` still has the example goals. If so, ask what they're working toward and update it.

3. Run `/Tour` to introduce them to the setup.

## Module Installation

When the user wants to install a module from `modules/`:

1. The module is a separate repository cloned into `modules/`. It may have its own `.claude-plugin/plugin.json` or skills directory.

2. Read the module's README for setup instructions. Some modules are standalone Claude Code plugins that need to be registered separately.

3. forge-learn's `plugin.json` only discovers skills from `./skills` — module skills are NOT auto-discovered. If the module has skills the user wants available as slash commands, explain that they need to either:
   - Run the module as a separate Claude Code plugin
   - Copy specific skills into `skills/` (not recommended — breaks updates)
   - Upgrade to [forge-user](https://github.com/N4M3Z/forge-user) for automated module dispatch

## Recommended Modules

| Module | What it adds |
|--------|-------------|
| [forge-text](https://github.com/N4M3Z/forge-text) | 12 text processing skills — translate, simplify, grammar fix, expand, condense, and more |
| [forge-council](https://github.com/N4M3Z/forge-council) | Multi-specialist code review — convenes a panel of experts to debate changes |
| [forge-avatar](https://github.com/N4M3Z/forge-avatar) | Deep identity — digital avatar, beliefs, strategies, communication preferences |
| [forge-steering](https://github.com/N4M3Z/forge-steering) | Behavioral rules — teach your AI what to do and what to avoid |

## Upgrading to forge-user

If the user outgrows forge-learn (wants hooks, automated dispatching, Rust-powered tools, multi-vault support), point them to [forge-user](https://github.com/N4M3Z/forge-user). Their steering files and skills are compatible — migration doesn't require starting over.

## Platform Notes

- **Windows**: Claude Code runs natively on Windows 10 (1809+). Requires [Git for Windows](https://git-scm.com/downloads/win) for shell operations. WSL 2 also works. If running from PowerShell, `make` targets may fail unless invoked through a POSIX shell; use the PowerShell fallback in this file.
- **Other tools**: The steering files and CLAUDE.md are plain markdown — useful with any AI tool. [OpenCode](https://opencode.ai) reads CLAUDE.md as a fallback. For [Codex CLI](https://developers.openai.com/codex) (uses AGENTS.md) or [Gemini CLI](https://github.com/google-gemini/gemini-cli) (uses GEMINI.md), copy CLAUDE.md content into the tool's instruction file format. Skill slash commands only work in Claude Code.

# AGENTS.md -- forge-user

> Personal AI skills and identity for beginners. 20 skills covering text
> transformation, code assistance, project scaffolding, and meta-learning.
> Multi-provider support: Claude Code, Gemini CLI, Codex, OpenCode.

## Install / Verify

```bash
make install          # deploy skills to all providers
make verify           # check skills deployed across all providers
make test             # validate-module convention checks
make clean            # remove installed skills
```

## Project Structure

```
skills/                   20 skill directories (SKILL.md + SKILL.yaml each)
steering/
  Identity.md             User identity (name, preferences, experience)
  Goals.md                User goals and priorities
  Levels.md               7-level progression roadmap
modules/                  Optional add-on modules (empty by default)
.claude/agents/
  CodeHelper.md           Starter agent for code explanation
lib/                      git submodule -> forge-lib (Rust binaries)
.claude-plugin/
  plugin.json             Claude Code plugin manifest
defaults.yaml             Provider-keyed skill roster (allowlists)
config.yaml               User overrides (gitignored)
module.yaml               Module metadata (name, version)
Makefile                  Multi-provider install, verify, test, clean
```

## Skills

| Skill | Purpose |
|-------|---------|
| **Tour** | Walk through setup, directories, and available skills |
| **Progress** | Show current level and suggest next steps (Claude only) |
| **Explain** | Explain any file, error, or concept in plain language |
| **ExplainSimply** | Rewrite complex content in simple, accessible language |
| **FixIt** | Diagnose problems and propose fixes |
| **GitHelp** | Translate plain English into git commands |
| **Kickstart** | Turn "I want to build X" into a plan with starter files |
| **Summarize** | Extract key points into a structured summary |
| **Translate** | Translate text into any target language |
| **FixGrammar** | Fix grammar and spelling, preserve everything else |
| **MakeLonger** | Expand text to roughly twice its length |
| **MakeShorter** | Condense text to roughly half its length |
| **Emojify** | Add context-appropriate emojis at natural break points |
| **CleanText** | Strip URLs, HTML tags, and noise from text |
| **GenerateGlossary** | Create an alphabetical glossary of key terms |
| **GenerateOutline** | Generate a hierarchical outline from any document |
| **RewriteAsTweet** | Rewrite content as a tweet or tweet thread |
| **Pandoc** | Convert documents between formats via pandoc |
| **HighImpactChanges** | Identify highest-impact changes in a codebase |

### Provider Routing

`defaults.yaml` uses provider-keyed allowlists. Most skills deploy to all
providers. **Progress** is Claude-only (uses Claude Code progression features).

## Skill File Convention

Each skill directory contains:
- `SKILL.md` -- AI instructions with YAML frontmatter (name, description, version)
- `SKILL.yaml` -- deployment metadata (name, description)
- Optional `sample.md` demo files

## Consuming as Submodule

```bash
git submodule add https://github.com/N4M3Z/forge-user.git modules/forge-user
```

### Makefile Integration

```makefile
install-forge-user:
	@$(MAKE) -C modules/forge-user install SCOPE=$(SCOPE)
```

## Configuration

- `defaults.yaml`: provider-keyed skill roster (committed)
- `config.yaml`: user overrides (gitignored), same structure as defaults
- `module.yaml`: module metadata (name, version, description)

## Development Conventions

- **Skill naming**: PascalCase directories (`FixGrammar/`), matching `name:` in SKILL.md frontmatter
- **Config override**: `config.yaml` (gitignored) overrides `defaults.yaml`
- **forge-lib**: Consumed as git submodule at `lib/`, provides `install-skills` and `validate-module`

## Git Conventions

Conventional Commits: `type: description`. Lowercase, no trailing period, no scope.

Types: `feat`, `fix`, `docs`

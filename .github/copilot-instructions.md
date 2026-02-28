# Copilot Instructions

forge-learn is a learning-focused personal AI setup module. It provides 7 skills, 1 agent, identity steering files, and a 7-level progression system.

## Structure

- `skills/` -- 7 skill directories, each with SKILL.md (instructions) and SKILL.yaml (sidecar metadata)
- `agents/` -- Agent source files (CodeHelper.md)
- `rules/` -- User identity (Identity.md), goals (Goals.md), progression (Levels.md)
- `defaults.yaml` -- Skill roster, agent config, provider model mapping
- `lib/` -- forge-lib git submodule (Rust binaries for deployment)

## Conventions

- Skill names use PascalCase matching directory names
- Agent names use PascalCase matching filenames
- SKILL.yaml carries `sources:` and provider config -- never duplicates name/description from SKILL.md
- Agent frontmatter has name, version, description only -- model/tools live in defaults.yaml
- `config.yaml` (gitignored) overrides `defaults.yaml` (committed)

## Build

```bash
make install    # deploy agents + skills to all providers
make verify     # check deployment
make test       # validate-module convention checks
make lint       # mdschema + shellcheck
```

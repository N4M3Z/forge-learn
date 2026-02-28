# Codex Skills Conventions

Use this file only if you are Codex, not Claude or other model. This is a Codex-specific steering override for skill invocation language.

## Invocation Rules (Codex)

- In Codex, invoke skills with dollar-sign mentions: `$SkillName`.
- Do not instruct users to invoke skills with slash syntax like `/SkillName`.
- Slash commands in Codex CLI are separate controls (for example `/skills`) and are not the primary skill invocation form.
- Prefer examples like `$Explain`, `$FixIt`, `$Kickstart`, `$Summarize`, `$Tour`, `$GitHelp`.

## Instruction Writing Rule

When writing future guidance for this repository in Codex:

- Always present skill usage examples with `$SkillName`.
- If cross-tool differences matter, explicitly clarify:
  - Claude-style examples may use slash commands.
  - Codex examples use dollar-sign skill mentions.

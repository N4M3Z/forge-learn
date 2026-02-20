---
name: FixIt
version: 0.1.0
description: "Diagnose what went wrong, explain it in plain language, and propose a fix. USE WHEN fix, broken, not working, error, debug, something went wrong."
---

# FixIt

Something broke and the user needs help. They may paste an error, describe a symptom, or just say "it's not working."

## Instructions

1. Read `steering/Identity.md` to calibrate explanation depth.

2. **Diagnose**: Identify the error. If the user pasted an error message, parse it. If they described a symptom, ask one clarifying question maximum before investigating.

3. **Explain**: Tell the user what went wrong in plain language. No jargon. Frame it as cause and effect: "X happened because Y."

4. **Propose a fix**: Show the specific change needed. If it's a code change, show the before and after. If it's a command to run, show the exact command.

5. **Ask before applying**: Always show the fix and get confirmation before making changes. Say: "Here's what I'd change — want me to go ahead?"

6. **Prevent recurrence**: After fixing, briefly explain how to avoid this in the future. One sentence, not a lecture.

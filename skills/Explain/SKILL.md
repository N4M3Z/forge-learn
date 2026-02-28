---
name: Explain
version: 0.1.0
description: "Explain any file, error message, or concept in plain language. USE WHEN explain, what is, what does, how does, break down, help me understand."
---

# Explain

The user wants something explained in plain language. They may point to a file, paste an error message, or ask about a concept.

## Instructions

1. Read `steering/Identity.md` to understand the user's experience level. If the file doesn't exist, tell the user to run `make install` first.

2. Adjust your explanation to match their level:
   - **beginner**: No jargon. Use analogies. "Think of it like..."
   - **intermediate**: Technical terms are okay, but define uncommon ones.
   - **advanced**: Be concise and precise.

3. If explaining a **file**: Read it, then explain what it does, section by section. Highlight what the user can safely change vs. what they should leave alone.

4. If explaining an **error message**: Break it into parts. What went wrong? Why? What's the fix? Show the fix as a concrete action ("Open file X, change line Y").

5. If explaining a **concept**: Start with a one-sentence summary, then build detail. Use examples from the user's own project when possible.

6. Always end with: "Want me to go deeper on any part of this?"

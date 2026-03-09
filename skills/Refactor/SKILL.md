---
name: Refactor
version: 0.1.0
description: "Suggest improvements to working code and show a before/after diff before applying. USE WHEN refactor, clean up, improve, make better, simplify, restructure, code smell."
---

# Refactor

The user has code that works but wants it improved. They may point to a file, a function, a class, or paste a snippet. The code is not broken — it just could be better.

## Instructions

1. Read `rules/Identity.md` to understand the user's experience level and preferences.

2. Adjust your approach to match their level:
   - **beginner**: Name one clear improvement. Explain why it matters using an analogy.
   - **intermediate**: Identify 2-3 improvements. Use proper terminology, briefly defined.
   - **advanced**: Be concise and precise. Focus on the most impactful change.

3. **Read the code**: Read the file or snippet the user indicated. Understand what it does and confirm it works before suggesting changes.

4. **Identify improvements** (pick the most impactful, not all categories):
   - Clarity — rename variables, extract methods, simplify conditionals
   - Structure — reduce duplication, improve separation of concerns
   - Idiom — use language-specific conventions and standard library features
   - Performance — only when there is a measurable concern, not speculative

5. **Be opinionated**: Recommend ONE refactoring direction. Do not present a menu. If multiple improvements exist, pick the highest impact-to-effort ratio first.

6. **Show the diff**: Present a before/after comparison for every change:

   **Before:**
   [original code]

   **After:**
   [refactored code]

   **Why:** One sentence explaining what improved and why it matters.

7. **Ask before applying**: "Want me to apply these changes, or would you rather do it yourself?"

8. **Only write to files after confirmation.**

9. After applying (or if declined): "Anything else in this file you want cleaned up?"

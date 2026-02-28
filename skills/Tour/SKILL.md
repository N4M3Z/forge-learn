---
name: Tour
version: 0.1.0
description: "Walk through your setup — what you have, what each directory does, and how to get started. USE WHEN tour, show me around, what is this, getting started, help."
---

# Tour

The user wants a guided walkthrough of their forge-learn setup. Read the directory structure and present a friendly overview.

## Instructions

1. Read `rules/Identity.md` and greet the user by name (if they've filled it in). If the file doesn't exist, tell the user to run `make install` first. If it exists but hasn't been personalized, say "I see you haven't set up your identity yet — let's do that after the tour."

2. Explain the three directories:
   - **skills/** — "These are things I can do for you. Each one is a command you can run."
   - **rules/** — "These files tell me who you are and what you care about. I read them every session."
   - **modules/** — "This is where optional add-ons go when you're ready for more."

3. Highlight 2-3 starter skills to try first: "/Explain, /Summarize, and /Kickstart are great starting points — try `/Explain` on any file to see how it works." Then mention that more skills are available and they can see the full list in the README.

4. Check if `rules/Identity.md` has been personalized (name changed from "Your Name"). If not, suggest they start there: "Try opening `rules/Identity.md` and changing the name to yours. Next time we talk, I'll know who you are."

5. Mention the progression system: "You have a learning path — 7 levels from your first skill modification to contributing to the ecosystem. Type `/Progress` to see where you are and what to try next."

6. End with: "Try `/Explain` on any file in this project — then open the skill's source at `skills/Explain/SKILL.md` to see how it works. Or try `/Kickstart` if you already have an idea for something to build."

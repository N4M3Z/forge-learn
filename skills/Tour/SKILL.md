---
name: Tour
version: 0.1.0
description: "Walk through your setup — what you have, what each directory does, and how to get started. USE WHEN tour, show me around, what is this, getting started, help."
---

# Tour

The user wants a guided walkthrough of their forge-user setup. Read the directory structure and present a friendly overview.

## Instructions

1. Read `steering/Identity.md` and greet the user by name (if they've filled it in). If not, say "I see you haven't set up your identity yet — let's do that after the tour."

2. Explain the three directories:
   - **skills/** — "These are things I can do for you. Each one is a command you can run."
   - **steering/** — "These files tell me who you are and what you care about. I read them every session."
   - **modules/** — "This is where optional add-ons go when you're ready for more."

3. Highlight 2-3 starter skills to try first: "/ExplainSimply, /Summarize, and /Translate are great starting points — paste any text and see what happens." Then mention that more skills are available and they can see the full list in the README.

4. Check if `steering/Identity.md` has been personalized (name changed from "Your Name"). If not, suggest they start there: "Try opening `steering/Identity.md` and changing the name to yours. Next time we talk, I'll know who you are."

5. Mention the progression system: "You have a learning path — 7 levels from text transforms to building your own tools. Type `/Progress` to see where you are and what to try next."

6. End with: "Try `/ExplainSimply` on something confusing, or `/Kickstart` if you already have an idea for something to build."

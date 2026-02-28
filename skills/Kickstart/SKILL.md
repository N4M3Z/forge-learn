---
name: Kickstart
version: 0.1.0
description: "Describe what you want to build and get a project plan with starting structure. USE WHEN kickstart, start a project, build something, new project, I want to make."
---

# Kickstart

The user has an idea for something they want to build. Help them go from "I want X" to "here's the plan and the first files."

## Instructions

1. Read `steering/Identity.md` for experience level and preferences. If the file doesn't exist, tell the user to run `make install` first.
2. Read `steering/Goals.md` to see if this project aligns with their goals. If the file doesn't exist, tell the user to run `make install` first.

3. **Understand the idea**: Ask up to 2 clarifying questions if the request is vague. Focus on: What does it do? Who is it for? What technology (if any preference)?

4. **Create a plan** (present this BEFORE creating any files):
   - One-paragraph description of what we're building
   - Suggested directory structure (keep it simple)
   - Ordered list of what to build first (3-5 steps)
   - Technologies/tools involved, with brief justification

5. **Ask for approval**: "Here's what I'm thinking — want me to set this up, or should we adjust the plan?"

6. **Only after approval**, create:
   - Project directory with the proposed structure
   - A README.md explaining the project
   - A sensible .gitignore
   - The first file from the build order (starter code or template)

7. After scaffolding, suggest the next step: "Your project is set up. Want to start building [first item from the plan]?"

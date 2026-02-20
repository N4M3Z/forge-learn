---
name: HighImpactChanges
version: 0.1.0
description: "Review a document or set of documents and propose exactly 10 high-impact changes. USE WHEN review, improve, polish, final pass, high impact, what should I fix."
---

# High-Impact Changes

Review one or more documents and propose exactly 10 high-impact changes, ranked by audience impact. "High impact" means: if this change isn't made, the document will confuse the audience, misrepresent the strategy, undermine credibility, or miss a critical concern.

## Instructions

### Step 1: Identify Documents and Audience

Read the user's input. Identify:
- **Documents**: file paths, pasted content, or description of what to review
- **Audience**: who will read these documents (engineers, executives, mixed, external)
- **Intent**: final polish, structural review, credibility check, or assumption challenge

If the audience is unclear, ask one question: "Who is the primary reader, and what decision are they making?"

### Step 2: Multi-Perspective Scan

Review each document through 5 lenses. For each lens, identify 2-3 candidate changes:

| Lens | Focus |
|------|-------|
| **Stakeholder** | Who needs what from this document? What questions will they ask that aren't answered? |
| **Structure** | Is the most important information first? Can the reader find what they need to decide? |
| **Technical** | Are claims accurate? Do different sections contradict each other? Are metrics measurable? |
| **Data** | Is the business case defensible? Are numbers sourced? Can finance poke holes? |
| **Assumptions** | What does the document treat as settled that is actually debatable? What risks are downplayed? |

This produces 10-15 candidate changes.

### Step 3: Triage with Targeted Questions

Before finalizing, ask the user 3-4 targeted questions via AskUserQuestion. Good questions:
- Eliminate an assumption ("Is X confirmed or still debatable?")
- Resolve a contradiction ("The doc says A here and B there — which is correct?")
- Clarify audience priority ("Will the reader need to defend this number?")
- Confirm scope ("Should this fix go in this document or a supporting doc?")

Each answer should eliminate at least one candidate or promote one to "must include."

### Step 4: Rank and Present the Final 10

Apply the user's answers. Rank the surviving changes by:
1. **Audience impact** — will the primary reader stumble on this?
2. **Credibility risk** — does leaving it unfixed undermine trust?
3. **Effort** — is this a one-line fix or a section rewrite?

Present the final 10 in this format:

```
### 10 High-Impact Changes

**1. [Short title]** (Document, Section)
[What to change and why. 2-3 sentences max.]

**2. [Short title]** (Document, Section)
...
```

Each change must be:
- **Specific** — cite the document and section
- **Actionable** — say what to change, not just "improve this"
- **Justified** — say why it matters for the audience

### Step 5: Offer to Apply

After presenting, ask: "Want me to apply these changes now, or review first?"

If yes, apply changes in ranked order. For each, show the before/after or describe the edit. Mark each as done.

## Constraints

- Always exactly 10. Not 8, not 12. Forces prioritization.
- Merge related changes into one slot (e.g., "add ROI model" + "add payback period" = one change).
- Never include editorial polish (comma placement, word choice) — only changes that affect comprehension, credibility, or decision-making.
- If a document is solid, say so. Don't manufacture 10 changes for a document that only needs 3.
- If using a ProductCouncil or multi-agent review, the 5 lenses map to specialist perspectives. The skill works with or without agents.

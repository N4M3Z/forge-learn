---
name: GenerateOutline
version: 0.1.0
description: "Generate a hierarchical outline from any document. USE WHEN outline, table of contents, toc, document structure, sections."
---

# GenerateOutline

The user wants an outline generated from their document. They may paste a full document, a long article, a report, or any structured text with headings.

## Instructions

1. Read the full content and identify all headings and sections. In Markdown, these are `#`, `##`, `###`, etc. In plain text, look for lines that function as section titles (short, followed by a paragraph break, or visually distinct).

2. Build a hierarchical structure that mirrors the heading levels. Top-level headings are flush left; sub-headings are indented.

3. Include page numbers if they are present in the source document. If not, omit page numbers entirely.

4. Preserve the exact wording of each heading — do not rephrase or shorten.

## Output Format

Return only the outline. No preamble, no explanation.

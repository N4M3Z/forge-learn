---
name: Pandoc
version: 0.1.0
description: "Render markdown documents to PDF via pandoc. USE WHEN pdf, render, export, pandoc, print, document."
---

# Pandoc

Render one or more markdown documents to PDF using pandoc. Strips YAML frontmatter by default so the PDF starts with content, not metadata.

## Instructions

### Step 1: Resolve Input

Parse the user's input for:
- **Source file(s)**: markdown file path(s) or description ("this document", "the design doc")
- **Output path**: explicit path, or default to same directory as source with `.pdf` extension
- **Options**:
  - `--strip-frontmatter` (default: true) — remove YAML frontmatter from PDF output
  - `--engine=typst|xelatex|pdflatex|lualatex` (default: auto-detect best available)

If the source is ambiguous, ask one question: "Which file should I render?"

### Step 2: Check Prerequisites

Verify pandoc and a PDF engine are available:

```bash
which pandoc
which typst || which xelatex || which pdflatex || which lualatex
```

If pandoc is missing, tell the user: `brew install pandoc`.
If no PDF engine is found, recommend: `brew install typst` (lightweight, fast, good Unicode support).

Engine selection priority (if not specified):
1. `typst` — fastest, best Unicode/box-drawing support
2. `xelatex` — best font control, handles CJK
3. `pdflatex` — most compatible, limited Unicode
4. `lualatex` — good Unicode, slower

### Step 3: Detect Frontmatter

If `--strip-frontmatter` is true (default), count the frontmatter lines:

```bash
awk '/^---$/{count++; if(count==2){print NR; exit}}' "$SOURCE"
```

This gives the line number of the closing `---`. Use `tail -n +N` to skip past it.

If the file has no YAML frontmatter (no opening `---` on line 1), skip stripping.

### Step 4: Render

Build and run the pandoc command:

```bash
tail -n +$((FRONTMATTER_END + 1)) "$SOURCE" | pandoc -f markdown -o "$OUTPUT" --pdf-engine=$ENGINE
```

If frontmatter stripping is disabled, use the file directly:

```bash
pandoc "$SOURCE" -o "$OUTPUT" --pdf-engine=$ENGINE
```

### Step 5: Verify

Check the output:
- File exists and has non-zero size
- Report page count if `pdfinfo` is available (`brew install poppler`)
- Report file size

Present: "Rendered N pages (XKB) to `path/to/output.pdf`"

### Step 6: Wikilink Handling

Pandoc doesn't understand `[[wikilinks]]`. Before rendering, consider whether to:
- Strip wikilink brackets: `[[Foo]]` → `Foo` (default for PDF — links aren't clickable anyway)
- Leave them as-is (if user wants bracket notation visible)

Apply with sed in the pipeline if stripping:

```bash
tail -n +$((FRONTMATTER_END + 1)) "$SOURCE" | sed 's/\[\[\([^]|]*\)\]\]/\1/g; s/\[\[[^|]*|\([^]]*\)\]\]/\1/g' | pandoc ...
```

The first pattern handles `[[Name]]` → `Name`. The second handles `[[Name|Display]]` → `Display`.

## Constraints

- Never modify the source markdown file — all transformations happen in the pipeline
- Default to stripping frontmatter — YAML metadata in a PDF looks like a bug
- Default to stripping wikilinks — `[[brackets]]` in a PDF look like broken links
- If the source has ASCII art diagrams, prefer typst or xelatex (better monospace Unicode rendering than pdflatex)
- Report the output path so the user can find the file

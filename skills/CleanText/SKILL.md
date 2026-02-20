---
name: CleanText
version: 0.1.0
description: "Strip URLs, HTML tags, extra whitespace, and other noise from text. USE WHEN clean text, remove urls, strip links, strip html, clean up, remove noise."
---

# CleanText

The user wants messy text cleaned up. They may paste web content full of URLs, HTML fragments, excessive whitespace, tracking parameters, or other noise.

## Instructions

1. Remove all URLs — `http://`, `https://`, `www.`, and bare domain patterns.

2. Strip HTML tags, leaving only the text content.

3. Collapse excessive whitespace — multiple blank lines become one, multiple spaces become one.

4. Clean up orphaned artifacts: empty parentheses `()`, empty brackets `[]`, dangling punctuation that only existed to wrap removed content.

5. Preserve all meaningful content, formatting structure, and tone.

## Output Format

Return only the cleaned text.

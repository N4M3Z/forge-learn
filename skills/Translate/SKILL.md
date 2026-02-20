---
name: Translate
version: 0.1.0
description: "Translate text into a target language while preserving meaning and tone. USE WHEN translate, translation, language."
---

# Translate

The user wants text translated into another language. They may specify the target language as an argument (e.g., `/Translate French`) or inline in their message. Default to English if no language is specified.

## Instructions

1. Identify the target language from the user's argument or message. If ambiguous or absent, use English.

2. Translate the full text into the target language. Preserve the original meaning — prefer accurate translation over literal word-for-word rendering.

3. Maintain the tone and register of the source text. Formal stays formal, casual stays casual.

4. Preserve cultural context where possible. When a direct equivalent doesn't exist, use the closest natural expression in the target language.

5. Keep all formatting intact — paragraph breaks, lists, headings, and punctuation structure should survive the translation.

## Output Format

Return only the translated text. No preamble, no language label, no explanation.

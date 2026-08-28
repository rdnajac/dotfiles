---
name: shame
description: Add a corrective directive to the Wall of Shame section in CLAUDE.md, or add a single word to the Banned Words section. Use when the user calls /shame or asks to add to the wall of shame or to the banned words.
---

# Shame

The target file is `$HOME/.claude/CLAUDE.md`.

Read the file first. Check the existing entries before you add a new one. If
the file already covers the request, report that and stop. Do not add a
duplicate.

## One word

If the request is a single word, add that word to the "Banned Words" section.

1. Read the file.
2. If the word is already in the list, report that and stop.
3. If the word is absent, run this command. Replace `WORD` with the word.

```bash
f="$HOME/.claude/CLAUDE.md"
awk -v w="WORD" '
  NR==FNR { if (/^## Wall of Shame$/) stop=1; if (!stop && /^- /) last=FNR; next }
  { print }
  FNR==last { print "- " w }
' "$f" "$f" > "$f.tmp" && mv "$f.tmp" "$f"
```

## More than one word

If the request is longer than a single word, add it to the "Wall of Shame"
section. Write the corrective action in the positive.

1. Read the file.
2. Compare the request against every existing bullet.
   - If a bullet already states the same rule, report that bullet and stop.
   - If a bullet states a narrower version of the same rule, edit that bullet
     to cover both cases. Do not append a second bullet.
3. If no bullet covers the request, append it to the bottom of the file.

```bash
printf '%s\n' '- CORRECTIVE ACTION' >> "$HOME/.claude/CLAUDE.md"
```

## Report

State the line that you added and the section that received it. If you skipped
the request as a duplicate, state the existing line instead.

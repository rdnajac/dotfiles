# CLAUDE.md

<!-- source: https://github.com/multica-ai/andrej-karpathy-skills -->

## 0. Stop the Madness

- Always use `semble search` before responding to acquire context first. 
- prefer local docs (like `$VIMRUNTIME`/doc/*.txt or `man` pages before falling back to external sources like:
    - chezmoi: `https://www.chezmoi.io/{reference,user-guide}/`
    - micromamba: `https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html`

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- No overly-verbose logging or comments.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently.
Weak criteria ("make it work") require constant clarification.

<!-- **These guidelines are working if:** fewer unnecessary changes in diffs, fewer rewrites due to overcomplication, and clarifying questions come before implementation rather than after mistakes. -->

## Wall of Shame

**When corrected, append the lesson here immediately. Don't wait to be asked.**

- Trigger: user says "no", "don't do that", "stop", corrects an approach, or otherwise flags a mistake.
- Action: append the rule to the bottom of this file — state the rule only, not what went wrong.
- Do this every time, silently, as part of handling the correction.

---
- Always `semble search` first; for vim help docs, Read `$VIMRUNTIME/doc/*.txt` directly.
- Never spawn headless nvim to read help or inspect variables.
- Always ask before running nvim (any mode) — user must approve each invocation.
- Never show train-of-thought or self-corrections in output. Final answer only.
- Before editing any repo file, `git diff` it first to know its baseline; never overwrite/revert without seeing pre-existing uncommitted state.
- Check whether a file is auto-generated before editing it; fix the generator/source, not the output.
- Propose the diff and get approval before writing to the user's project files — no unprompted edits.
- Only report changes I made; don't narrate git-status lines that aren't mine.

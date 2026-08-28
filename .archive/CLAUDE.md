# CLAUDE.md

## 0. ASD-STE100 Simplified Technical English

<!-- When you write technical text (code comments, documentation, debug/commit/error messages, protocols, reports),  -->

obey these rules from ASD-STE100 Simplified Technical English:

### Classify First

Never mix procedural and descriptive text in the same passage.

Procedural text tells the reader what to do: imperative mood, maximum 20 words
per sentence, one instruction per sentence.

Descriptive text explains: simple tenses, maximum 25 words per sentence, one
topic per paragraph, maximum six sentences per paragraph.

### Verbs

Use only:

- active voice
- approved modals: can, will, must.
- these tenses:
  - infinitive
  - imperative
  - simple present
  - simple past
  - simple future
  - and past participle as adjective.

Avoid:

- should/would/may/might/could ("must" if required, omit if optional)
- present perfect ("have completed" becomes "completed the task")
- gerunds ("making it easy" starts a new sentence).

### Sentences

Keep complete grammar: no contractions, keep articles, keep "that" ("make sure
that the file exists"). Put conditions before commands, with a comma: "If the
test fails, read the log." No semicolons — write two sentences. Use a vertical
list for more than two items or steps.

### Words

American spelling. "One word, one meaning" for the whole document: pick one of check/verify/confirm and keep it. 
Noun chains of maximum three words; break longer ones with prepositions ("the timeout value for the connection pool"). 
Delete words that carry no fact: simply, seamlessly, robust, powerful, comprehensive, leverage, "in order to", "it is worth noting". 
Replace: utilize → use, prior to → before, in the event that → if, e.g. → for example.

### Warnings

Command or condition first, then the risk: 

> "Do not run this against production. The command deletes rows."

### Never Touch

Code blocks, identifiers, CLI commands, file paths, quoted error messages,
product names. Each counts as one word toward sentence limits.

### Self-Check

Before returning: scan for contractions, "has been", "should", ", making", semicolons.
Count words in your three longest sentences and split any over the limit. Collapse synonym rotation.

---

## 1. Think Before You Code

Before you implement code:

- Always `semble search` first and for (n)vim help docs, go to `$VIMRUNTIME/doc/*.txt` directly.
- State your assumptions. Do not hide confusion. State the tradeoffs.
- If you are not sure, ask.
- If more than one interpretation exists, list each one. Do not pick one without comment.
- If a simpler method exists, state it. Push back when needed.
- If something is not clear, stop. Name the unclear part. Then ask.

## 2. Write Simple Code First

Write the minimum code that solves the problem. Do not add speculative code.

- Do not add features beyond the request.
- Do not add abstractions for code that runs only once.
- Do not add flexibility or configuration options that nobody requested.
- Do not add error handling for cases that cannot happen.
- Do not add verbose logs or comments.
- If you write 200 lines and 50 lines can do the job, rewrite the code.

Ask this question: "Is this code too complex for a senior engineer?" If the answer is yes, simplify the code.

## 3. Make Surgical Changes

Change only the code you must change. Clean up only your own changes.

When you edit existing code, do this:

- Do not improve nearby code, comments, or formatting.
- Do not refactor code that already works.
- Match the existing style, even if you prefer a different style.
- If you find unrelated dead code, report it. Do not delete it.

When your changes create orphan code, do this:

- Remove imports, variables, and functions that your changes made unused.
- Do not remove pre-existing dead code, unless the user asks for this.

Test: each changed line must trace directly to the user's request.

## 4. Use Goal-Driven Execution

Define success criteria. Loop until you verify the result.

Transform each task into a goal you can verify:

- "Add validation" becomes "Write tests for invalid inputs. Then make the tests pass."
- "Fix the bug" becomes "Write a test that reproduces the bug. Then make the test pass."
- "Refactor X" becomes "Confirm that tests pass before the change and after the change."

For a multi-step task, state a short plan:

```
1. [Step]. Verify: [check]
2. [Step]. Verify: [check]
3. [Step]. Verify: [check]
```

Strong success criteria let you work with less clarification.
Weak criteria, for example "make it work," need constant clarification.

## Wall of Shame

Call the skill `shame` to view or add to it.

---

- Check the status of a fact before you state it.
- Pick one word for one meaning, for example merged, not landed.
- Do not start headless nvim to read help or check variables.
- Do not show your thinking or self-corrections in output. Show only the final answer.
- Check the context before you make changes.
- Before you edit a file, check if a generator created it.
- Report only the changes you made. Do not describe git-status lines that are not yours.
- If a change breaks, fix it forward toward the requested design. Do not revert to the prior version without telling the user.
- Before you ship a design change, verify it against the real runtime boundary it crosses, for example an API conversion or an event payload. Do not verify in-process Lua semantics alone.
- If file content changed since you last saw it, and the change is plausibly the user's own edit, adapt to their formatting and naming convention. Do not assume a bug and revert it.
- If a grep or bash search is denied, do not use another shell tool, for example awk, sed, or find with cat, as a workaround. Use semble search instead.
- Do not invent jargon, metaphors, or analogies, for example "coercion landmine" or "md5 sidecar." State observations in plain words.
- State what actually happens, for example uploaded, written, or copied. Do not use vague verbs, for example "land."
- Do not use arrows, bold text, or em dashes in markdown output.
- Define domain abbreviations on first use. Do not assume the reader knows them.
- Read the referenced documentation before you change code that the documentation describes.

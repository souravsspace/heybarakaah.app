# AGENTS.md

This file provides guidance to llm when working with code in this repository.

---

## 0. Mindset & Approach

**Think before coding. Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:

- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them — don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

---

## 1. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

---

## 2. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:

- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it — don't delete it.

When your changes create orphans:

- Remove imports, variables, and functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

---

## 3. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:

- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:

```text
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

---

## 4. Code Rules

### General

- Prefer the smallest correct change.
- Prefer clarity over cleverness.
- Prefer explicit code over magical abstractions.
- Prefer composition over inheritance.
- Prefer reusable code only when reuse is real, not hypothetical.
- Keep functions small and focused.
- Keep components/files organized by responsibility.
- Use existing patterns in the repository unless they are clearly broken.
- Do not introduce new dependencies unless necessary.
- Do not rename things without a strong reason.
- Do not reformat files unrelated to the task.

### Correctness

- State assumptions when behavior is ambiguous.
- Do not guess at hidden requirements.
- Preserve existing behavior unless the task explicitly changes it.
- If a change could affect multiple areas, explain the impact before making it.
- Verify after changing code.

### TypeScript / JavaScript

- Use `unknown` instead of `any` when a value is not known.
- Use `as const` for literal assertions.
- Avoid `!` unless the invariant is truly guaranteed.
- Keep types close to where they are used.
- Do not over-type simple code.
- Do not create unnecessary generics.

### Swift

- File names must use `PascalCase.swift`.
- Match file names to the primary type inside when practical.
- Use `struct` for views and value types unless there is a clear reason not to.
- Keep SwiftUI views small and composable.
- Prefer `extension` only when it improves readability.
- Keep side effects out of views when possible.
- Put shared logic into separate types or Swift packages when it is genuinely shared.

### Testing

- Add tests only when they validate the requested behavior.
- Use the project's existing test framework and style.
- Keep tests focused and readable.
- Do not write broad speculative test suites.
- When fixing a bug, add a test that would fail before the fix.

### Comments

- Do not comment obvious code.
- Comment only when the reasoning is not obvious from the code itself.
- Avoid TODOs unless they are necessary and actionable.

### Naming

- `camelCase` for variables and functions
- `PascalCase` for components, classes, structs, and types
- `UPPER_SNAKE_CASE` for constants
- `camelCase.ts` for utility files
- `PascalCase.tsx` for component files
- `PascalCase.swift` for Swift files

### Imports

- Keep imports organized.
- Framework imports first.
- Then internal/shared imports.
- Then relative imports.
- Remove imports that become unused.

---

## 5. Git Workflow — Per-File Commits

**Every file change must be committed individually.** No batching.

```bash
1. Write/edit the file
2. Format/lint the file
3. Typecheck
4. git add <file>
5. git commit -m "<type>(<scope>): <summary>"
6. Move to next file
```

**Conventional commit format:** `<type>(<scope>): <summary>`

- **type:** `feat`, `fix`, `refactor`, `docs`, `style`, `test`, `perf`, `ci`, `build`, `chore`
- **scope:** `api`, `ios`, `marketing`, `swift`
- **summary:** present tense, lowercase, no period, ≤72 chars

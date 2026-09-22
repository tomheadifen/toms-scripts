# Git Commit Messages

Use a lightweight version of [Conventional Commits](https://www.conventionalcommits.org/).

## Format

```
<type>(<optional scope>): <subject>

<optional body>
```

## Subject line

- Imperative mood: it should complete "If applied, this commit will ___" (`add`, not `added` / `adds`).
- Lowercase, no trailing period, aim for 50 characters, hard limit 72.
- Describe the change's effect, not the files touched.

## Types

- `feat`: new user-facing behaviour
- `fix`: bug fix
- `refactor`: code change with no behaviour change
- `test`: adding or updating tests only
- `docs`: documentation only
- `style`: formatting only (linter, whitespace)
- `chore`: dependencies, config, tooling, build, CI

Scope is optional; use it when a clear area applies (e.g. `feat(billing): ...`). Mark breaking changes with `!` after the type: `feat!: ...`.

## Body

- Skip it for small, self-explanatory changes.
- When included: blank line after the subject, wrap at 72 characters, explain *why* and any non-obvious trade-offs rather than restating the diff.
- Bullet points are fine for multiple related changes.

## Scope of a commit

- One logical change per commit. If the subject needs "and", consider splitting it.
- Don't commit unrelated working-tree changes alongside the requested change.

## Examples

```
feat(servers): provision new virtual servers on demand
```

```
fix: stop fake file driver reading from stale cache

The cache survived between test runs, so fake files from a previous
run leaked into the next one.
```

```
refactor: resolve game hosting strategy via service provider
```

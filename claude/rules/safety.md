# Safety

## Secrets

- Never read, print, or copy the contents of `.env`, `.env.*` (except `.env.example`), credential files, private keys, or `~/.aws`, `~/.ssh`, `~/.config/gh` etc.
- If a value from one of these is needed, ask me for it or reference the variable name instead.
- Never hardcode secrets, API keys, or tokens in code, tests, or commit messages. Use environment variables and add placeholders to `.env.example`.
- If you spot a secret already committed or about to be committed, stop and tell me.

## Destructive commands

Ask before running anything that deletes or overwrites data that can't easily be recovered, including:

- `rm -rf`, or deleting files/directories you didn't create in this session
- Dropping, truncating, or wiping databases (`migrate:fresh`, `migrate:reset`, `db:wipe`, `DROP`, `TRUNCATE`, `DELETE` without a `WHERE`)
- `git reset --hard`, `git clean -fd`, `git checkout -- .`, `git stash drop`, deleting branches
- Overwriting files outside the current project

## Git

- Never force-push, rewrite pushed history, or use `--no-verify` to skip hooks.
- Only commit or push when I ask.
- Don't discard uncommitted changes you didn't make; they may be my work in progress.

## External systems and cost

- Ask before any command that creates, modifies, or deletes real cloud resources (AWS, Laravel Cloud, DNS, etc.) or could incur cost.
- Ask before sending emails, webhooks, or messages to real services, or publishing anything (packages, deploys, public repos, gists).
- Prefer local, fake, or sandboxed services when testing.
- Never run commands against production. If it's unclear whether an environment is production, assume it is and ask.

## System changes

- Ask before installing global packages, changing system config, or running `sudo`.
- Don't modify files in `~/` outside the project unless I ask.

## When unsure

If an action is hard to reverse or affects something outside the project, stop and ask rather than guess.

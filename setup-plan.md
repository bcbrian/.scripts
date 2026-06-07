# Setup Refactor Plan

Lightweight tracking doc. Intent + decisions + work items. Not a heavy spec.

## Goal

Make `~/.scripts` set up a fresh **Ubuntu server / WSL** box with the same dev
environment as the Mac, attended (user clicks through prompts/logins). Add
terminal AI agents (Claude Code, Cursor Agent). Simplify by standardizing on
**Homebrew as the single package manager** across macOS + Linux/WSL.

Target this milestone: a freshly stood-up Ubuntu server.

## Principles

1. **brew is the default package manager** on both macOS and Linux/WSL. One code
   path per tool instead of mac-vs-apt branches.
2. **Follow each tool's official install method.** If the tool's docs endorse
   brew, use brew. If they advocate a curl installer (brew itself, nvm, bun,
   Claude Code, Cursor Agent), use that curl command.
3. **Mirror the current machine** — everything on the Mac should exist on the
   server. Headless GUI-skipping is a *future* concern (see Deferred).
4. Simplify and keep patterns consistent.

## Bootstrap (pre-brew, OS-specific, unavoidable)

brew cannot install brew, and some prereqs must exist first:

- **Linux/WSL:** `apt-get install -y build-essential procps curl file git`
  (Homebrew's documented prerequisites, including git).
- **macOS:** ensure Xcode Command Line Tools / system git.
- Then install brew via its official curl installer and put it on PATH.

`git` is special: it runs in the pre-brew phase (needed to clone the repo), so
on Linux it comes from the apt bootstrap; brew upgrades it later.

**gh is NOT a pre-brew dependency.** `clone-scripts.sh` uses a public
`git clone` (the repo is public), so gh + gh-auth move *down* the pipeline next
to the agents (gh is agent/dev tooling). Goal: reach brew as fast as possible.

## brew PATH propagation (load-bearing)

`run-setup-scripts.sh` runs each script as a **separate process**, so
`eval "$(brew shellenv)"` inside `brew.sh` does NOT reach later scripts. Fix:

- Add brew shellenv to `zsh/.myzshrc` (linuxbrew + macos paths) so every script
  that sources `~/.zshrc` and every interactive shell gets brew.
- Ensure `run-setup-scripts.sh` also has brew on PATH for the in-loop scripts
  that don't source zshrc (eval brew shellenv once after brew.sh).

Without this, `nvim.sh`/`lazygit.sh`/etc. on a fresh box wouldn't find brew.

## Work items

1. **`setup/brew.sh`** — install apt bootstrap prereqs (linux) before the brew
   curl install. Keep `</dev/tty` for sudo. Remains first in the order.
2. **Convert tool scripts to brew-only** — comment out apt fallback branches
   (keep, don't delete, while testing on Ubuntu; delete once proven). Affects:
   `git.sh`, `gh.sh`, `zsh.sh`, `nvim.sh`, `lazyvim-deps.sh`, `lazygit.sh`,
   `tree-sitter-deps.sh`, `java.sh`. (gh's `linux-gnu` glob issue disappears.)
3. **`setup/java.sh`** — cross-platform via brew (`openjdk` = OpenJDK on both),
   keep `java`/`javac` idempotency guard. Wire into the order.
4. **`setup/cursor-agent.sh`** (new) — split the Cursor Agent CLI block out of
   `cursor.sh` into its own script (official `curl https://cursor.com/install`).
   Verify the installed command name (`cursor-agent`) for the idempotency guard.
5. **`setup/cursor.sh`** — GUI `.deb`/cask only; agent block removed.
6. **`setup/claude-code.sh`** (new) — official native curl installer
   (verify exact URL at implementation). Idempotent on `command -v claude`.
   Installs to `~/.local/bin` (already on PATH via `.myzshrc`).
7. **`zsh/.myzshrc`** — add brew shellenv (see PATH section).
8. **`setup/scripts-order.sh`** — new order (clone happens in `setup.sh`'s curl
   phase via public `git clone`, so it leaves the array; gh + gh-auth move to
   the end next to the agents):
   ```
   brew, git, zsh, ohmyzsh, nvm, bun, java,
   nvim, lazyvim-deps, lazygit, tree-sitter-deps, lazyvim,
   gh, gh-auth, cursor, cursor-agent, claude-code
   ```
   Editor + AI/custom tooling grouped at the end.
9. **`setup/clone-scripts.sh`** — public `git clone` (self-bootstraps git on
   linux via apt / mac via xcode), no gh dependency.
10. **`setup.sh`** — curl phase: logo → clone-scripts → run array. Drop the
    pre-brew git/gh/gh-auth curls (now in the array). Fix the trailing bare
    `zsh` that launches an interactive shell.
11. **`setup/run-setup-scripts.sh`** — eval brew shellenv after brew.sh so
    in-loop scripts see brew.
12. Interactive commands read from `</dev/tty` (git config prompts,
    `gh auth login`) so attended `curl | bash` works.

## Outlier (can't be brew)

- **`cursor.sh` GUI on Linux** uses `.deb`/dpkg — no linux brew cask. Stays as
  dpkg. This is the GUI app a future headless profile would skip anyway.

## Deferred (not this milestone)

- Config/profile system (e.g. `SCRIPTS_PROFILE=server|desktop`) to skip GUI apps
  like `cursor.sh` on headless servers, run only `cursor-agent.sh` + `claude-code.sh`.
- Deleting the commented-out apt fallbacks once brew-on-Ubuntu is proven.

## Resolve during implementation

- Exact Claude Code native installer URL.
- Cursor Agent CLI binary name for the guard (`agent` vs `cursor-agent`).
- Whether `clone-scripts.sh` can use public `git clone` (drops gh as a pre-brew
  dependency) or must stay `gh repo clone`. Keep current behavior unless trivial.

# AGENTS.md — Project Root · Unified Agent Contract & TODO

> **This file is the single source of truth for project state.**
> Every agent session MUST begin by reading this file in full.
> Every agent session MUST end with a `git commit` reflecting work done.
> **Only the human orchestrator may delete tasks from this list**, including
> completed ones — finished tasks remain until the user explicitly removes them,
> serving as a secondary confirmation layer for human review.

---

## 0 · Quick-Reference Legend

```
[ ] — Not started
[~] — In progress  ← resume this first if found at session start
[x] — Done, awaiting human review/sign-off
[!] — Blocked — agent cannot proceed; human intervention required

```

**Priority tags** (append to any task line):

| Tag   | Meaning                                  |
|-------|------------------------------------------|
| `P0`  | Critical / blocking — do this first      |
| `P1`  | High — core feature or stability fix     |
| `P2`  | Normal — planned scope                   |
| `P3`  | Nice-to-have / stretch goal              |
| `~`   | Exploratory — open-ended, use judgment   |

---

## 1 · Project Mission & Benchmark Context

This project is produced **live** for a content creator benchmark
(~435 k subscribers, tens of millions of monthly views) that ranks
AI coding agents on:

- **Creativity** — unexpected, delightful solutions over rote ones
- **Code quality** — clean architecture, naming, SRP, tested
- **Self-orchestration** — does the agent plan, sequence, and recover
  without hand-holding?
- **Slop factor** — penalises boilerplate, filler, and safe mediocrity
- **Model uniqueness** — does the output feel like *this* model, or
  could any LLM have produced it?

> **Mandate:** Shoot for the moon. Complete tasks not just correctly
> but with your own flair. Surface ideas the human hasn't thought of.
> A surprising, excellent addition beats a merely correct one.
> There is **no token budget concern** — think deeply and output fully.

---

## 2 · Agent Operating Principles

### 2.1 Role Hierarchy

```

Human Orchestrator  ←  high-level direction, final sign-off, task removal
       │
       ▼
AI Agent  ←  sole implementer; architect, developer, reviewer, tester
```

The human is the *what*; the agent owns the *how*.
Push back, suggest better approaches, ask clarifying questions — briefly
and in plain language — before proceeding when the intent is ambiguous.

### 2.2 Session Start Protocol

1. Read `AGENTS.md` completely.
2. Run `git status` + `git log --oneline -10` to orient to current state.
3. Identify any `[~]` tasks and resume them before touching anything else.
4. If no `[~]` tasks, pick the highest-priority `[ ]` task.
5. Announce your plan in one short paragraph before writing code.

### 2.3 Session End Protocol

1. Verify all modified files compile / pass their test suite.
2. Stage all relevant changes: `git add -p` (prefer granular hunks).
3. Commit with a conventional message (see §4).
4. Push: `git push`.
5. Update task statuses in this file (`[ ]→[~]`, `[~]→[x]`, etc.).
6. Commit the updated `AGENTS.md` separately:
   `git commit -m "chore(agents): update task status post-session"`.
7. Push again.

### 2.4 Mid-Work Commit Cadence

Commit **at every meaningful milestone**, not only at task completion:

- A new file/module is working in isolation → commit
- A test suite is green for the first time → commit
- A refactor is complete and tests still pass → commit
- Before any risky or wide-reaching change → commit (checkpoint)

Frequent commits are the primary changelog and are used for
**model-behaviour analysis** by the benchmark. Sparse commit history
is penalised. Aim for ≥ 1 commit per 30–45 min of substantive work.

---

## 3 · Repository & Directory Contract

```
# NOTE: Not the complete hierarchy but just agent specifics of note early on. Feel free to update or remove this.
/
├── AGENTS.md                  ← YOU ARE HERE; do not relocate
├── .agents_work/              ← agent scratch space
│   ├── experiments/           ← throwaway proofs-of-concept
│   ├── session_notes/         ← free-form notes between sessions
│   └── opencode/              ← opencode.jsonc / mcp.jsonc patches
├── src/                       ← production source
├── tests/                     ← test suites (mirror src/ structure)
└── docs/                      ← generated or authored documentation
```

**Naming rules:**
- Filenames must be self-explanatory at a glance — a new agent should
  understand a file's role without opening it.
- Prefer flat depth over deep nesting; nest only when a directory's
  entire contents share a single, narrowly-scoped purpose.
- One class / one purpose per file (SRP). No "utils.ts" catch-alls.
- Use `kebab-case` for filenames, `PascalCase` for classes,
  `camelCase` for functions/variables.

---

## 4 · Git Commit Convention

Follow **Conventional Commits** (`conventionalcommits.org`):

```

<type>(<scope>): <imperative summary, ≤72 chars>

[optional body — why, not what]
[optional footer — breaking changes, issue refs]
```

| Type       | When to use                                  |
|------------|----------------------------------------------|
| `feat`     | New user-facing capability                   |
| `fix`      | Bug correction                               |
| `refactor` | Code restructure, no behaviour change        |
| `test`     | Adding or correcting tests                   |
| `docs`     | Documentation only                           |
| `chore`    | Build, config, tooling, AGENTS.md updates    |
| `perf`     | Performance improvement                      |
| `style`    | Formatting, whitespace (no logic change)     |

**Examples:**
```
feat(parser): add streaming JSON tokeniser with backpressure support
fix(auth): correct token expiry comparison against UTC not local time
chore(agents): mark task 5.3 complete; add subtask for edge cases

```

---

## 5 · TODO Task List

> Tasks are ordered within each priority tier by logical dependency.
> Add new tasks or subtasks freely; **do not remove any task** — that is the
> human's role as a form of final code review to sign off on.
> If all tasks in the current TODO Task list are complete then archive them
> into a TODO archive file with a date time string appended to the file name
> denoting time of completion which is where the user and other agent chat
> sessions will very completeness and compliance.
> If major changes are made to the inital project overall task of creating a full
> mockup GUI that has as many interface aspects that an end user may interact
> with is finished, and a user review is deemed appropriate, then your output
> may he halted and the user informed of what to review for compliance.

---

### P0 — Critical

- [x] **5.0.1** Verify active model is `nvidia/moonshotai/kimi-k2.6`;
      if not, HALT and alert user. `P0`

- [~] **5.0.2** Set up build system: CMake, Ninja, CPM.cmake,
      fetch Qt 6.8+ (minimum) via CPM. Confirm `CMakeLists.txt`
      builds a dummy `main.cpp` successfully. Commit. `P0`
      
      > [!NOTE]
      > **Primary Build Target:** Arch Linux (the user's main development workstation).
      > Windows builds are actively supported and encouraged for a larger footprint.
      > Build scripts and CI should always target both platforms where possible. `P0`

- [ ] **5.0.3** Establish project directory structure per
      INITIAL_PROMPT.md (apps/, libs/, qml/, ui/, assets/,
      themes/, shaders/, docs/, tests/, third_party/, etc.).
      Add root `.gitignore` entries for build dirs and artifacts. `P0`

---

### P1 — High Priority (Core GUI Shell)

- [ ] **5.1.1** Implement C++ main application entry (`main.cpp`) and
      QML engine setup. Ensure it loads a root `main.qml` and
      compiles/launches with an empty window. Commit. `P1`

- [ ] **5.1.2** Implement the main application shell: top bar (title,
      window controls, global actions), central content area, and
      status/footer bar. Wire into `main.qml`. Commit. `P1`

- [ ] **5.1.3** Implement robust theme/style system: dark/cyberpunk
      color palette, typography scales, spacing tokens. Expose via
      QML singleton or central `Theme.qml` / `ThemeEngine`. Commit. `P1`

- [ ] **5.1.4** Implement navigation architecture: sidebar/rail with
      page icons/labels, view router (StackView or SwipeView), and
      animated transitions between views. Commit. `P1`

---

### P1 — High Priority (Mockup Views)

- [ ] **5.1.5** Create **Home/Dashboard** view with mock data, animated
      widgets (stats, recent activity, quick actions), and responsive
      layout. Commit. `P1`

- [ ] **5.1.6** Create **Music Library** view with mock track data and
      responsive list/grid layouts. Include search bar and sort controls
      (non-functional / placeholder logic). Commit. `P1`

- [ ] **5.1.7** Create **Visualizer** view with a placeholder
      canvas/window ready for future projectM integration. Add subtle
      animated shader background. Commit. `P1`

- [ ] **5.1.8** Create **Suno Integration** view: placeholder UI for
      API controls, generation history with mock data, and status
      indicators. Commit. `P1`

- [ ] **5.1.9** Create **Settings** view with placeholder UI for
      toggles, preferences, and theme selection. Commit. `P1`

- [ ] **5.1.10** Create **Timeline/Export** view with placeholder
      UI for future orchestration features: track strip, markers,
      export controls. Commit. `P1`

---

### P2 — Normal Priority (UI Components & Polish)

- [ ] **5.2.1** Build a reusable UI components library in isolation:
      custom buttons, cards, panels, sliders, knobs. Store under
      `qml/components/` with individual `.qml` files per component.
      Commit. `P2`

- [ ] **5.2.2** Add animated backgrounds, basic shader effects,
      and visual polish across views (blurs, glows, gradients,
      subtle motion). Commit. `P2`

- [ ] **5.2.3** Implement responsive layout logic: minimum window
      sizes, reflow rules, and mobile/tablet breakpoints if applicable.
      Test at common resolutions. Commit. `P2`

---

### P3 — Stretch / Nice-to-Have

- [ ] **5.3.1** Add a diagnostic overlay (FPS counter, build info,
      version hash display) toggleable via a hotkey or settings
      toggle. Commit. `P3`

- [ ] **5.3.2** Create initial `BUILDING.md` with build prerequisites,
      step-by-step instructions, and troubleshooting notes. Update
      `README.md` with project description, screenshot placeholders,
      and tech stack overview. Commit. `P3`

---

## 6 · Coding Standards Checklist

Before marking any task `[x]`, verify:

- [ ] All new public functions/methods have doc-comments
- [ ] No function exceeds 40 lines (extract if needed)
- [ ] No file exceeds 200 lines (split if needed)
- [ ] Tests exist for every new behaviour (unit + at least one
      integration test per feature)
- [ ] `git log --oneline` shows ≥ 2 granular commits for this task
- [ ] No `console.log` / debug prints left in production paths
- [ ] Linter/formatter passes with zero warnings
- [ ] `README.md` or `docs/` updated if public API changed

---

## 7 · Communication Protocol

**When to speak first, then act:**
- Requirements are ambiguous (ask one focused question)
- Two or more architecturally different approaches exist (present
  options as a numbered list; recommend one)
- A task would touch > 5 files simultaneously (confirm scope)
- A `[!]` blocker is discovered (describe it precisely)

**Format for option lists:**
```

I see two approaches:
  1. [Name] — [one-sentence summary] — RECOMMENDED because [reason]
  2. [Name] — [one-sentence summary] — trade-off: [downside]

I'll proceed with (1) unless you prefer otherwise.
```

**Do NOT ask for permission to:**
- Refactor internals that don't change external behaviour
- Add tests
- Improve naming or documentation
- Commit and push
- Create files under `.agents_work/`

---

## 8 · Blocker Template

When a `[!]` state is set, add a block like this immediately below
the affected task:

```
  > [!] BLOCKER — [date]
  > What is blocked: <task ID and one-line description>
  > Root cause: <concise technical explanation>
  > What the human needs to do: <numbered action steps>
  > Partial work saved at: <branch or file path>
```

---

## 9 · Benchmark Self-Assessment Reminders

These are not tasks — they are persistent quality signals the agent
should internalise and check mentally before each commit:

- **Am I being creative,** or just doing the obvious and/or minimal thing(s)?
- **Would another model produce exactly this?** If yes, or even lesser, go further.
- **Is my commit message informative enough to be a changelog entry?** This might be noted as "going the extra mile" by human benbchark judges.
- **Have I left any "I'll do this later" stubs?** Finish them or file
  as a task in this "TODO" document with a base priority of P3. NOTE: AGENTS.md files can be written in **anu** directory and thusly anything textual inlcuding notes or lesser small TODO assignments can be made anywhere which will be read by LLM agents when traversing into the containing directory.
- **Slop check:** remove any [unnecessary] filler comments, redundant abstractions,
  or copy-paste duplication before committing. Take a brief moment and allocation of appropriate tokens to think: "is this setup and implmeneted well for the long term maintainability of this project?".

---

*First Drafted by: updated by: human orchestrator via Claude Sonnet 4.6 — initial scaffold 03-06-2026 00:40 MST*
*Last Updated by: the user — general housekeeping and light refactorings for clarity*
*Agent: update the above line at the end of every session with a one-liner of modifications, your model id, and a timestamp.*


# claude-bash-pro-skill

A Claude Code skill for writing defensive, portable, testable Bash scripts for automation, CI/CD, and system operations.

## Overview

This skill focuses on production-quality shell scripting. It helps define script contracts, validate inputs, handle failures, manage resources, and build repeatable automation that behaves predictably across supported environments.

## Core Topics

- Strict mode and explicit error handling.
- Safe argument parsing and quoting.
- Arrays and command construction.
- Functions and reusable script structure.
- Temporary files and cleanup traps.
- Exit codes and failure propagation.
- Portability and shell compatibility.
- Testing with Bats.
- Static analysis with ShellCheck.
- Formatting and pre-commit checks.

## Installation

```bash
git clone https://github.com/Brajesh31/claude-bash-pro-skill.git ~/.claude/skills/bash-pro
```

## Usage

Invoke the skill when writing or reviewing Bash automation:

```text
/bash-pro
```

Provide the target operating system, Bash version, inputs, outputs, expected failure behavior, and any portability requirements.

## Defensive Script Workflow

1. Define the script's contract and side effects.
2. Validate required arguments and environment variables.
3. Use arrays for command arguments.
4. Quote expansions and handle paths with spaces.
5. Check external command availability.
6. Implement explicit cleanup and failure handling.
7. Add tests for normal and error paths.
8. Run ShellCheck and formatting checks.
9. Test on the target environment.

## Example

```bash
#!/usr/bin/env bash
set -Eeuo pipefail

cleanup() {
  [[ -n "${tmp_file:-}" && -f "$tmp_file" ]] && rm -f -- "$tmp_file"
}
trap cleanup EXIT

if [[ $# -ne 1 ]]; then
  printf 'Usage: %s <input-file>\n' "$0" >&2
  exit 2
fi

input_file=$1
[[ -r "$input_file" ]] || {
  printf 'Cannot read: %s\n' "$input_file" >&2
  exit 1
}

tmp_file=$(mktemp)
grep -n -- "TODO" "$input_file" >"$tmp_file" || status=$?
if [[ ${status:-0} -gt 1 ]]; then
  exit "$status"
fi
cat "$tmp_file"
```

Adapt the example to the script's actual behavior. In particular, handle expected non-zero command statuses deliberately rather than suppressing all errors.

## Quality and Tooling

The repository includes shell configuration and test support:

- `.shellcheckrc`: ShellCheck configuration.
- `.editorconfig`: Editor consistency settings.
- `.pre-commit-config.yaml`: Automated checks.
- `scripts/example.sh`: Example script.
- `test/example.bats`: Bats smoke test.

The configured hooks may require ShellCheck, shfmt, checkbashisms, and pre-commit.

## Validation Checklist

- Arguments are validated before side effects.
- Variables are quoted.
- Arrays are used for command argument lists.
- Exit codes are meaningful.
- Temporary resources are cleaned up.
- Pipelines fail when an important command fails.
- Tests cover expected failures.
- Linting and formatting checks pass.
- Destructive actions have explicit safeguards.

## Repository Contents

- `SKILL.md`: Main Bash Pro instructions.
- `.editorconfig`, `.shellcheckrc`, `.pre-commit-config.yaml`: Development tooling configuration.
- `scripts/`: Example scripts.
- `test/`: Bats tests.
- `README.md`: Setup and scripting guidance.

## Important Note

Bash is suitable for many automation tasks, but complex data processing or application logic may be safer and easier to maintain in Python or another general-purpose language.

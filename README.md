# Bash Pro

Write robust, efficient Bash scripts with advanced shell techniques, error handling, and automation patterns.

## Features

- Task-focused guidance and practical workflows.
- Examples and implementation recommendations.
- Best practices for quality, reliability, and maintainability.

## Installation

Copy the skill into your agent skills directory:

```bash
mkdir -p .claude/skills/bash-pro
cp SKILL.md .claude/skills/bash-pro/SKILL.md
```

## Usage

Ask your AI coding assistant to use **Bash Pro** when working on a related task. Follow the instructions in `SKILL.md`.

## Repository Contents

- `SKILL.md`: Skill instructions.
- `README.md`: Overview and installation guidance.
- `LICENSE`: MIT License.

## License

MIT License. See [LICENSE](LICENSE).

## Additional Resources

Added `.pre-commit-config.yaml`, `.shellcheckrc`, `.editorconfig`, `scripts/example.sh`, and a Bats smoke test under `test/`. The pre-commit hooks expect ShellCheck, shfmt, and checkbashisms to be installed.

# Changelog

## Unreleased

- Fix: `get_linters`/`get_formatters` behaviour - calling with no argument now returns the full language->tools mapping (preserves backward compatibility).
- Fix: Avoid shadowing Lua standard library (`table`) in `table_contains`.
- Improvement: `file_exists` now uses `vim.loop.fs_stat` for robust filesystem checks.
- Improvement: Removed unnecessary `_G.vim` assignment and reduced global pollution.
- Add: `.stylua.toml` and `.luacheckrc` to standardize style and linting.
- Add: `CONTRIBUTING.md` with formatting/linting instructions.

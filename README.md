# NeoTalon

A customizable Neovim Personal Development Environment — batteries included but fully configurable.

This repository is mirrored from Codeberg: https://codeberg.org/rakeshsingh/neotalon ->
Github: https://github.com/rakeshsingh77/neotalon

---

## Table of Contents

- [What is NeoTalon?](#what-is-neotalon)
- [Quick Start](#quick-start)
  - [Requirements](#requirements)
  - [Install](#install)
  - [Update & Manage Plugins](#update--manage-plugins)
- [Architecture & Layout](#architecture--layout)
  - [`plugins-available` vs `plugins-enabled`](#plugins-available-vs-plugins-enabled)
  - [Configuration files (`conf`)](#configuration-files-conf)
  - [Keymaps (`keymaps`)](#keymaps-keymaps)
  - [Variables (`vars`)](#variables-vars)
- [Enable / Disable Modules](#enable--disable-modules)
- [Adding New Modules & Plugins](#adding-new-modules--plugins)
  - [Plugin spec example](#plugin-spec-example)
  - [Plugin-specific configuration (`conf`)](#plugin-specific-configuration-conf)
  - [Keymaps for your module](#keymaps-for-your-module)
- [Languages / LSP / Linters / Formatters](#languages--lsp--linters--formatters)
- [Default Key Mappings](#default-key-mappings)
  - [Leader key](#leader-key)
  - [Common prefixes](#common-prefixes)
- [Overriding & Defining New Mappings](#overriding--defining-new-mappings)
- [Contributing](#contributing)
- [Troubleshooting & Notes](#troubleshooting--notes)

---

## What is NeoTalon?

NeoTalon is a curated Neovim configuration that aims to be a modern, extendable "personal development environment". It provides:

- A plugin-driven, lazy-loaded setup (via `lazy.nvim`).
- Opinionated defaults that are easy to override.
- A simple convention for enabling/disabling modules and defining per-module configuration and keymaps.

This repository is intended as a base you can fork and customize to your workflows.

Note that this project is currently under development and should be considered beta quality.
It is tested on Manjaro and Red Hat 8, and should work on any modern Linux distro.
**Windows is not currenly supported.**

---

## Quick Start

### Requirements

- Neovim 0.9+ (recommended)
- Git
- Optional but practical tools: ripgrep (`rg`), fd, node/npm or pnpm/yarn for some plugins, and `python` for Python LSP/formatters if used.

### Install

Clone into your Neovim config directory (or follow your own symlink pattern):

```bash
git clone https://github.com/rakeshsingh77/neotalon ~/.config/nvim
# then start nvim; lazy.nvim will be bootstrapped automatically
```

On first start, `lazy.nvim` will install plugins and Mason can be used to install language servers, linters and formatters.

### Update & Manage Plugins

- Open Neovim and run `:Lazy` to interact with the plugin manager UI.
- `:Lazy update` runs updates.
- If a plugin is not loading, ensure its plugin spec exists inside `lua/neotalon/plugins-enabled/`.

---

## Architecture & Layout

Important directories (in `lua/neotalon`):

- `plugins-available/` — Plugin specs you can enable (examples and off-by-default modules).
- `plugins-enabled/` — Plugin specs that are imported by `lazy.nvim` and therefore active.
- `conf/` — Per-module configuration files. These are loaded with `run_config("<module>")` if present.
- `keymaps/` — `which-key` mapping files. `set_keymap` will source a `keymaps/<module>.lua` when available.
- `vars/` — Global variables such as colorscheme, leader key and language tool selections.

Files of note:

- `lua/neotalon/conf/lazy.lua` bootstraps and configures `lazy.nvim` and imports `neotalon.plugins-enabled`.
- `lua/neotalon/functions.lua` exposes helpers: `run_config()` and `set_keymap()` which the plugin specs use.

---

## Enable / Disable Modules

NeoTalon uses a simple filesystem convention:

- To enable a plugin/module, put its Lua spec file into `lua/neotalon/plugins-enabled/` (copy or **symlink** from `plugins-available/` if you want to keep the original). `lazy.nvim` imports `neotalon.plugins-enabled` so any specs in that directory are loaded.
  Use of symlinks is recommended to keep `plugins-available/` as the source of truth.

- To disable, remove the link or file (or move it to `plugins-available/` if not using the symlink method).

Examples:

```bash
# enable by symlinking
ln -s ../plugins-available/telescope.lua lua/neotalon/plugins-enabled/telescope.lua

# disable by moving
git mv lua/neotalon/plugins-enabled/telescope.lua lua/neotalon/plugins-available/
```

After enabling/disabling a plugin, run `nvim` and use `:Lazy sync` or restart to apply changes.

---

## Adding New Modules & Plugins

Follow these steps to add a new plugin or module in a way that fits NeoTalon's conventions.

1. Create a plugin spec file (preferably in `lua/neotalon/plugins-available/`) that returns a table with one or more plugin specs. Example filename: `lua/neotalon/plugins-available/my-plugin.lua`.
2. Add a corresponding conf file if you need custom configuration: `lua/neotalon/conf/my-plugin.lua` with a `setup()` function.
3. Add keymaps (optional): `lua/neotalon/keymaps/my-plugin.lua` using `which-key`.
4. Enable the plugin by creating/symlinking to `lua/neotalon/plugins-enabled/my-plugin.lua`.

### Plugin spec example

```lua
-- lua/neotalon/plugins-available/example.lua
return {
  {
    "owner/example.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      run_config("example") -- will load lua/neotalon/conf/example.lua.setup()
    end,
  },
}
```

### Plugin-specific configuration (`conf`)

Create `lua/neotalon/conf/example.lua`:

```lua
local M = {}

function M.setup()
  require('example').setup({ option = true })
end

return M
```

`run_config("example")` will automatically require `neotalon.conf.example` and call `setup()` (if present).

### Keymaps for your module

Optionally, create `lua/neotalon/keymaps/example.lua` and use `which-key`:

```lua
local wk = require('which-key')

wk.add({
  { "<leader>x", name = "Example" },
  { "<leader>xe", "<cmd>ExampleDoThing<cr>", desc = "Do Thing" },
})
```

The code in `run_config()` calls `set_keymap()` which will try to require `neotalon.keymaps.example` automatically.

---

## Languages / LSP / Linters / Formatters

Language/tool selection lives in `lua/neotalon/vars/languages.lua`. Each language entry has flags for `lsp`, `linter`, `formatter`, and `debugger`, with `enabled = true/false` and tool names.

- To enable a server or tool, edit `vars/languages.lua` and set `enabled = true` (and add the server/tool name if needed).
- Mason integration will use these tables to install the required servers and tools.

Example (Python):

```lua
python = {
  lsp = { enabled = true, servers = { "pyright" } },
  linter = { enabled = true, tools = { "ruff" } },
  formatter = { enabled = true, tools = { "black" } },
}
```

Run `:Mason` in Neovim to install the listed tools.

---

## Default Key Mappings

### Leader key

- The leader key is set in `lua/neotalon/vars/vim.lua` as `MAPLEADER` (defaults to space `" "`). The leader is applied early in `lua/neotalon/keymaps/vim.lua`.

### Common prefixes

There are a number of common prefixes established across modules (examples):

- `<leader>t` — Telescope related actions
- `<leader>g` — Git / Neogit actions
- `<leader>h` — Harpoon
- `<leader>r` — Code runner actions
- `<leader>s` — Snacks (snippet manager)
- `<leader>y` — Yanky / yank history

For the full, up-to-date list of mappings, see the files in `lua/neotalon/keymaps/`.

---

## Overriding & Defining New Mappings

- To **add** mappings for a module, add `lua/neotalon/keymaps/<module>.lua` and call `which-key` as shown above.
- To **override** an existing mapping, edit its file in `lua/neotalon/keymaps/` and change the mapping. Since keymaps are applied on startup by `set_keymap(module)`, edits will take effect after restarting Neovim.

If you only need a quick override without editing the repo files, place a file with the same path under your personal config (if you split config) or create a file that runs on startup to call `which-key` with your replacements.

> Tip: When changing a mapping, prefer to adjust the `keymaps` file for that plugin to keep mapping logic co-located with the plugin configuration.

---

## Contributing

- Add new plugins as `plugins-available` and enable them via `plugins-enabled`.
- Add or update `conf` and `keymaps` files to ship sensible defaults with your plugins.
- Keep changes small and focused and open a PR describing the motivation and user-facing behavior.

Please follow the repository's `CONTRIBUTING.md` for contribution guidelines.

---

## Troubleshooting & Notes

- If a plugin does not load, ensure its spec file is in `plugins-enabled/` and that the spec table is correct (see examples in `plugins-available/`).
- `run_config()` will silently ignore missing `conf` files — this allows optional configuration files.
- Use `:Lazy log` and `:Lazy health` for debugging plugin loading issues.
- If you are running an Arch based distro, you currently need to install `lua-language-server` from the software repository instead of using Mason.
  This is due to a library compatibility issue with the Arch `lua` package affecting libbfd-2.38-system.so
  (December, 2025)

---

-- Luacheck configuration
std = "lua53"

-- Recognize these globals used by Neovim and this project
globals = {
  "vim",
  "use",
  "require",
  "pcall",
  "LANGUAGES",
  "run_config",
  "set_keymap",
  "TableConcat",
}

-- Exclude third-party or generated code if added later
exclude_files = { "**/site/**" }

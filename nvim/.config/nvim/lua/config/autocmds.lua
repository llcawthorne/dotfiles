-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Disable continuation of single-line comments in all languages
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

-- Indentation rules:
-- Go: real tabs, width 4
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Python, Rust, Kotlin, Java, C, C++: 4 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "rust", "kotlin", "java", "c", "cpp" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Semicolon operator shortcuts: Elixir (pipe) and Haskell (bind)
local semicolon_shortcuts = {
  elixir = { rhs = "|> ", desc = "Insert Elixir pipe operator" },
  haskell = { rhs = ">>= ", desc = "Insert Haskell bind operator" },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(semicolon_shortcuts),
  callback = function(args)
    local m = semicolon_shortcuts[args.match]
    vim.keymap.set("i", ";;", m.rhs, { buffer = args.buf, desc = m.desc })
  end,
})

-- The HTML indent rules htmldjango uses don't know Django tags, so typing
-- the closing %} would snap the line back to column 0.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "htmldjango",
  callback = function()
    vim.opt_local.indentkeys:remove({ "{", "}" })
  end,
})

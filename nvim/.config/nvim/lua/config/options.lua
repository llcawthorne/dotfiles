-- Options are automatically loaded before lazy.nvim startup.
require("config.remote_clipboard").setup()

vim.opt.relativenumber = false
vim.g.autoformat = true

-- Default indentation: 2 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Color columns at 81 and 121
vim.opt.colorcolumn = "81,121"

-- Root detection: check Cargo.lock alongside .git/lua after LSP so scripts
-- and Cargo files inside a Rust project stay scoped to the crate/workspace.
vim.g.root_spec = { "lsp", { "Cargo.lock", ".git", "lua" }, "cwd" }

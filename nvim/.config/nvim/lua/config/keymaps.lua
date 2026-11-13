-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Run tests for the current file's package (go test) or crate (cargo test) in a split
vim.keymap.set("n", "<leader>rt", function()
  local dir = vim.fn.expand("%:p:h")
  local cmd = vim.bo.filetype == "rust" and "cargo test" or "go test"
  vim.cmd("botright split | resize 15 | terminal cd " .. vim.fn.shellescape(dir) .. " && " .. cmd)
end, { desc = "[R]un [T]ests" })

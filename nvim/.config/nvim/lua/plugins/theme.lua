local omarchy_theme = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")

if vim.uv.fs_stat(omarchy_theme) then
  return dofile(omarchy_theme)
end

return {
  { "folke/tokyonight.nvim", opts = { style = "night" } },
  { "LazyVim/LazyVim", opts = { colorscheme = "tokyonight" } },
}

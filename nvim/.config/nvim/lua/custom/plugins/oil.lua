-- Oil is a file explorer that lets you edit your filesystem like a normal buffer
-- https://github.com/stevearc/oil.nvim

local plugins = {
  { src = 'https://github.com/stevearc/oil.nvim' },
}

if vim.g.have_nerd_font then
  table.insert(plugins, 'https://github.com/nvim-tree/nvim-web-devicons')
end

vim.pack.add(plugins)

require('oil').setup {
  -- Keep neo-tree if a directory is passed directly, but allow '-' anywhere
  default_file_explorer = false,
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
  },
}

-- The classic vinegar/oil shortcut: '-' opens parent directory of current buffer
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory in Oil' })


-- autopairs
-- https://github.com/windwp/nvim-autopairs

vim.pack.add { 'https://github.com/windwp/nvim-autopairs' }
require('nvim-autopairs').setup {}

-- don't pair ' in markdown (Rust lifetimes in code blocks)
for _, rule in ipairs(require('nvim-autopairs').get_rules "'") do
  rule.not_filetypes = rule.not_filetypes or {}
  table.insert(rule.not_filetypes, 'markdown')
end

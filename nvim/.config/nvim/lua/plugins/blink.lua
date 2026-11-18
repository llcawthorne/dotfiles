local function is_prose()
  return vim.tbl_contains({ "markdown", "text" }, vim.bo.filetype)
end

return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        auto_show = function()
          return not is_prose()
        end,
      },
      list = {
        selection = {
          preselect = function()
            return not is_prose()
          end,
          auto_insert = function()
            return not is_prose()
          end,
        },
      },
      ghost_text = {
        enabled = function()
          return not is_prose() and not not vim.g.ai_cmp
        end,
      },
    },
  },
}

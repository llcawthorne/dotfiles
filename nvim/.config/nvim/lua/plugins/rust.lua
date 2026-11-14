return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      vim.treesitter.language.register("rust", "rs")
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
          },
        },
      },
    },
  },
}

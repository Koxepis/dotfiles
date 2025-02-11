return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim", lazy = "false", opts = {
    style = "dark",
  } },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}

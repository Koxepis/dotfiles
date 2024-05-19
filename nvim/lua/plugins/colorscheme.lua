return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
    },
  },

  {
    "EdenEast/nightfox.nvim",
    config = function()
      options = {
        transparent = true,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      }
    end,
  },
}

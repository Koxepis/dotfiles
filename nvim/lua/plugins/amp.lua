return {
  {
    "sourcegraph/amp.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("amp").setup()
    end,
  },
}

return {
  -- Nyoom framework (optional, provides macros/modules; not a colorscheme)
  {
    "nyoom-engineering/nyoom.nvim",
    lazy = true,
    dependencies = { "rktjmp/lush.nvim" },
  },

  -- Oxocarbon colorscheme from Nyoom Engineering
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      pcall(vim.cmd.colorscheme, "oxocarbon")
    end,
  },
}

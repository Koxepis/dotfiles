return {
  -- Other plugins
  { "lukas-reineke/headlines.nvim" },

  -- Setup config for colorscheme
  -- Nord
  {
    "shaunsingh/nord.nvim",
    "nord.nvim",
    name = "nord",
    lazy = false, -- make sure to load the colorscheme immediately
    priority = 1000, -- ensure it loads after other plugins
    config = function()
      require("nord").setup({
        transparent = true, -- Enable transparency
        -- Or, set a custom background color and make it transparent
        -- bgcolor = "#3b4252",
        -- bgdelta = 15,
        italic = true,
        bold = true,
      }, {
        "lukas-reineke/headlines.nvim",
        config = function()
          require("headlines").setup({
            markdown = {
              headline_highlights = {
                "Headline1",
                "Headline2",
                "Headline3",
                "Headline4",
                "Headline5",
                "Headline6",
              },
              codeblock_highlight = "CodeBlock",
              dash_highlight = "Dash",
              quote_highlight = "Quote",
            },
          })
        end,
      })
      vim.cmd("colorscheme nord")
    end,
  },

  -- Rose Pine
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = false, -- make sure to load the colorscheme immediately
  --   priority = 1000, -- ensure it loads after other plugins
  --   config = function()
  --     require("rose-pine").setup({
  --       transparent_bg = true, -- Enable transparency
  --       -- Add any other Rose Pine configuration options here
  --     })
  --     vim.cmd("colorscheme rose-pine")
  --   end,
  -- },

  -- Set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord", -- Set Nord as the default colorscheme
    },
  },
  -- ... (your existing plugins)
}

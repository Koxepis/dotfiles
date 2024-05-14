return {
  -- Other plugins
  -- { "whatyouhide/vim-gotham" },
  -- { "nyoom-engineering/oxocarbon.nvim" },
  { "Shatur/neovim-ayu" },

  -- TODO: Set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu-mirage",
    },
  },

  -- Setup config for colorscheme
  -- WARN: DISABLED NORD THEME
  -- {
  --   "shaunsingh/nord.nvim",
  --   "nord.nvim",
  --   name = "nord",
  --   lazy = false, -- make sure to load the colorscheme immediately
  --   priority = 1000, -- ensure it loads after other plugins
  --   config = function()
  --     require("nord").setup({
  --       transparent = true, -- Enable transparency
  --       -- Or, set a custom background color and make it transparent
  --       -- bgcolor = "#3b4252",
  --       -- bgdelta = 15,
  --       italic = true,
  --       bold = true,
  --     }, {
  --       "lukas-reineke/headlines.nvim",
  --       config = function()
  --         require("headlines").setup({
  --           markdown = {
  --             headline_highlights = {
  --               "Headline1",
  --               "Headline2",
  --               "Headline3",
  --               "Headline4",
  --               "Headline5",
  --               "Headline6",
  --             },
  --             codeblock_highlight = "CodeBlock",
  --             dash_highlight = "Dash",
  --             quote_highlight = "Quote",
  --           },
  --         })
  --       end,
  --     })
  --     vim.cmd("colorscheme nord")
  --   end,
  -- },

  -- WARN: DISABLED ROSE PINE THEME
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

  -- WARN: DISABLED AURA THEME
  -- {
  --   "daltonmenezes/aura-theme.nvim",
  --   lazy = false, -- make sure to load the colorscheme immediately
  --   priority = 1000, -- ensure it loads after other plugins
  --   config = function()
  --     require("aura").setup({
  --       transparent = true, -- Enable transparency
  --       italic = true,
  --       bold = true,
  --     })
  --     vim.cmd("colorscheme aura") -- Set colorscheme to aura
  --   end,
  -- },

  -- WARN: DISABLED GOTHAM THEME
  -- {
  --   "vim-gotham",
  --   name = "gotham",
  --   lazy = false, -- make sure to load the colorscheme immediately
  --   priority = 1000, -- ensure it loads after other plugins
  --   config = function()
  --     vim.g.gotham_enable_italic_comment = 1
  --     vim.g.gotham_enable_sp_icons = 1
  --     vim.g.gotham_color_overrides = {
  --       background = "NONE", -- Set this to "NONE" for transparent background
  --     }
  --     vim.cmd("colorscheme gotham")
  --   end,
  -- },
  --

  -- WARN: DISABLE OXOCARBON
  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  --   name = "oxocarbon",
  --   lazy = false, -- make sure to load the colorscheme immediately
  --   priority = 1000, -- ensure it loads after other plugins
  -- },

  {
    "Shatur/neovim-ayu",
    name = "ayu",
    lazy = false, -- make sure to load the colorscheme immediately
    priority = 1000, -- ensure it loads after other plugins
    opts = {
      transparent = true, -- Enable transparency
      styles = {
        italic = true, -- Enable italic style
        bold = true, -- Enable bold style
      },
    },
    config = function()
      -- Set the winblend option to disable the background color
      vim.opt.winblend = 0
    end,
  },
  -- ... (your existing plugins)
}

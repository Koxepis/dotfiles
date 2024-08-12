return {
  -- other plugins...
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- make sure to set this to false for the setup to work
    config = function()
      require("catppuccin").setup({
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = { "italic" },
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          aerial = true,
          alpha = true,
          dashboard = true,
          flash = true,
          headlines = true,
          illuminate = true,
          indent_blankline = { enabled = true },
          leap = true,
          lsp_trouble = true,
          mason = true,
          markdown = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          navic = { enabled = true, custom_bg = "lualine" },
          neotest = true,
          neotree = true,
          noice = true,
          semantic_tokens = true,
          telescope = true,
          treesitter_context = true,
          which_key = true,
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })

      -- setup must be called before loading
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  -- other plugins...

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "eldritch-theme/eldritch.nvim",
    lazy = true,
    name = "eldritch",
    opts = {
      -- This function is found in the documentation
      on_highlights = function(highlights)
        -- nvim-spectre highlight colors
        highlights.DiffChange = { bg = "#37f499", fg = "black" }
        highlights.DiffDelete = { bg = "#f265b5", fg = "black" }

        -- horizontal line that goes across where cursor is
        highlights.CursorLine = { bg = "#3f404f" }
        -- highlights.Comment = { fg = "#a5afc2", italic = true }

        -- I do the line below to change the color of bold text
        highlights["@markup.strong"] = { fg = "#f265b5", bold = true }

        -- Change the spell underline color
        --
        -- Every time you change an undercurl setting here, make sure to kill the tmux
        -- session or you won't see the changes
        --
        -- For this to work in kitty, you need to add some configs to your
        -- tmux.conf file, go to that file and look for "Undercurl support"
        --
        -- You could also set these to bold or italic if you wanted, example:
        -- highlights.SpellBad = { sp = "#37f499", undercurl = true, bold = true, italic = true }
        --
        highlights.SpellBad = { sp = "#f16c75", undercurl = true, bold = true, italic = true }
        highlights.SpellCap = { sp = "#f1fc79", undercurl = true, bold = true, italic = true }
        highlights.SpellLocal = { sp = "#ebfafa", undercurl = true, bold = true, italic = true }
        highlights.SpellRare = { sp = "#a48cf2", undercurl = true, bold = true, italic = true }

        -- highlights.SpellBad = { sp = "#f16c75", undercurl = true }
        -- highlights.SpellCap = { sp = "#f16c75", undercurl = true }
        -- highlights.SpellLocal = { sp = "#f16c75", undercurl = true }
        -- highlights.SpellRare = { sp = "#f16c75", undercurl = true }

        -- My headings are this color, so this is not a good idea
        -- highlights.SpellBad = { sp = "#f16c75", undercurl = true, fg = "#37f499" }
        -- highlights.SpellCap = { sp = "#f16c75", undercurl = true, fg = "#37f499" }
        -- highlights.SpellLocal = { sp = "#f16c75", undercurl = true, fg = "#37f499" }
        -- highlights.SpellRare = { sp = "#f16c75", undercurl = true, fg = "#37f499" }

        -- These colors are used by mini-files.lua to show git changes
        highlights.MiniDiffSignAdd = { fg = "#f1fc79", bold = true }
        highlights.MiniDiffSignChange = { fg = "#37f499", bold = true }

        -- highlights.Normal = { bg = "#09090d", fg = "#ebfafa" }
      end,
      -- Overriding colors globally
      -- These colors can be found in the palette.lua file
      -- https://github.com/eldritch-theme/eldritch.nvim/blob/master/lua/eldritch/palette.lua
      on_colors = function(colors)
        -- This is in case you want to change the background color (where you type
        -- text in neovim)
        -- colors.bg = "#09090d"
        colors.comment = "#a5afc2"
      end,
    },
  },
}

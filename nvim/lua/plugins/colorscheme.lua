return {
  --init here
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "eldritch",
    },
  },
  -- tokyonight
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
  -- eldritch
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    name = "eldritch",
    opts = {
      lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true, fg = "#646573" }, -- Added fg color here
        keywords = { italic = true },
        strings = { fg = "#c3e88d" },
        functions = {},
        parameter = { fg = "#ff966c" },
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
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
        highlights.String = { fg = "#c3e88d" }

        highlights["@parameter"] = { fg = "#ff966c" }
        -- highlights["@variable"] = { fg = "#ff966c" }

        -- TSX specific (if needed)
        highlights["@parameter.tsx"] = { fg = "#ff966c" }
        -- highlights["@variable.tsx"] = { fg = "#ff966c" }

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
        colors.yellow = "#c3e88d"
      end,
    },
  },
}

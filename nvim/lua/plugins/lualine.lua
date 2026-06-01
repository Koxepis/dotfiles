-- Bubbles statusline, Oxocarbon-tuned to match kitty + p10k.
-- Based on: https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/bubbles.lua
-- Glyphs use \u{} escapes so the source survives any PUA-stripping editor.

return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local colors = {
      bg      = "#161616", -- kitty bg
      bg_dim  = "#262626", -- chrome grey, matches p10k
      fg      = "#DDE1E6",
      fg_dim  = "#6F6F6F",
      blue    = "#33B1FF", -- normal
      green   = "#42BE65", -- insert
      cyan    = "#3DDBD9", -- visual
      magenta = "#FF7EB6", -- replace
      yellow  = "#FFE97B", -- command
      red     = "#EE5396", -- diagnostics error
    }

    -- Powerline + Nerd Font glyphs (Maple Mono NF has all of these).
    local g = {
      bubble_l = "\u{e0b6}", --
      bubble_r = "\u{e0b4}", --
      sep_l    = "\u{e0b1}", --
      sep_r    = "\u{e0b3}", --
      branch   = "\u{e0a0}", --
      added    = "\u{f457}", --
      modified = "\u{f459}", --
      removed  = "\u{f458}", --
      error_   = "\u{f057}", --
      warn     = "\u{f071}", --
      info     = "\u{f05a}", --
      hint     = "\u{f0eb}", --
      readonly = "\u{f023}", --
    }

    local oxocarbon_bubbles = {
      normal = {
        a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
        b = { fg = colors.fg, bg = colors.bg_dim },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert  = { a = { fg = colors.bg, bg = colors.green,   gui = "bold" } },
      visual  = { a = { fg = colors.bg, bg = colors.cyan,    gui = "bold" } },
      replace = { a = { fg = colors.bg, bg = colors.magenta, gui = "bold" } },
      command = { a = { fg = colors.bg, bg = colors.yellow,  gui = "bold" } },
      inactive = {
        a = { fg = colors.fg_dim, bg = colors.bg, gui = "bold" },
        b = { fg = colors.fg_dim, bg = colors.bg },
        c = { fg = colors.fg_dim, bg = colors.bg },
      },
    }

    return {
      options = {
        theme = oxocarbon_bubbles,
        component_separators = "",
        section_separators = { left = g.bubble_r, right = g.bubble_l },
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "snacks_dashboard" } },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = g.bubble_l }, right_padding = 2 },
        },
        lualine_b = {
          { "branch", icon = g.branch },
          {
            "diff",
            symbols = {
              added    = g.added    .. " ",
              modified = g.modified .. " ",
              removed  = g.removed  .. " ",
            },
            diff_color = {
              added    = { fg = colors.green },
              modified = { fg = colors.yellow },
              removed  = { fg = colors.red },
            },
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = { modified = " \u{25cf}", readonly = " " .. g.readonly },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            symbols = {
              error = g.error_ .. " ",
              warn  = g.warn   .. " ",
              info  = g.info   .. " ",
              hint  = g.hint   .. " ",
            },
          },
          { "filetype", icon_only = false },
        },
        lualine_y = {
          "progress",
          { function() return os.date("%H:%M:%S") end, icon = "\u{f017}" },
        },
        lualine_z = {
          { "location", separator = { right = g.bubble_r }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { { "filename", path = 1 } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { { "location" } },
      },
      extensions = { "lazy", "mason", "trouble", "neo-tree", "quickfix" },
    }
  end,
  config = function(_, opts)
    require("lualine").setup(opts)
    local timer = (vim.uv or vim.loop).new_timer()
    timer:start(1000, 1000, vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end))
  end,
}

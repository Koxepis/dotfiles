return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss Notifications",
    },
    { "<leader>uN", "<cmd>Notifications<cr>", desc = "Show Notifications" },
  },
  config = function()
    local notify = require("notify")

    notify.setup({
      render = "default",
      stages = "slide",
      level = vim.log.levels.INFO,
      background_colour = "NotifyBackground",
      icons = {
        ERROR = "✗",
        WARN = "⚠",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },
      time_formats = {
        notification = "%H:%M",
        notification_history = "%FT%T",
      },
      on_close = nil,
      minimum_width = 50,
      fps = 60,
      top_down = true,
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
        if vim.api.nvim_win_get_config(win).relative == "editor" then
          vim.wo[win].winblend = 10
        end
      end,
    })

    -- Custom highlights for nvim-notify
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#f16c75" })
        vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = "#f16c75" })
        vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = "#f16c75" })
        vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#f7c67f" })
        vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = "#f7c67f" })
        vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = "#f7c67f" })
        vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#04d1f9" })
        vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = "#04d1f9" })
        vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = "#04d1f9" })
        vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#7081d0" })
        vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = "#7081d0" })
        vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = "#7081d0" })
        vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = "#a48cf2" })
        vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = "#a48cf2" })
        vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = "#a48cf2" })
      end,
    })

    -- Set vim.notify to use nvim-notify
    vim.notify = notify

    -- Handle the case when noice is not enabled
    if not LazyVim.has("noice.nvim") then
      LazyVim.on_very_lazy(function()
        vim.notify = notify
      end)
    end
  end,
}

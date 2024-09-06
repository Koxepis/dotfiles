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
      background_colour = "#21222c",
      icons = {
        ERROR = "",
        WARN = "⚠",
        INFO = "ℹ",
        DEBUG = "",
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
      highlights = {
        background = "Normal",
        title = "Title",
        border = "FloatBorder",
        icon = "Special",
      },
      timeout = 1500,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
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

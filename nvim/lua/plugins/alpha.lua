return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
██╗░░██╗░█████╗░██╗░░██╗███████╗██████╗░██╗██╗░██████╗
██║░██╔╝██╔══██╗╚██╗██╔╝██╔════╝██╔══██╗██║╚█║██╔════╝
█████═╝░██║░░██║░╚███╔╝░█████╗░░██████╔╝██║░╚╝╚█████╗░
██╔═██╗░██║░░██║░██╔██╗░██╔══╝░░██╔═══╝░██║░░░░╚═══██╗
██║░╚██╗╚█████╔╝██╔╝╚██╗███████╗██║░░░░░██║░░░██████╔╝
╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝░░░╚═════╝░
      ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      -- stylua: ignore
      dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
      dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
      dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
      dashboard.button("g", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
      dashboard.button("c", " " .. " Config",          "<cmd> lua require('lazyvim.util').telescope.config_files()() <cr>"),
      dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
      dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
      dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
      dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
    }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,

    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          -- Get the current date and time

          -- Get the current hour
          local current_hour = tonumber(os.date("%H"))

          -- Define the greeting variable
          local greeting

          if current_hour < 5 then
            greeting = "    Good night, Koxepi!"
          elseif current_hour < 12 then
            greeting = "  󰼰 Good morning, Koxepi!"
          elseif current_hour < 17 then
            greeting = "    Good afternoon, Koxepi!"
          elseif current_hour < 20 then
            greeting = "  󰖝  Good evening, Koxepi!"
          else
            greeting = "  󰖔  Good night, Koxepi!"
          end

          local stats = require("lazy").stats()
          local count = (math.floor(stats.startuptime * 100) / 100)
          dashboard.section.footer.val = {
            greeting,
            "󱐌 " .. stats.count .. " plugins loaded in " .. count .. " ms",
          }

          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}

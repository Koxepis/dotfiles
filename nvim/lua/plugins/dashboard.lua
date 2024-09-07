return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local logo = [[
                                 "loaded very lazy"
   ██╗  ██╗ ██████╗ ██╗  ██╗██╗   ██╗██╗███╗   ███╗
   ██║ ██╔╝██╔═══██╗╚██╗██╔╝██║   ██║██║████╗ ████║
   █████╔╝ ██║   ██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
   ██╔═██╗ ██║   ██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
██╗██║  ██╗╚██████╔╝██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]
    -- NOTE: LOGO USING ANSI SHADOW TEXT
    logo = string.rep("\n", 8) .. logo .. "\n\n\n\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "ene | startinsert",                        desc = " New File",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                       desc = " Recent Files",    icon = " ", key = "r" },
          { action = "Telescope find_files",                     desc = " Find File",       icon = " ", key = "f" },
          -- { action = "Telescope live_grep",                   desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua require("persistence").load()',        desc = " Restore Session", icon = " ", key = "s" },
          -- { action = [[lua LazyVim.pick.telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
          -- { action = "Lazy",                                  desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "LazyExtras",                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "qa",                                       desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
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
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            "",
            "",
            "",
            greeting,
            "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
          }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}

return {
  "yetone/avante.nvim",
  -- Load lazily with the rest of your UI plugins
  event = "VeryLazy",
  -- Use latest commit unless you prefer a tagged release
  version = false,
  -- Avante relies on a few common UI/libs
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "stevearc/dressing.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  -- Build native templates/tokenizers if needed
  build = "make", -- or `bash ./build.sh`
  -- Default to OpenAI; updated to new providers schema
  opts = {
    provider = "openai",
    providers = {
      openai = {
        api_key = vim.env.OPENAI_API_KEY,
        -- Pick your preferred model later
        model = "gpt-4o-mini",
      },
    },
  },
}

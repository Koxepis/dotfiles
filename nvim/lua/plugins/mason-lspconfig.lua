-- Ensure mason-lspconfig is on a recent commit compatible with LazyVim
-- Fixes: module 'mason-lspconfig.mappings' not found
return {
  {
    -- Plugin has moved from williamboman -> mason-org
    "mason-org/mason-lspconfig.nvim",
    name = "mason-lspconfig.nvim", -- keep the same logical name
    version = false, -- track latest
  },
}

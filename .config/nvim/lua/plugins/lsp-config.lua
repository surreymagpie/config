return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "intelephense",
          "lua_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.intelephense.setup({})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format file" })
    end,
  },
}

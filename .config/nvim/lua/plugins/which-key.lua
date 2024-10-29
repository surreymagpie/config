return {
  "folke/which-key.nvim",
  dependencies = {
    {
      'echasnovski/mini.icons',
      version = '*'
    }
  },
  event = "VeryLazy",

  config = function()
    require('mini.icons').setup()
    local wk = require("which-key")
    wk.add({
      { "<leader>b", group = "Buffers"},
      { "<leader>c", group = "Code"},
      { "<leader>f", group = "Files"},
      { "<leader>s", group = "Splits"},
      { "<leader>t", group = "Tabs"},
    })
  end,

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({
          global = false,
        })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

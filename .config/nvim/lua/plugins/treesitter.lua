return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "vim", "javascript", "html", "php", "css" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

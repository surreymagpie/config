return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      separator_style = "slant",

      -- Don't show above neo-tree window
      offsets = {
        {
          filetype = "neo-tree",
          highlight = "Directory",
          separator = true,
          text = "Files",
          text_align = "left",
        }
      }
    }
  }
}


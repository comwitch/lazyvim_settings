local colorscheme = require("lazyvim.plugins.colorscheme")
return {
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}

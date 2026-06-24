return {
  { "vimwiki/vimwiki" },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    dir = "~/gitv/gitv.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("gitv")
    end,
  },
}

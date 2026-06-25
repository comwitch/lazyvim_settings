-- ~/.config/nvim/lua/plugins/blink.lua

return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.completion = opts.completion or {}

      opts.completion.menu = opts.completion.menu or {}
      opts.completion.menu.auto_show = true

      opts.completion.list = opts.completion.list or {}
      opts.completion.list.selection = opts.completion.list.selection or {}
      opts.completion.list.selection.auto_insert = false

      return opts
    end,
  },
}

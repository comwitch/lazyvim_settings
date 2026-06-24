-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- ~/.config/nvim/lua/config/keymaps.lua

local keymap = vim.keymap.set

-- Unfold all
keymap("n", "zr", "zR", { desc = "Open all folds" })

-- use ;; instead of ;
keymap("n", ";;", ";", { desc = "Repeat f/t motion" })

-- command-line window
keymap("n", "q;", "q:", { desc = "Open command-line window" })

-- save
keymap("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
keymap("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file" })

-- buffer navigation
keymap("n", "<C-n>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap("n", "<C-p>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- make run
keymap("n", "<C-y>", "<cmd>!stdbuf -i0 -o0 make run<CR>", { desc = "Make run" })

-- command alias replacement
vim.api.nvim_create_user_command("ZR", "normal zR", {})

local function toggle_wrap()
  if vim.wo.wrap then
    print("Wrap OFF")
    vim.wo.wrap = false
    vim.opt.virtualedit = "all"

    pcall(vim.keymap.del, "n", "<Up>", { buffer = true })
    pcall(vim.keymap.del, "n", "<Down>", { buffer = true })
    pcall(vim.keymap.del, "n", "<Home>", { buffer = true })
    pcall(vim.keymap.del, "n", "<End>", { buffer = true })
    pcall(vim.keymap.del, "n", "j", { buffer = true })
    pcall(vim.keymap.del, "n", "k", { buffer = true })
    pcall(vim.keymap.del, "i", "<Up>", { buffer = true })
    pcall(vim.keymap.del, "i", "<Down>", { buffer = true })
    pcall(vim.keymap.del, "i", "<Home>", { buffer = true })
    pcall(vim.keymap.del, "i", "<End>", { buffer = true })
  else
    print("Wrap ON")
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.wo.list = false
    vim.opt.virtualedit = ""
    vim.wo.display:append("lastline")

    local opts = { buffer = true, silent = true }

    keymap("n", "<Up>", "gk", opts)
    keymap("n", "<Down>", "gj", opts)
    keymap("n", "k", "gk", opts)
    keymap("n", "j", "gj", opts)
    keymap("n", "<Home>", "g<Home>", opts)
    keymap("n", "<End>", "g<End>", opts)

    keymap("i", "<Up>", "<C-o>gk", opts)
    keymap("i", "<Down>", "<C-o>gj", opts)
    keymap("i", "<Home>", "<C-o>g<Home>", opts)
    keymap("i", "<End>", "<C-o>g<End>", opts)
  end
end

keymap("n", "<leader>w", toggle_wrap, { desc = "Toggle wrap" })

-- gitv main picker
keymap("n", "<leader>gv", "<cmd>Telescope gitv<CR>", {
  desc = "Gitv",
})

-- gitv files
keymap("n", "<leader>gf", function()
  require("telescope").extensions.gitv.gitv_files()
end, {
  desc = "Gitv files",
})

-- gitv search current word
keymap("n", "<leader>gw", function()
  local word = vim.fn.expand("<cword>")
  require("telescope").extensions.gitv.gitv({
    key = "^" .. word .. "$",
  })
end, {
  desc = "Gitv current word",
})

keymap("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Debug continue" })

keymap("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Debug step over" })

keymap("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Debug step into" })

keymap("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "Debug step out" })

keymap("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })

keymap("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional breakpoint" })

keymap("n", "<leader>dr", function()
  require("dap").repl.open()
end, { desc = "Debug REPL" })

keymap("n", "<leader>dl", function()
  require("dap").run_last()
end, { desc = "Run last debug" })

keymap("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Toggle debug UI" })

vim.keymap.set("n", "<leader>df", function()
  require("dap").focus_frame()
end, { desc = "Debug focus current frame" })

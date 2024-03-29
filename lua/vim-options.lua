vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set signcolumn=yes") -- keep gutter in fixed position
vim.cmd("set nowrap")
vim.cmd("set noshowmode")
vim.cmd("map <ScrollWheelUp> <C-Y>") -- scroll one line at a time instead of 3
vim.cmd("map <ScrollWheelDown> <C-E>")
vim.wo.number = true
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- set nerdfont
-- vim.opt.guifont = "JetBrans Mono NL"
-- vim.o.guifont = "JetBrans Mono NL"
vim.o.guifont = "JetBrainsMono Nerd Font:style=Regular,Regular:h12.5"

vim.keymap.set("n", "<leader>dd", "<cmd> lua vim.diagnostic.open_float() <CR>")

-- resize windows
vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- indent/unindent with tab/shift-tab
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- always yank to system clipboard
vim.cmd("set clipboard=unnamed")

-- set current file directory as current working directory
local map = vim.keymap.set
local fn = vim.fn
-- expand path
map('c', '%%', function()
  if (fn.getcmdtype() == ':') then
    return fn.expand('%:h')..'/'
  else
    return '%%'
  end
end
, {expr = true})

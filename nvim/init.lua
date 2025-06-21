local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
-- vim.opt.rtp:prepend('/home/tm/.opam/default/share/ocp-indent/vim')
-- vim.opt.rtp:prepend('/home/tm/.opam/default/share/merlin/vim')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.cmd [[ autocmd RecordingEnter * set cmdheight=1 ]]
-- vim.cmd [[ autocmd RecordingLeave * set cmdheight=0 ]]

require('lazy').setup('plugins')

-- KEYMAPS

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local options = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>q', ':qa<cr>', options)
vim.keymap.set('n', '<leader>c', ':bd<cr>', options)

-- Move selected text up and down
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv", options)
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv", options)

-- Resize windows with arrows
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<cr>', options)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<cr>', options)
vim.keymap.set('n', '<C-Up>', ':resize +2<cr>', options)
vim.keymap.set('n', '<C-Down>', ':resize -2<cr>', options)

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', options)
vim.keymap.set('n', '<C-j>', '<C-w>j', options)
vim.keymap.set('n', '<C-k>', '<C-w>k', options)
vim.keymap.set('n', '<C-l>', '<C-w>l', options)

-- Better scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', options)
vim.keymap.set('n', '<C-u>', '<C-u>zz', options)

-- Settings
vim.keymap.set('n', '<leader>,', ':e $MYVIMRC <CR>', options)
vim.keymap.set('n', '<leader>s', '*N', options)



-- OPTIONS

-- NEOVIDE
vim.opt.incsearch = true
-- vim.opt.backup = false							-- creates a backup file


-- sudo apt install xclip
vim.opt.clipboard = "unnamedplus"					-- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
-- vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
-- vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
-- vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = false                       -- ignore case in search patterns
-- vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
-- vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = false -- convert tabs to spaces
vim.opt.softtabstop = -1
-- vim.opt.smartindent = true
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.nu = true
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
--vim.opt.scrolloff = 8 -- is one of my fav
--vim.opt.sidescrolloff = 8
vim.opt.guifont = "JetBrainMono Nerd Font :h17" -- the font used in graphical neovim applications
vim.opt.listchars = { eol = '↵', space = ' ', tab = '  ', trail = ' ' }
vim.opt.list = true

if vim.g.neovide then
	vim.opt.guifont = { "JetBrainsMono Nerd Font", "h9" }
	vim.g.neovide_transparency = 0.9
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_fullscreen = true
	vim.g.neovide_scale_factor = 0.6
else
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

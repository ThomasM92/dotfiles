return {
	'ThePrimeagen/harpoon',
	-- lazy = true,
	keys = {
		{ '<leader>a' },
		{ '<leader>h' },
	},
	dependencies = {
		{ 'nvim-lua/plenary.nvim', lazy = true }
	},
	config = function()
		require('telescope').load_extension('harpoon')
		local options = { noremap = true }
		vim.keymap.set('n', '<leader>a', function() require('harpoon.mark').add_file() end, options)
		vim.keymap.set('n', '<leader>h', function() require('harpoon.ui').toggle_quick_menu() end, options)
	end
}


return {
	'nvim-pack/nvim-spectre',
	keys = {
		{ '<leader>S' },
	},
	dependencies = {
		{ 'nvim-lua/plenary.nvim', lazy = true }
	},
	config = function()
		local spectre = require('spectre')
		local options = { noremap = true, silent = true, desc = 'Find & Replace' }

		vim.keymap.set('n', '<leader>S', function() spectre.toggle() end, options)
	end
}

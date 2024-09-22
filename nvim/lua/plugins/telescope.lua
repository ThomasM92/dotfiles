return {
	'nvim-telescope/telescope.nvim',
	-- lazy = true,
	keys = {
		{ '<leader>fr' },
		{ '<leader>ff' },
		{ '<leader>fb' },
		{ '<leader>ft' },
		{ '<leader>fd' },
	},
	dependencies = {
		{ 'nvim-lua/plenary.nvim', lazy = true }
	},
	config = function()
		local builtin = require('telescope.builtin')
		local options = { noremap = true, silent = true }

		vim.keymap.set('n', '<leader>fr', function() builtin.oldfiles({ layout_strategy = 'horizontal' }) end, options)
		vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ layout_strategy = 'horizontal' }) end, options)
		vim.keymap.set('n', '<leader>fb', function() builtin.buffers({ initial_mode = "normal" }) end, options)
		vim.keymap.set('n', '<leader>ft', function() builtin.live_grep() end, options)
		vim.keymap.set('n', '<leader>fd', function() builtin.diagnostics({ layout_strategy = 'center', bufnr = 0 }) end, options)

		require('telescope').setup({
			pickers = {
				buffers = {
					theme = "dropdown",
					mappings = {
						n = {
							["d"] = "delete_buffer",
						}
					},
				}
			},
		})
	end
}

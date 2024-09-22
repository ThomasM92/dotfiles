return {
	'caenrique/buffer-term.nvim',
	config = function()
		local buffer_term = require('buffer-term')
		buffer_term.setup({
			terminal_options = {
				start_insert = true,
				buf_listed = false,
				no_numbers = true,
			}
		})
		vim.bo.modified = false
		vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
		vim.keymap.set({ 'n', 't' }, '<leader>t', function() buffer_term.toggle('default') end)
		-- vim.keymap.set({ 'n', 't' }, ';s', function() buffer_term.toggle('s') end)
		-- vim.keymap.set({ 'n', 't' }, ';d', function() buffer_term.toggle('d') end)
		-- vim.keymap.set({ 'n', 't' }, ';f', function() buffer_term.toggle('f') end)
		-- vim.keymap.set({ 'n', 't' }, ';;', buffer_term.toggle_last)
	end
}

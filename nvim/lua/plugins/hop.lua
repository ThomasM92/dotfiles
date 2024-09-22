return {
	'smoka7/hop.nvim',
	version = '*',
	keys = {
		{ '<leader>j' },
	},
	config = function()
		local hop = require('hop')
		local directions = require('hop.hint').HintDirection
		local options = { remap = true }

		vim.keymap.set('n', '<leader>jf', function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, options)

		vim.keymap.set('n', '<leader>jF', function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		end, options)

		vim.keymap.set('n', '<leader>jt', function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		end, options)

		vim.keymap.set('n', '<leader>jT', function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		end, options)

		vim.keymap.set('n', '<leader>jw', function()
			hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
		end, options)

		vim.keymap.set('n', '<leader>jb', function()
			hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false })
		end, options)

		vim.keymap.set('n', '<leader>jj', function()
			hop.hint_lines({ direction = directions.AFTER_CURSOR, current_line_only = false })
		end, options)

		vim.keymap.set('n', '<leader>jk', function()
			hop.hint_lines({ direction = directions.BEFORE_CURSOR, current_line_only = false })
		end, options)

		hop.setup();
	end
}

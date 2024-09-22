return {
	'stevearc/oil.nvim',
	keys = {
		-- { '<leader>e', function() require('oil').toggle_float() end },
		{ '<leader>e', "<cmd>Oil<cr>"},
	},
	config = function()
		require('oil').setup({
			view_options = {
				show_hidden = true
			},
			columns = {
				"icon",
				-- "permissions",
				"size",
				-- "mtime",
			},
			float = {
				-- padding = 5
				max_width = 100,
				max_height = 30,
			},
			win_options = {
				wrap = false,
				signcolumn = "no",
				cursorcolumn = false,
				foldcolumn = "0",
				spell = false,
				list = false,
				conceallevel = 3,
				concealcursor = "nvic",
			},
			cleanup_delay_ms = 1,
			keymaps = {
				["<leader>e"] = "actions.close",
			}
		})
	end
}

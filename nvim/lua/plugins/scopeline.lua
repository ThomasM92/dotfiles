return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		local hooks = require "ibl.hooks"
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "IndentBlankLineGrey", { fg = "#69647e" })
		end)

		require("ibl").setup({
			scope = {
				char = "▏",
				enabled = true,
				show_start = false,
				show_end = false,
				injected_languages = false,
				highlight = "IndentBlankLineGrey",
				priority = 500,
			},
		})

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}

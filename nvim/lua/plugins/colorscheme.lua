return {
	-- 'datsfilipe/vesper.nvim',
	-- "ntk148v/komau.vim",
	'rose-pine/neovim',
	-- 'kdheepak/monochrome.nvim',
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	-- name = 'komau',
	name = 'rose-pine',
	-- name = 'vesper',
	-- name = 'monochome',
	config = function()
		require('rose-pine').setup({
			--- @usage 'auto'|'main'|'moon'|'dawn'
			variant = 'auto',
			--- @usage 'main'|'moon'|'dawn'
			dark_variant = 'main',
			disable_background = true,
		})
		vim.cmd('colorscheme rose-pine')

		-- require('vesper').setup({})
		-- vim.cmd('colorscheme vesper')

		-- vim.cmd('colorscheme komau')
		-- vim.cmd('colorscheme monochrome')
	end
}

return {
	'VonHeikemen/lsp-zero.nvim',
	-- lazy = true,
	branch = 'v1.x',
	dependencies = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},             -- Required
		{'williamboman/mason.nvim'},           -- Optional
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},         -- Required
		{'hrsh7th/cmp-nvim-lsp'},     -- Required
		{'hrsh7th/cmp-buffer'},       -- Optional
		{'hrsh7th/cmp-path'},         -- Optional
		{'saadparwaiz1/cmp_luasnip'}, -- Optional
		{'hrsh7th/cmp-nvim-lua'},     -- Optional

		-- Snippets
		{'L3MON4D3/LuaSnip'},             -- Required
		{'rafamadriz/friendly-snippets'}, -- Optional

		-- Rust utils & fmt
		{'simrat39/rust-tools.nvim'},
		{'rust-lang/rust.vim'}
	},
	event = { 'BufReadPre', 'BufNewFile' },
	keys = {
		{ '<leader>l' },
	},
	config = function()
		local lsp = require("lsp-zero")

		lsp.preset("recommended")

		lsp.ensure_installed({
			'ts_ls',
			'rust_analyzer'
		})

		lsp.on_attach(function(client, bufnr)
			local options = { buffer = bufnr, remap = false }
			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, options)
			vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, options)
			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, options)
			vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, options)
			vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, options)
			vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.signature_help() end, options)
			vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, options)
			vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, options)
		end)

		lsp.setup()

		-- rust autofmt
		vim.g.rustfmt_autosave = 1
	end
}

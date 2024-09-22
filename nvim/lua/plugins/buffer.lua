return {
	'noib3/nvim-cokeline',
	dependencies = {
		{ 'kyazdani42/nvim-web-devicons', lazy = true },
	},
	config = function()
		-- local is_picking_focus = require('cokeline/mappings').is_picking_focus
		-- local is_picking_close = require('cokeline/mappings').is_picking_close
		-- -- local get_hex = require('cokeline/utils').get_hex
		-- local get_hex = require('cokeline.hlgroups').get_hl_attr
		--
		-- local red = vim.g.terminal_color_1
		-- local yellow = vim.g.terminal_color_3
		--
		-- require('cokeline').setup({
		-- 	-- show_if_buffers_are_at_least = 0,
		-- 	default_hl = {
		-- 		fg = function(buffer)
		-- 			return
		-- 			buffer.is_focused
		-- 			and get_hex('Normal', 'fg')
		-- 			or get_hex('Comment', 'fg')
		-- 		end,
		-- 		-- bg = 'NONE',
		-- 		bg = function() return get_hex('ColorColumn', 'bg') end,
		-- 	},
		-- 	-- sidebar = {
		-- 	-- 	filetype = 'NvimTree',
		-- 	-- 	components = {
		-- 	-- 		{
		-- 	-- 			text = '  Explorer',
		-- 	-- 			fg = vim.g.terminal_color_3,
		-- 	-- 			bg = get_hex('NvimTreeNormal', 'bg'),
		-- 	-- 			style = 'bold',
		-- 	-- 		},
		-- 	-- 	}
		-- 	-- },
		-- 	components = {
		-- 		{
		-- 			text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
		-- 		},
		-- 		{
		-- 			text = '  ',
		-- 		},
		-- 		{
		-- 			text = function(buffer)
		-- 				return
		-- 				(is_picking_focus() or is_picking_close())
		-- 				and buffer.pick_letter .. ' '
		-- 				or buffer.devicon.icon
		-- 			end,
		-- 			fg = function(buffer)
		-- 				return
		-- 				(is_picking_focus() and yellow)
		-- 				or (is_picking_close() and red)
		-- 				or buffer.devicon.color
		-- 			end,
		-- 			italic = function()
		-- 				return
		-- 				(is_picking_focus() or is_picking_close())
		-- 			end,
		-- 			bold = function()
		-- 				return
		-- 				(is_picking_focus() or is_picking_close())
		-- 			end
		-- 			-- style = function(_)
		-- 			-- 	return
		-- 			-- 	(is_picking_focus() or is_picking_close())
		-- 			-- 	and 'italic,bold'
		-- 			-- 	or nil
		-- 			-- end,
		-- 		},
		-- 		{
		-- 			text = ' ',
		-- 		},
		-- 		{
		-- 			-- text = function(buffer) return buffer.filename .. '  ' end,
		-- 			-- style = function(buffer) return buffer.is_focused and 'bold' or nil end,
		-- 			text = function(buffer) return buffer.filename .. '  ' end,
		-- 			bold = function(buffer) return buffer.is_focused end,
		-- 		},
		-- 		{
		-- 			text = 'x',
		-- 			-- delete_buffer_on_left_click = true,
		-- 			on_click = function(buffer)
		-- 				buffer:delete()
		-- 			end,
		-- 		},
		-- 		{
		-- 			text = '  ',
		-- 		},
		-- 	},
		-- })
		local is_picking_focus = require('cokeline.mappings').is_picking_focus
		local is_picking_close = require('cokeline.mappings').is_picking_close
		local get_hex = require('cokeline.hlgroups').get_hl_attr

		local red = vim.g.terminal_color_1
		local yellow = vim.g.terminal_color_3

		require('cokeline').setup({
			default_hl = {
				fg = function(buffer)
					return
					buffer.is_focused
					and get_hex('Normal', 'fg')
					or get_hex('Comment', 'fg')
				end,
				bg = function() return get_hex('ColorColumn', 'bg') end,
			},
			sidebar = {
				filetype = 'NvimTree',
				components = {
					{
						text = '  Explorer',
						fg = vim.g.terminal_color_3,
						bg = get_hex('NvimTreeNormal', 'bg'),
						style = 'bold',
					},
				}
			},
			components = {
				{
					text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
				},
				{
					text = '  ',
				},
				{
					text = function(buffer)
						return
						(is_picking_focus() or is_picking_close())
						and buffer.pick_letter .. ' '
						or buffer.devicon.icon
					end,
					fg = function(buffer)
						return
						(is_picking_focus() and yellow)
						or (is_picking_close() and red)
						or buffer.devicon.color
					end,
					italic = function()
						return
						(is_picking_focus() or is_picking_close())
					end,
					bold = function()
						return
						(is_picking_focus() or is_picking_close())
					end
				},
				{
					text = ' ',
				},
				{
					text = function(buffer) return buffer.filename .. '  ' end,
					bold = function(buffer) return buffer.is_focused end,
					fg = function(buffer)
						return buffer.is_focused
						and '#ffffff'
						or get_hex('Comment', 'fg')
					end,
				},
				{
					text = 'x',
					on_click = function(buffer)
						buffer:delete()
					end,
				},
				{
					text = '  ',
				},
			},
		})
	end
}

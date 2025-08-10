-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.max_fps = 144
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 10
config.window_background_opacity = 0.95
-- config.window_background_image = '/home/tm/Pictures/Wallpapers/below_wallpaper.png'

config.use_fancy_tab_bar = false
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.hide_tab_bar_if_only_one_tab = true
-- config.tab_and_split_indices_are_zero_based = true
-- config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = 10, right = 10, top = 5, bottom = 0
}

-- https://github.com/neapsix/wezterm
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main
config.colors = theme.colors()

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- terminal multiplexer

-- keeps track of all tab' states (file_explorer pane, term_pane, etc)
--- @alias TabState { main_pane_id: string, [key]: key_pane_id | nil }
--- @type table<string, TabState>
local state_by_tab_id = {}

local function find(handles, id)
	if id == nil then return end
	for _, h in pairs(handles) do
		local pane_id = h.pane:pane_id()
		if h.pane:pane_id() == id then
			return h
		end
	end
end

--- toggle a zoomed pane associated with a specific key
--- (each tab has a unique pane for that key)
--- @param pane PaneInformation
--- @param key string
--- @param args string[]
local function toggle_pane(pane, key, args)
	local tab = pane:tab()

	-- initialize panes state tracking for this tab
	local tab_id = tab:tab_id()
	local tab_state = state_by_tab_id[tab_id]
	if tab_state == nil then
		tab_state = { main_pane_id = pane:pane_id() }
		state_by_tab_id[tab_id] = tab_state
	end

	local handles = tab:panes_with_info()

	local main_pane = find(handles, tab_state.main_pane_id)
	if main_pane == nil then
		-- todo
		return
	end

	local key_pane_id = tab_state[key]
	local key_pane = find(handles, key_pane_id)

	-- pane was never toggled or was deleted
	if key_pane_id == nil or key_pane == nil then
		wezterm.log_info("args", args)
		local new_pane_id = pane:split({
			direction = "Bottom",
			size = 0.5,
			args = args,
		}):pane_id()
		tab_state[key] = new_pane_id
		tab:set_zoomed(true)
		return
	end

	if key_pane.is_active then
		tab:set_zoomed(false)
		main_pane.pane:activate()
		tab:set_zoomed(true)
	else
		tab:set_zoomed(false)
		key_pane.pane:activate()
		tab:set_zoomed(true)
	end
end

config.keys = {
	{
		mods = "ALT",
		key = "n",
		action = wezterm.action.SpawnTab "CurrentPaneDomain",
	},
	{
		mods = "ALT",
		key = "x",
		action = wezterm.action.CloseCurrentPane { confirm = false },
	},
	{
		mods = "ALT",
		key = "N",
		action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
	},
	{
		mods = "ALT",
		action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
		key = "-",
	},
	{
		mods = "ALT",
		key = "h",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "ALT",
		key = "l",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "ALT",
		key = "H",
		action = wezterm.action.ActivatePaneDirection "Left",
	},
	{
		mods = "ALT",
		key = "J",
		action = wezterm.action.ActivatePaneDirection "Down",
	},
	{
		mods = "ALT",
		key = "K",
		action = wezterm.action.ActivatePaneDirection "Up",
	},
	{
		mods = "ALT",
		key = "L",
		action = wezterm.action.ActivatePaneDirection "Right",
	},
	{
		mods = "ALT",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize { "Left", 5 },
	},
	{
		mods = "ALT",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize { "Right", 5 },
	},
	{
		mods = "ALT",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize { "Down", 5 },
	},
	{
		mods = "ALT",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize { "Up", 5 },
	},
	{
		key = 'w',
		mods = 'ALT',
		action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },
	},
	{
		key = 'p',
		mods = 'ALT',
		action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|TABS' },
	},
	{
		key = 'r',
		mods = 'ALT',
		action = wezterm.action.PromptInputLine {
			description = 'Enter new name for tab',
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		},
	},
	-- {
	-- 	key = "t",
	-- 	mods = 'ALT',
	-- 	action = wezterm.action_callback(function(_, pane)
	-- 		local tab = pane:tab()
	-- 		local panes = tab:panes_with_info()
	-- 		if #panes == 1 then
	-- 			pane:split({
	-- 				direction = "Bottom",
	-- 				size = 0.2,
	-- 			})
	-- 			tab:set_zoomed(true)
	-- 			panes[2].pane:activate()
	-- 		elseif not panes[1].is_zoomed or not panes[1].is_active then
	-- 			tab:set_zoomed(false)
	-- 			panes[1].pane:activate()
	-- 			tab:set_zoomed(true)
 --      elseif panes[1].is_zoomed or panes[1].is_active then
	-- 			tab:set_zoomed(false)
	-- 			panes[2].pane:activate()
	-- 		end
	-- 	end),
	-- },
	-- {
	-- 	key = "f",
	-- 	mods = "ALT",
	-- 	action = wezterm.action_callback(function(_, pane)
	-- 		local tab = pane:tab()
	-- 		local handle = find(tab:panes_with_info(), pane:pane_id())
	-- 		if handle == nil or not handle.is_active then
	-- 			return
	-- 		end
	-- 		if handle.is_zoomed then
	-- 			tab:set_zoomed(false)
	-- 		else
	-- 			tab:set_zoomed(true)
	-- 		end
	-- 	end)
	-- },
	{
		key = "t",
		mods = 'ALT',
		action = wezterm.action_callback(function(_, pane)
			toggle_pane(pane, "t", {})
		end),
	},
	-- {
	-- 	key = "e",
	-- 	mods = 'ALT',
	-- 	action = wezterm.action_callback(function(_, pane)
	-- 		toggle_pane(pane, "e", { "yazi" })
	-- 	end)
	-- },
	-- {
	-- 	key = "g",
	-- 	mods = 'ALT',
	-- 	action = wezterm.action_callback(function(_, pane)
	-- 		toggle_pane2(pane, "g", { "gitui" })
	-- 	end),
	-- },
	{ key = 'q', mods = 'ALT', action = wezterm.action.QuitApplication },
}


-- WORKSPACES
wezterm.on('gui-startup', function(cmd)
	-- spawn_ellistat_workspace()
	-- spawn_personal_workspace()
	-- spawn_default_workspace()
end)

function spawn_default_workspace()
	local home_path = wezterm.home_dir
	local tab, _, window = wezterm.mux.spawn_window {
		workspace = 'default',
		cwd = home_path
	}
end

function spawn_personal_workspace()
	local home_path = wezterm.home_dir
	local tab, _, window = wezterm.mux.spawn_window {
		workspace = 'personal',
		cwd = home_path .. '/dev/afmg'
	}
	tab:set_title 'afmg'
	local tab, _, _ = window:spawn_tab {
		cwd = home_path .. '/dev/bp'
	}
	tab:set_title 'bp'
	local tab, _, _ = window:spawn_tab {
		cwd = home_path .. '/dev/elli'
	}
	tab:set_title 'elli'
	local tab, _, _ = window:spawn_tab {
		cwd = home_path .. '/dev/brep'
	}
	tab:set_title 'brep'
	local tab, _, _ = window:spawn_tab {
		cwd = home_path .. '/dev/apc'
	}
	tab:set_title 'apc'
	local tab, _, _ = window:spawn_tab {
		cwd = home_path .. '/dev/pw'
	}
	tab:set_title 'pw'
end

function spawn_ellistat_workspace()
	local home_path = wezterm.home_dir
	local tab, _, window = wezterm.mux.spawn_window {
		workspace = 'ellistat',
		cwd = home_path .. '/dev/ElliCAD'
	}
	tab:set_title 'ElliCAD'
	local tab, _, _ = window:spawn_tab {
		cwd = home_path .. '/dev/ElliCAM'
	}
	tab:set_title 'ElliCAM'
	local tab, _, _ = window:spawn_tab {
		cwd = home_path .. '/dev/ElliMatrix'
	}
	tab:set_title 'ElliMatrix'
	local tab, _, _ = window:spawn_tab {
		cwd = home_path .. '/dev/ElliScene'
	}
	tab:set_title 'ElliScene'
	local tab, _, _ = window:spawn_tab {
		cwd = home_path .. '/dev/EllistatApplication/server'
	}
	tab:set_title 'ElliServer'
	local tab, _, _ = window:spawn_tab {
		cwd = home_path .. '/dev/EllistatApplication/frontend'
	}
	tab:set_title 'ElliClient'
end

-- and finally, return the configuration to wezterm
return config

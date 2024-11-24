-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- config.max_fps = 144
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 10
config.window_background_opacity = 0.99
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
		key = "-",
		action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
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
		key = 't',
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
	{ key = 'q', mods = 'ALT', action = wezterm.action.QuitApplication },
}

-- WORKSPACES
wezterm.on('gui-startup', function(cmd)
	spawn_ellistat_workspace()
	spawn_personal_workspace()
	spawn_default_workspace()
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
		cwd = home_path .. '/dev/cad'
	}
	tab:set_title 'cad'
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

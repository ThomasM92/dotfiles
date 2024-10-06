-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local color_scheme = 'Rosé Pine (Gogh)'
local scheme = wezterm.color.get_builtin_schemes()[color_scheme]
-- config.color_scheme = 'Rosé Pine (Gogh)'

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 10
-- config.window_background_image = '/home/tm/Pictures/Wallpapers/below_wallpaper.png'
-- config.window_background_opacity = 0.8

config.use_fancy_tab_bar = false
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
-- config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = 10, right = 10, top = 15, bottom = 0
}


config.tab_and_split_indices_are_zero_based = true
config.color_scheme = color_scheme
config.colors = {
  tab_bar = {
	background = scheme.background,
    active_tab = {
      bg_color = scheme.background,
      fg_color = scheme.foreground,
	  intensity = 'Bold',
    },
	inactive_tab = {
      bg_color = scheme.background,
      fg_color = scheme.foreground,
	},
	inactive_tab_hover = {
      bg_color = scheme.background,
      fg_color = scheme.foreground,
	  italic = true,
	},
	new_tab = {
      bg_color = scheme.background,
      fg_color = scheme.foreground,
	},
	new_tab_hover = {
      bg_color = scheme.background,
      fg_color = scheme.foreground,
	},
  }
}

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
		key = "N",
		action = wezterm.action.SpawnTab "CurrentPaneDomain",
	},
	{
		mods = "ALT",
		key = "x",
		action = wezterm.action.CloseCurrentPane { confirm = false },
	},
	{
		mods = "ALT",
		key = "n",
		action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
	},
	{
		mods = "ALT",
		key = "-",
		action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
	},
	{
		mods = "ALT",
		key = "H",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "ALT",
		key = "L",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "ALT",
		key = "h",
		action = wezterm.action.ActivatePaneDirection "Left",
	},
	{
		mods = "ALT",
		key = "j",
		action = wezterm.action.ActivatePaneDirection "Down",
	},
	{
		mods = "ALT",
		key = "k",
		action = wezterm.action.ActivatePaneDirection "Up",
	},
	{
		mods = "ALT",
		key = "l",
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
}


-- and finally, return the configuration to wezterm
return config

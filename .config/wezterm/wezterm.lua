local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local opacity = 0.75
local transparent_bg = "rgba(22, 24, 26, " .. opacity .. ")"

config.enable_scroll_bar = true
config.window_background_opacity = opacity
config.win32_system_backdrop = "Acrylic"
config.font = wezterm.font("JetbrainsMono Nerd Font")
config.colors = require("cyberdream")

config.ssh_domains = {
	{
		-- This name identifies the domain
		name = "dg",
		-- The hostname or address to connect to. Will be used to match settings
		-- from your ssh config file
		remote_address = "dg1.mkhoatd.lol",
		-- The username to use on the remote host
		username = "root",
	},
}
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.colors.tab_bar = {
	background = transparent_bg,
	active_tab = {
		bg_color = transparent_bg,
		fg_color = "#ffffff",
	},
	inactive_tab = {
		bg_color = transparent_bg,
		fg_color = "#7b8496",
	},
	inactive_tab_hover = {
		bg_color = transparent_bg,
		fg_color = "#ffffff",
	},
	new_tab = {
		bg_color = transparent_bg,
		fg_color = "#ffffff",
	},
}

config.macos_window_background_blur = 15

return config

local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_scroll_bar = true
config.window_background_opacity = 0.8
config.font = wezterm.font("JetbrainsMono Nerd Font")

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

config.macos_window_background_blur = 15

return config

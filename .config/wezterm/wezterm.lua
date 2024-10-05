local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
-- local opacity = 0.8
local opacity = 0.9
local transparent_bg = "rgba(22, 24, 26, " .. opacity .. ")"

config.enable_scroll_bar = true
config.macos_window_background_blur = 60
-- config.front_end = "WebGpu"
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
config.use_fancy_tab_bar = true
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

local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

local ledmode = "CTRL"

if is_darwin() then
	ledmode = "OPT"
end

config.unix_domains = {
	{
		name = "unix",
	},
}

-- This causes `wezterm` to act as though it was started as
-- `wezterm connect unix` by default, connecting to the unix
-- domain on startup.
-- If you prefer to connect manually, leave out this line.
-- config.default_gui_startup_args = { "connect", "unix" }

config.leader = { key = "a", mods = ledmode }
-- config.leader = { key = "F1", mods = "" }
config.keys = {
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	-- { key = "a", mods = "LEADER|" .. ledmode, action = wezterm.action({ SendString = "\x01" }) },
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "\\",
		mods = "LEADER",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ key = "H", mods = ledmode .. "|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
	{ key = "J", mods = ledmode .. "|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
	{ key = "K", mods = ledmode .. "|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
	{ key = "L", mods = ledmode .. "|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
	{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

	{ key = "n", mods = "SHIFT|" .. ledmode, action = "ToggleFullScreen" },
	{ key = "+", mods = "SHIFT|" .. ledmode, action = "IncreaseFontSize" },
	{ key = "-", mods = "SHIFT|" .. ledmode, action = "DecreaseFontSize" },
	{ key = "0", mods = "SHIFT|" .. ledmode, action = "ResetFontSize" },
}

config.ssh_domains = wezterm.default_ssh_domains()
for _, dom in ipairs(config.ssh_domains) do
	print(dom)
end

-- local SSH_AUTH_SOCK = "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
-- config.default_ssh_auth_sock = SSH_AUTH_SOCK

return config

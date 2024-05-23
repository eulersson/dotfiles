-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme_dirs = { "$HOME/.config/themes/tokyo-night/extras/wezterm" }

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "tokyonight_storm"
	else
		return "tokyonight_day"
	end
end

-- For example, changing the color scheme:
config.color_scheme = scheme_for_appearance(get_appearance())

config.audible_bell = "SystemBeep"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 16

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = { top = 52 }

config.initial_rows = 47
config.initial_cols = 180

config.window_background_opacity = 1
config.macos_window_background_blur = 0

wezterm.on("cycle-opaque-translucid-clear", function(window)
	local overrides = window:get_config_overrides() or {}

	if overrides.window_background_opacity == 1.0 then
		overrides.window_background_opacity = 0.85
	elseif overrides.window_background_opacity == 0.85 then
		overrides.window_background_opacity = 0.35
	elseif overrides.window_background_opacity == 0.35 then
		overrides.window_background_opacity = 0.15
	elseif overrides.window_background_opacity == 0.15 then
		overrides.window_background_opacity = 0.0
	elseif overrides.window_background_opacity == 0.0 then
		overrides.window_background_opacity = 1.0
	else
		overrides.window_background_opacity = 1.0
	end

	window:set_config_overrides(overrides)
end)

wezterm.on("cycle-blur-sm-md-lg", function(window)
	local overrides = window:get_config_overrides() or {}
	if overrides.window_background_opacity > 0.0 then
		if overrides.macos_window_background_blur == 0 then
			overrides.macos_window_background_blur = 10
		elseif overrides.macos_window_background_blur == 10 then
			overrides.macos_window_background_blur = 30
		elseif overrides.macos_window_background_blur == 30 then
			overrides.macos_window_background_blur = 0
		else
			overrides.macos_window_background_blur = 0
		end
	end

	window:set_config_overrides(overrides)
end)

wezterm.on("increase-opacity", function(window)
	local overrides = window:get_config_overrides() or {}
	overrides.window_background_opacity = overrides.window_background_opacity + 0.1
	overrides.window_background_opacity = math.min(overrides.window_background_opacity, 1.0)
	window:set_config_overrides(overrides)
end)

wezterm.on("decrease-opacity", function(window)
	local overrides = window:get_config_overrides() or {}
	overrides.window_background_opacity = overrides.window_background_opacity - 0.1
	overrides.window_background_opacity = math.max(overrides.window_background_opacity, 0.0)
	window:set_config_overrides(overrides)
end)

wezterm.on("increase-blur", function(window)
	local overrides = window:get_config_overrides() or {}
	overrides.macos_window_background_blur = overrides.macos_window_background_blur + 5
	overrides.macos_window_background_blur = math.min(overrides.macos_window_background_blur, 30)
	window:set_config_overrides(overrides)
end)

wezterm.on("decrease-blur", function(window)
	local overrides = window:get_config_overrides() or {}
	overrides.macos_window_background_blur = overrides.macos_window_background_blur - 5
	overrides.macos_window_background_blur = math.max(overrides.macos_window_background_blur, 0)
	window:set_config_overrides(overrides)
end)

wezterm.on("reset-opacity-blur", function(window)
	local overrides = window:get_config_overrides() or {}
	overrides.window_background_opacity = 1.0
	overrides.macos_window_background_blur = 0
	window:set_config_overrides(overrides)
end)

config.keys = {
	{
		key = "u",
		mods = "CMD",
		action = wezterm.action.EmitEvent("increase-opacity"),
	},
	{
		key = "y",
		mods = "CMD",
		action = wezterm.action.EmitEvent("decrease-opacity"),
	},
	{
		key = "o",
		mods = "CMD",
		action = wezterm.action.EmitEvent("increase-blur"),
	},
	{
		key = "i",
		mods = "CMD",
		action = wezterm.action.EmitEvent("decrease-blur"),
	},
	{
		key = "r",
		mods = "CMD",
		action = wezterm.action.EmitEvent("reset-opacity-blur"),
	},
	{
		key = "g",
		mods = "CMD",
		action = wezterm.action.EmitEvent("gray-background"),
	},
}

-- wezterm.on("gui-startup", function(cmd)
-- 	local tab, pane, window = mux.spawn_window(cmd or {})
-- 	window:gui_window():set_position(65, 100)
-- end)

wezterm.on("gray-background", function(window, pane)
	local gray_backgroud_theme = wezterm.color.get_builtin_schemes()[scheme_for_appearance("Dark")]
	gray_backgroud_theme.background = "#1e1e1e"

	local overrides = window:get_config_overrides() or {}
	overrides.color_schemes = {
		["gray_backgroud_theme"] = gray_backgroud_theme,
	}

	overrides.color_scheme = "gray_backgroud_theme"
	window:set_config_overrides(overrides)
end)

wezterm.on("window-config-reloaded", function(window, pane)
	-- approximately identify this gui window, by using the associated mux id
	local id = tostring(window:window_id())

	-- maintain a mapping of windows that we have previously seen before in this event handler
	local seen = wezterm.GLOBAL.seen_windows or {}
	-- set a flag if we haven't seen this window before
	local is_new_window = not seen[id]
	-- and update the mapping
	seen[id] = true
	wezterm.GLOBAL.seen_windows = seen

	-- now act upon the flag
	if is_new_window then
		window:set_position(65, 100)
	end
end)

-- and finally, return the configuration to wezterm
return config

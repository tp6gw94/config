local wezterm = require("wezterm")
local config = wezterm.config_builder()

local light_scheme = "One Light (base16)"
local dark_scheme = "One Dark (base16)"
wezterm.on("toggle-color-scheme", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.color_scheme == light_scheme then
		overrides.color_scheme = dark_scheme
	else
		overrides.color_scheme = light_scheme
	end
	window:set_config_overrides(overrides)
end)

config.color_scheme = "One Light (base16)"
config.font = wezterm.font("JetBrains Mono")

config.window_decorations = "TITLE | RESIZE"
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1500 }

local act = wezterm.action

config.keys = {
	-- pane split
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "_",
		mods = "LEADER|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "z",
		mods = "LEADER",
		action = act.TogglePaneZoomState,
	},
	-- pane move
	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "p",
		mods = "LEADER",
		action = act.PaneSelect({ mode = "SwapWithActive" }),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.PaneSelect,
	},
	-- pane resize
	{
		key = "H",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	-- close pane
	{
		key = "x",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	-- reload configuration
	{
		key = "R",
		mods = "LEADER",
		action = act.ReloadConfiguration,
	},
	-- tab
	{
		key = "r",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Rename tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "t",
		mods = "LEADER",
		action = act.SpawnCommandInNewTab({
			cwd = wezterm.home_dir,
		}),
	},
	{
		key = "]",
		mods = "LEADER",
		action = act.MoveTabRelative(1),
	},
	{
		key = "[",
		mods = "LEADER",
		action = act.MoveTabRelative(-1),
	},
	-- close tab
	{
		key = "q",
		mods = "LEADER",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	-- move cursor by word
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bb" }),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bf" }),
	},
	-- togle light or dark theme
	{
		key = "m",
		mods = "CMD",
		action = wezterm.action({ EmitEvent = "toggle-color-scheme" }),
	},
	-- workspace
	{
		key = "W",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter name for new workspace",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
	{
		key = ",",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Rename current workspace",
			action = wezterm.action_callback(function(window, panel, line)
				local old = window:active_workspace()
				wezterm.mux.rename_workspace(old, line)
				window:toast_notification("rename workspace from " .. old, " to " .. line, nil, 4000)
				wezterm.emit("format-window-title", window, panel)
			end),
		}),
	},
	{
		key = "s",
		mods = "LEADER",
		action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
	-- debug
	{
		key = "D",
		mods = "LEADER",
		action = wezterm.action.ShowDebugOverlay,
	},
}

for i = 1, 9 do
	-- CTRL+ALT + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

wezterm.on("format-window-title", function()
	return wezterm.mux.get_active_workspace()
end)

return config

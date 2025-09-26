local wezterm = require "wezterm"
local config = wezterm.config_builder()

-- Set ZSH as default program
config.default_prog = { "/usr/bin/zsh" }

-- Appearance
config.font_size = 14
config.color_scheme = "Tokyo Night Storm"
config.colors = {
    cursor_bg = "#7dcfff",
    cursor_border = "#7dcfff",
}
config.window_background_opacity = 0.8
-- config.window_decorations = "RESIZE"

-- Default Window size
config.initial_rows = 32
config.initial_cols = 120

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- Dim inactive panes
config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.4,
}

-- Key mappings
--
config.leader = {
    key = 'a',
    mods = 'CTRL',
    --timeout_milliseconds = 1000,
    }
config.keys = {
    -- Resize panes with CTRL-a the SHIFT-H, J, K or L
    {
        key = 'h',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Left', 5 },
    },
    {
        key = 'l',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Right', 5 },
    },
    {
        key = 'j',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Down', 3 },
    },
    {
        key = 'k',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.AdjustPaneSize { 'Up', 3 },
    },
}
return config

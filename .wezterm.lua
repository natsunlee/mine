local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font_size = 14.0

-- Theme
config.color_scheme = 'catppuccin-frappe'
config.font = wezterm.font 'Fira Code'

-- Remove pointless empty padding
config.window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
}

config.tab_bar_at_bottom = true

return config

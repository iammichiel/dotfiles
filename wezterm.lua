-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = 'nord'
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16

config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 0,
}
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.macos_window_background_blur = 8

config.keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}
-- and finally, return the configuration to wezterm
return config

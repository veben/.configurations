local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_domain = 'WSL:Ubuntu-22.04'
config.font = wezterm.font 'UbuntuMono Nerd Font'
config.color_scheme = "Catppuccin Mocha"
config.window_decorations = "NONE"

config.keys = {
  {
      key = 'w',
      mods = 'CTRL',
      action = wezterm.action.CloseCurrentPane { confirm = false },
  },
}

return config
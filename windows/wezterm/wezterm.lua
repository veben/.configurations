local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- change config now
config.default_domain = 'WSL:Ubuntu-22.04'
config.font = wezterm.font 'UbuntuMono Nerd Font'
config.color_scheme = "Catppuccin Mocha"

return config
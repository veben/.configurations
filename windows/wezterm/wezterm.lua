local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

------------- Theme -------------
config.font = wezterm.font('UbuntuMono Nerd Font', { weight = 'DemiLight' })
config.color_scheme = "Catppuccin Mocha"

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#181b1a"
custom.tab_bar.background = "#181b1a"
custom.tab_bar.inactive_tab.bg_color = "#181b1a"
custom.tab_bar.new_tab.bg_color = "#181b1a"
config.color_schemes = {
  ["OLEDppuccin"] = custom,
}
config.color_scheme = "OLEDppuccin"

------------- Shortcuts -------------
config.keys = {
  { key = 'w', mods = 'CTRL', action = wezterm.action.CloseCurrentPane { confirm = false } },
  { key = 't', mods = 'CTRL', action = wezterm.action.SpawnTab 'CurrentPaneDomain' }
}

------------- Others -------------
config.default_domain = 'WSL:Ubuntu-22.04'
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

return config
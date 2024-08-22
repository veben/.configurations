local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

use_dead_keys = false
scrollback_lines = 5000

------------- Theme -------------
config.font = wezterm.font('UbuntuMono Nerd Font', { weight = 'DemiLight' })
config.color_scheme = "Catppuccin Mocha"

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#0e1117"
custom.tab_bar.background = "#0e1117"
custom.tab_bar.inactive_tab.bg_color = "#0e1117"
custom.tab_bar.new_tab.bg_color = "#0e1117"
config.color_schemes = {
  ["OLEDppuccin"] = custom,
}
config.color_scheme = "OLEDppuccin"


------------- Shortcuts -------------
disable_default_key_bindings = true
act = wezterm.action
config.keys = {
  {
    key = 'c',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      local has_selection = window:get_selection_text_for_pane(pane) ~= ''
      if has_selection then
        window:perform_action(act.CopyTo 'ClipboardAndPrimarySelection', pane)
        window:perform_action(act.ClearSelection, pane)
      else
        window:perform_action(act.SendKey { key = 'c', mods = 'CTRL' }, pane)
      end
    end),
  },
  { key = 'v', mods = 'CTRL', action = act.PasteFrom("Clipboard") },

  { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CTRL', action = act.CloseCurrentPane { confirm = false } },

  { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },

  { key = 'DownArrow', mods = 'CTRL|ALT', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'RightArrow', mods = 'CTRL|ALT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = "UpArrow", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
  { key = "DownArrow", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
  { key = "LeftArrow", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
}

------------- Others -------------
config.default_domain = 'WSL:Ubuntu-22.04'
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.integrated_title_buttons = {}
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.default_cursor_style = 'BlinkingUnderline'

-- Full screen on startup
wezterm.on("gui-startup", function()
  local tab, pane, window = wezterm.mux.spawn_window{}
  window:gui_window():maximize()
end)

return config
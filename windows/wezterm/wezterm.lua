local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

use_dead_keys = false
scrollback_lines = 5000

------------- Font -------------
config.font = wezterm.font('UbuntuMono Nerd Font', { weight = 'DemiLight' })

------------- Theme -------------
-- Custom Nord
local custom_nord = {
  foreground = "#D8DEE9",
  background = "#2E3440",
  cursor_bg = "#D8DEE9",
  cursor_fg = "#2E3440",
  cursor_border = "#D8DEE9",
  selection_fg = "#D8DEE9",
  selection_bg = "#4C566A",
  scrollbar_thumb = "#4C566A",
  split = "#4C566A",
  ansi = {"#3B4252", "#BF616A", "#A3BE8C", "#EBCB8B", "#81A1C1", "#B48EAD", "#88C0D0", "#E5E9F0"},
  brights = {"#4C566A", "#BF616A", "#A3BE8C", "#EBCB8B", "#81A1C1", "#B48EAD", "#8FBCBB", "#ECEFF4"},

  tab_bar = {
    background = "#2E3440",
    inactive_tab = {
      bg_color = "#2E3440",
      fg_color = "#D8DEE9",
    },
    active_tab = {
      bg_color = "#2E3440",
      fg_color = "#88c0d0",
    },
    new_tab = {
      bg_color = "#2E3440",
      fg_color = "#D8DEE9",
    },
  }
}

-- Custom Catpuccin Mocha
local custom_catpuccin_mocha = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom_catpuccin_mocha.background = "#0e1117"
custom_catpuccin_mocha.tab_bar.background = "#0e1117"
custom_catpuccin_mocha.tab_bar.inactive_tab.bg_color = "#0e1117"
custom_catpuccin_mocha.tab_bar.new_tab.bg_color = "#0e1117"

-- Theme selection
config.color_schemes = {
  ["CustomNord"] = custom_nord,
  ["CustomCatppuccinMocha"] = custom_catpuccin_mocha,
}
config.color_scheme = "CustomCatppuccinMocha"

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
config.window_background_opacity = 1.0
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
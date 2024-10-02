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
-- Nord Palette: https://www.nordtheme.com/docs/colors-and-palettes
local nord_palette = {
  nord0 = "#1c1f26", -- <- Darker background (original: #2e3440, another option: #202329)
  nord1 = "#3b4252",
  nord2 = "#434c5e",
  nord3 = "#4c566a",
  -- Snow Storm
  nord4 = "#d8dee9",
  nord5 = "#e5e9f0",
  nord6 = "#eceff4",
  -- Frost
  nord7 = "#8fbcbb",
  nord8 = "#88c0d0",
  nord9 = "#81a1c1",
  nord10 = "#5e81ac",
  -- Aurora
  nord11 = "#bf616a",
  nord12 = "#d08770",
  nord13 = "#ebcb8b",
  nord14 = "#a3be8c",
  nord15 = "#b48ead"
}

local custom_nord = {
  foreground = nord_palette.nord4,
  background = nord_palette.nord0,
  cursor_bg = nord_palette.nord4,
  cursor_fg = nord_palette.nord0,
  cursor_border = nord_palette.nord4,
  selection_fg = nord_palette.nord4,
  selection_bg = nord_palette.nord3,
  scrollbar_thumb = nord_palette.nord3,
  split = nord_palette.nord3,
  ansi = {nord_palette.nord1, nord_palette.nord11, nord_palette.nord14, nord_palette.nord13, nord_palette.nord9, nord_palette.nord15, nord_palette.nord8, nord_palette.nord5},
  brights = {nord_palette.nord3, nord_palette.nord11, nord_palette.nord14, nord_palette.nord13, nord_palette.nord9, nord_palette.nord15, nord_palette.nord7, nord_palette.nord6},

  tab_bar = {
    background = nord_palette.nord0,
    inactive_tab = {
      bg_color = nord_palette.nord0,
      fg_color = nord_palette.nord4,
    },
    active_tab = {
      bg_color = nord_palette.nord8,
      fg_color = nord_palette.nord0,
    },
    new_tab = {
      bg_color = nord_palette.nord0,
      fg_color = nord_palette.nord4,
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
config.color_scheme = "CustomNord"

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
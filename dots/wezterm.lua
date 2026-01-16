local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Font
config.font = wezterm.font_with_fallback({
  { family = "JetBrainsMono Nerd Font", weight = "DemiBold" },
})
config.font_size = 16.0
config.cell_width = 0.9 -- x

config.freetype_load_flags = "NO_HINTING"
config.freetype_load_target = "Normal"

-- Window
config.initial_cols = 160
config.initial_rows = 36
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 0,
}
config.window_decorations = "RESIZE"

-- Scrollback
config.scrollback_lines = 10000

-- Tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.window_frame = {
  font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
  font_size = 14.0,
  active_titlebar_bg = "#222436",
  inactive_titlebar_bg = "#222436",
}

-- Colours
config.color_scheme = "Tokyo Night Moon"
config.colors = {
  tab_bar = {
    background = "#1e2030",
    active_tab = {
      bg_color = "#82aaff",
      fg_color = "#1e2030",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#2f334d",
      fg_color = "#545c7e",
    },

    inactive_tab_hover = {
      bg_color = "#3b3f5c",
      fg_color = "#c8d3f5",
    },

    new_tab = {
      bg_color = "#1e2030",
      fg_color = "#545c7e",
    },

    new_tab_hover = {
      bg_color = "#2f334d",
      fg_color = "#c8d3f5",
    },
  },
}

-- macOS Option as Alt
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- Key bindings
config.keys = {
  -- Alt+hjkl navigation (pass through for vim/shell)
  { key = "j", mods = "ALT", action = wezterm.action.SendKey({ key = "j", mods = "ALT" }) },
  { key = "k", mods = "ALT", action = wezterm.action.SendKey({ key = "k", mods = "ALT" }) },
  { key = "h", mods = "ALT", action = wezterm.action.SendKey({ key = "h", mods = "ALT" }) },
  { key = "l", mods = "ALT", action = wezterm.action.SendKey({ key = "l", mods = "ALT" }) },
}

-- Performance
config.front_end = "WebGpu"
config.max_fps = 120

-- Misc
config.audible_bell = "Disabled"
config.adjust_window_size_when_changing_font_size = false
config.window_close_confirmation = "NeverPrompt"

return config

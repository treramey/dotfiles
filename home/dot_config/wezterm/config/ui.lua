local wezterm = require("wezterm")

local M = {
  audible_bell = "Disabled",

  -- default_prog = { "/usr/local/bin/nu", "-l" },

  font_size = 15,
  font = wezterm.font("JetBrainsMono Nerd Font"),

  underline_position = -4,

  max_fps = 98,
  animation_fps = 1,
  webgpu_power_preference = "HighPerformance",
  front_end = "WebGpu",

  -- cursor
  default_cursor_style = "SteadyBar",

  -- window
  window_background_opacity = 0.82,
  macos_window_background_blur = 20,
  window_decorations = "RESIZE",
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },

  -- tab
  tab_max_width = 20,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  show_new_tab_button_in_tab_bar = false,

  check_for_updates = false,
}

return M

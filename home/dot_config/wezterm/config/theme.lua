local colors = require("colors.palette").colors

local M = {}

M.colors = {
  foreground = colors.text,
  background = colors.base,
  cursor_fg = colors.crust,
  cursor_bg = colors.rosewater,
  cursor_border = colors.rosewater,
  selection_bg = colors.surface2,
  selection_fg = colors.text,
  ansi = {
    colors.base, -- black
    colors.red, -- red
    colors.green, -- green
    colors.yellow, -- yellow
    colors.blue, -- blue
    colors.mauve, -- purple/ magenta
    colors.sky, -- cyan
    colors.subtext1, -- white
  },
  brights = {
    colors.base, -- black
    colors.red, -- red
    colors.green, -- green
    colors.yellow, -- yellow
    colors.blue, -- blue
    colors.mauve, -- purple/ magenta
    colors.sky, -- cyan
    colors.subtext0, -- white
  },
  tab_bar = {
    background = "none",
    active_tab = {
      bg_color = colors.surface2,
      fg_color = colors.text,
    },
    inactive_tab = {
      bg_color = colors.surface0,
      fg_color = colors.subtext1,
    },
    inactive_tab_hover = {
      bg_color = colors.surface0,
      fg_color = colors.text,
    },
    new_tab = {
      bg_color = colors.base,
      fg_color = colors.text,
    },
    new_tab_hover = {
      bg_color = colors.mantle,
      fg_color = colors.text,
      italic = true,
    },
  },
  visual_bell = colors.surface0,
  indexed = {
    [16] = colors.peach,
    [17] = colors.rosewater,
  },
  scrollbar_thumb = colors.surface2,
  split = colors.lavender,
  compose_cursor = colors.flamingo, -- nightbuild only
}

return M

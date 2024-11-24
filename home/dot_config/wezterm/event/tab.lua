local wezterm = require("wezterm")
local colors = require("colors.palette").colors

local M = {}

local function get_title(tab)
  local title = tab.tab_title
  if title and #title > 0 then
    return title
  else
    local cwd_uri = tab.active_pane.current_working_dir
    if cwd_uri then
      local cwd = cwd_uri.file_path
      if cwd == os.getenv("HOME") then
        return "~"
      end
      return string.format("%s", string.match(cwd, "[^/]+$"))
    end
  end
  return tab.active_pane.title
end

function M.setup()
  wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
    local title = get_title(tab)
    title = wezterm.truncate_right(title, max_width - 2)

    local fg = colors.overlay1
    local bg = colors.surface0

    if tab.is_active then
      bg = colors.lavender
      fg = colors.base
    elseif hover then
      bg = colors.surface1
      fg = colors.overlay1
    end

    return {
      { Background = { Color = bg } },
      { Foreground = { Color = fg } },
      { Text = " " .. title .. " " },
    }
  end)
end

return M

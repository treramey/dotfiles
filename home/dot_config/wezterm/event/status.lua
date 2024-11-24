local wezterm = require("wezterm")
local colors = require("colors.palette").colors

local nf = wezterm.nerdfonts
local M = {}

local __cells__ = {}

local function pane_status(window, pane)
  local resize = colors.flamingo
  if window:active_key_table() == "resize_pane" then
    resize = colors.maroon
  end

  local current = 1
  local panes = pane:tab():panes()
  for index, value in pairs(panes) do
    if value:pane_id() == pane:pane_id() then
      current = index
      break
    end
  end

  table.insert(__cells__, { Foreground = { Color = resize } })
  table.insert(__cells__, { Text = nf.ple_left_half_circle_thick })
  table.insert(__cells__, { Background = { Color = resize } })
  table.insert(__cells__, { Foreground = { Color = colors.crust } })
  table.insert(__cells__, { Text = nf.cod_terminal_tmux .. " " })
  table.insert(__cells__, { Background = { Color = resize } })
  table.insert(__cells__, { Foreground = { Color = colors.crust } })
  table.insert(__cells__, { Text = current .. "-" .. #panes .. " " })
end

local function date_with_leader_status(window)
  local date = wezterm.strftime("%a %-d %b %H:%M")

  local leader = colors.rosewater
  if window:leader_is_active() then
    leader = colors.maroon
  end

  table.insert(__cells__, { Foreground = { Color = leader } })
  table.insert(__cells__, { Text = nf.ple_left_half_circle_thick })
  table.insert(__cells__, { Foreground = { Color = colors.crust } })
  table.insert(__cells__, { Background = { Color = leader } })
  table.insert(__cells__, { Text = date })
  table.insert(__cells__, { Background = { Color = "none" } })
  table.insert(__cells__, { Foreground = { Color = leader } })
  table.insert(__cells__, { Text = nf.ple_right_half_circle_thick })
end

M.setup = function()
  wezterm.on("update-right-status", function(window, pane)
    __cells__ = {}
    pane_status(window, pane)
    date_with_leader_status(window)
    window:set_right_status(wezterm.format(__cells__))
  end)
end

return M

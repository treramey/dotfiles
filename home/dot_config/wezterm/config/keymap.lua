local wezterm = require("wezterm")
local act = wezterm.action

local M = {
  leader = { key = "Space", mods = "CTRL" },
  disable_default_key_bindings = true,
}

local function is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
  h = "Left",
  j = "Down",
  k = "Up",
  l = "Right",
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == "resize" and "META" or "CTRL",
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
        }, pane)
      else
        if resize_or_move == "resize" then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

M.keys = {
  { key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
  { key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },

  -- { key = "d", mods = "CTRL", action = act.ScrollByPage(0.5) },
  -- { key = "u", mods = "CTRL", action = act.ScrollByPage(-0.5) },

  -- Tab
  { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "X", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
  { key = "[", mods = "LEADER", action = act.MoveTabRelative(-1) },
  { key = "]", mods = "LEADER", action = act.MoveTabRelative(1) },

  -- Pane
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
  {
    key = "_",
    mods = "LEADER",
    action = act.SplitPane({ direction = "Down", size = { Percent = 30 } }),
  },
  { key = "|", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

  { key = " ", mods = "LEADER", action = act.TogglePaneZoomState },

  { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },

  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

  { key = "K", mods = "LEADER", action = act.RotatePanes("Clockwise") },
  { key = "J", mods = "LEADER", action = act.RotatePanes("CounterClockwise") },

  { key = "s", mods = "LEADER", action = act.QuickSelect },
  { key = "/", mods = "LEADER", action = act.Search("CurrentSelectionOrEmptyString") },
  { key = "?", mods = "LEADER", action = act.Search("CurrentSelectionOrEmptyString") },
  { key = "m", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "LAUNCH_MENU_ITEMS" }) },

  { key = "1", mods = "LEADER", action = act.ActivateTab(0) },
  { key = "2", mods = "LEADER", action = act.ActivateTab(1) },
  { key = "3", mods = "LEADER", action = act.ActivateTab(2) },
  { key = "4", mods = "LEADER", action = act.ActivateTab(3) },
  { key = "5", mods = "LEADER", action = act.ActivateTab(4) },
  { key = "6", mods = "LEADER", action = act.ActivateTab(5) },
  { key = "7", mods = "LEADER", action = act.ActivateTab(6) },
  { key = "8", mods = "LEADER", action = act.ActivateTab(7) },
  { key = "9", mods = "LEADER", action = act.ActivateTab(8) },

  -- which pane
  { key = "w", mods = "LEADER", action = act.PaneSelect },

  {
    key = "r",
    mods = "LEADER",
    action = act.ActivateKeyTable({
      name = "resize_pane",
      one_shot = false,
      until_unknown = true,
      replace_current = true,
    }),
  },

  -- move between split panes
  split_nav("move", "h"),
  split_nav("move", "j"),
  split_nav("move", "k"),
  split_nav("move", "l"),
  -- resize panes
  split_nav("resize", "h"),
  split_nav("resize", "j"),
  split_nav("resize", "k"),
  split_nav("resize", "l"),
}

M.key_tables = {
  resize_pane = {
    { key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 5 }) },
    { key = "DownArrow", action = act.AdjustPaneSize({ "Down", 5 }) },
    { key = "UpArrow", action = act.AdjustPaneSize({ "Up", 5 }) },
    { key = "RightArrow", action = act.AdjustPaneSize({ "Right", 5 }) },
    { key = "q", action = "PopKeyTable" },
    { key = "Escape", action = "PopKeyTable" },
  },
}

return M

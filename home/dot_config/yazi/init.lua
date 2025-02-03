-- Update yaziline configuration
require("yaziline"):setup({
  separator_style = "curvy",
  pick_symbol = "", -- Changed from select_symbol to pick_symbol
  yank_symbol = "󰆐",
  filename_max_length = 24,
  filename_trim_length = 6,
})

require("starship"):setup({
  config_file = "~/.config/yazi/starship.toml",
})

require("git"):setup({})

Status:children_add(function()
  local job = cx.active.current.hovered
  if job == nil or ya.target_family() ~= "unix" then
    return ui.Line({})
  end

  -- Create the text using ui.Text instead of ui.Line
  return ui.Text({
    ui.Line({
      ui.Span(ya.user_name(job.cha.perm.uid) or tostring(job.cha.perm.uid)):fg("magenta"),
      ui.Span(":"),
      ui.Span(ya.group_name(job.cha.perm.gid) or tostring(job.cha.perm.gid)):fg("magenta"),
      ui.Span(" "),
    }),
  }):area(Status.area())
end, 500, Status.RIGHT)

require("yamb"):setup({
  cli = "fzf",
})


# (C) 2024 const void*, free + open

# colorize_zsh <theme>
function colorize_zsh() {
  local theme="rose-pine"
  local theme_path=~/.config/zsh/rose-pine-zsh/themes

  # opt param chk
  if [[ "${#}" -ne 0 ]]; then
    local theme_input=$1

    if [[ -f ${theme_path}/${theme_input}.zsh ]]; then
      theme="${theme_input}"
    fi
  fi
  
  source ${theme_path}/${theme}.zsh
}

## true-color ansi token helpers
export term16m_bgn='\033['
export term16m_end='m'
export term16m_bg='48;2;'
export term16m_fg='38;2;'

export term16m_reset="${term16m_bgn}0${term16m_end}"

#echo -e "$(term16m_set_color <bg> <fg>)some text${term16m_reset}"
function term16m_set_color() {
  echo "%{${term16m_bgn}${term16m_bg}$1;${term16m_fg}$2${term16m_end}%}"
}

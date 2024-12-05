# Nushell Environment Config File
#
# version = "0.95.0"

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

def create_right_prompt [] {
    starship prompt --right
}

$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
    ($nu.data-dir | path join 'completions') # default home for nushell completions
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

$env.EDITOR = "nvim"

$env.CARGO_HOME = ($env.HOME | path join .cargo)

$env.GOPATH = ($env.HOME | path join .go)
$env.GO111MODULE = "on"

$env.PNPM_HOME = ($env.HOME | path join .pnpm)

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
$env.PATH = (
  $env.PATH
  | split row (char esep)
  | append /usr/local/bin
  | append ($env.GOPATH | path join bin)
  | append ($env.CARGO_HOME | path join bin)
  | append ($env.HOME | path join .local bin)
  | uniq
)
$env.LS_COLORS = ((cat ~/.config/nushell/ls-colors) | str trim)

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environment variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = "〉"
$env.PROMPT_INDICATOR_VI_INSERT = $": (ansi -e '6 q')"
$env.PROMPT_INDICATOR_VI_NORMAL = $"〉(ansi -e '2 q')"
$env.PROMPT_MULTILINE_INDICATOR = "::: "

# fzf
$env.FZF_DEFAULT_COMMAND = "fd --type file --hidden --follow"
$env.FZF_DEFAULT_OPTS = ([
		"--cycle"
		"--bind 'alt-enter:print-query,tab:toggle-up,ctrl-y:execute-silent(echo {} | copy)'"
		"--preview 'bat --line-range :500 {}'"
	] | str join " ")
$env.config.show_banner = false

# starship
starship init nu | save -f ~/.cache/starship/init.nu

# zoxide 
zoxide init nushell | save -f ~/.cache/zoxide.nu

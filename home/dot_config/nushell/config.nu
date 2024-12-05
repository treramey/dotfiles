# Nushell Config File
use ~/.cache/starship/init.nu

source ~/.cache/zoxide.nu

source ($nu.default-config-dir | path join 'alias.nu')

source ($nu.default-config-dir | path join 'yazi.nu')

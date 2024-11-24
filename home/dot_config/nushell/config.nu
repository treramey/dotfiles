# Nushell Config File

use ~/.cache/starship.nu

source ~/.cache/zoxide.nu

source ($nu.default-config-dir | path join 'alias.nu')

source ($nu.default-config-dir | path join 'yazi.nu')

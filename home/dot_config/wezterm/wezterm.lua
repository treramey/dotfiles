local Config = require("config")

require("event.tab").setup()
require("event.status").setup()

return Config:init()
  :append(require("config.ui"))
  :append(require("config.keymap"))
  :append(require("config.launch"))
  :append(require("config.theme")).options

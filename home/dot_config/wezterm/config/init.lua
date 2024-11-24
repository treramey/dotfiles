local wezterm = require("wezterm")

local Config = {}
Config.__index = Config

function Config:init()
  local config = setmetatable({ options = {} }, self)
  return config
end

function Config:append(opts)
  for k, v in pairs(opts) do
    if self.options[k] ~= nil then
      wezterm.log_warn(
        "Deplicate config option detected: ",
        { old = self.options[k], new = opts[k] }
      )
      goto continue
    end
    self.options[k] = v
    ::continue::
  end
  return self
end

return Config

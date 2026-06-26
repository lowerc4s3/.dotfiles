do
  local user = os.getenv("USER")
  local sbarlua = ("/Users/" .. user .. "/.local/share/sketchybar_lua/?.so")
  package.cpath = (package.cpath .. ";" .. sbarlua)
end
_G.sbar = require("sketchybar")
sbar.begin_config()
require("cfg.bar")
require("cfg.spaces")
require("cfg.focused")
require("cfg.tray")
sbar.end_config()
return sbar.event_loop()

local M = {fonts = nil, oxocarbon = nil}
do
  local mono = "Lilex Nerd Font"
  local icon = mono
  local sans = "SF UI Text"
  M.fonts = {label = {family = sans, style = "Regular", size = 14.5}, icon = {family = icon, style = "Regular", size = 16}, clock = {family = mono, style = "Regular", size = 16}, kbd = {family = mono, style = "Regular", size = 14.5}, ["app-icon"] = {family = "sketchybar-app-font", style = "Regular", size = 10}}
end
do
  local col = {bg = {primary = "0xff161616", secondary = "0xff262626"}, fg = {primary = "0xffdde1e6", secondary = "0xff8d8d8d"}, red = "0xffee5396", pink = "0xffff7eb6", blue = "0xff33b1ff", green = "0xff42be65"}
  local hi = {bar = col.bg.primary, label = col.fg.primary, space = {label = {inactive = col.fg.secondary, active = col.bg.primary}, icon = {inactive = col.fg.primary, active = col.bg.primary}, bg = col.pink}, bracket = col.bg.secondary, battery = {charging = col.green, low = col.red}, ["clock-bg"] = col.bg.secondary}
  M.oxocarbon = {colors = col, hi = hi}
end
return M

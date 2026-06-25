local _local_1_ = require("cfg.style")
local _local_2_ = _local_1_.oxocarbon
local hi = _local_2_.hi
local fonts = _local_1_.fonts
sbar.bar({color = hi.bar, height = 34, position = "bottom", padding_left = 6, padding_right = 0, margin = 5, y_offset = 2, corner_radius = 11, sticky = true})
return sbar.default({updates = "when_shown", drawing = true, icon = {font = fonts.icon, color = hi.label, padding_left = 3, padding_right = 3}, label = {font = fonts.label, color = hi.label, padding_left = 2, padding_right = 2}, background = {padding_left = 5, padding_right = 5, corner_radius = 6, height = 24}})

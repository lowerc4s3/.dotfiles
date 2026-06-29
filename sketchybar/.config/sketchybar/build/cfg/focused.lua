sbar.add("event", "window_focus")
local focused = sbar.add("item", {position = "center", icon = {drawing = false}})
local function _1_()
  local function _3_(_2_, _)
    local title = _2_.title
    local app = _2_.app
    local window_title = string.sub((title or app or ""), 1, 65)
    return focused:set({label = window_title})
  end
  return sbar.exec("yabai -m query --windows --window", _3_)
end
return focused:subscribe({"front_app_switched", "window_focus", "title_change"}, _1_)

sbar.add("event", "window_focus")
local focused = sbar.add("item", {position = "center", icon = {drawing = false}})
local function update_focused_window()
  local function _2_(_1_, _)
    local title = _1_.title
    local app = _1_.app
    local window_title = string.sub((title or app or ""), 1, 65)
    return focused:set({label = window_title})
  end
  return sbar.exec("yabai -m query --windows --window ", _2_)
end
return focused:subscribe({"front_app_switched", "window_focus", "title_change"}, update_focused_window)

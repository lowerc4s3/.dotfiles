local _local_1_ = require("cfg.style")
local _local_2_ = _local_1_.oxocarbon
local hi = _local_2_.hi
local fonts = _local_1_.fonts
local time = sbar.add("item", {position = "right", update_freq = 10, background = {color = hi["clock-bg"]}, icon = {drawing = false}, label = {padding_left = 8, padding_right = 8, font = fonts.clock}})
local function _3_()
  return time:set({label = os.date("%d|%m|%y %H:%M")})
end
time:subscribe({"forced", "routine", "system_woke"}, _3_)
sbar.add("event", "input_change", "AppleSelectedInputSourcesChangedNotification")
local im = sbar.add("item", {position = "right", label = {font = fonts.kbd}, icon = "\244\128\135\179"})
local function _4_()
  local get_im = "defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID"
  local function _5_(im_name, _)
    local _7_
    do
      local case_6_ = im_name:gsub("%s", "")
      if (case_6_ == "com.apple.keylayout.ABC") then
        _7_ = "EN"
      elseif (case_6_ == "com.apple.keylayout.RussianWin") then
        _7_ = "RU"
      else
        local _0 = case_6_
        _7_ = "??"
      end
    end
    return im:set({label = _7_})
  end
  return sbar.exec(get_im, _5_)
end
im:subscribe({"input_change", "forced"}, _4_)
local battery = sbar.add("item", {position = "right", update_freq = 30})
local function _12_()
  local function _25__3eicon(charging_3f, percent)
    if charging_3f then
      return {"\244\128\139\166", hi.battery.charging}
    elseif ((100 >= percent) and (percent >= 75)) then
      return {"\244\128\155\168"}
    elseif ((74 >= percent) and (percent >= 50)) then
      return {"\244\128\186\184"}
    elseif ((49 >= percent) and (percent >= 25)) then
      return {"\244\128\186\182"}
    elseif ((24 >= percent) and (percent >= 10)) then
      return {"\244\128\155\169"}
    else
      return {"\244\128\155\170", hi.battery.low}
    end
  end
  local function _14_(status, _)
    local charging_3f = (status:match("AC Power") ~= nil)
    local percent = tonumber(string.gsub(string.match(status, "%d+%%"), "%%", ""), nil)
    local _let_15_ = _25__3eicon(charging_3f, percent)
    local string = _let_15_[1]
    local _3fhighlight_color = _let_15_[2]
    return battery:set({icon = {string = string, highlight = (_3fhighlight_color ~= nil), highlight_color = _3fhighlight_color}, label = (percent .. "%")})
  end
  return sbar.exec("pmset -g batt", _14_)
end
battery:subscribe({"power_source_change", "forced", "system_woke"}, _12_)
local net = sbar.add("item", {position = "right"})
local function _16_()
  local function _17_(summary, _)
    local _3fname
    if (nil ~= summary) then
      local tmp_3_ = string.match(summary, "  SSID : (.+)  ")
      if (nil ~= tmp_3_) then
        _3fname = string.gsub(tmp_3_, "%s+$", "")
      else
        _3fname = nil
      end
    else
      _3fname = nil
    end
    local icon
    if _3fname then
      icon = "\244\128\164\134"
    else
      icon = "\244\129\163\161"
    end
    local label
    if _3fname then
      label = {drawing = true, string = _3fname}
    else
      label = {drawing = false}
    end
    return net:set({icon = icon, label = label})
  end
  return sbar.exec("ipconfig getsummary en0", _17_)
end
return net:subscribe({"system_woke", "wifi_change", "forced"}, _16_)

local _local_1_ = require("cfg.style")
local _local_2_ = _local_1_.oxocarbon
local hi = _local_2_.hi
local fonts = _local_1_.fonts
local icons = require("lib.icon_map")
local function new_space(i)
  return {associated_space = i, icon = {string = i, color = hi.space.icon.inactive, highlight_color = hi.space.icon.active, padding_left = 14, padding_right = 14}, label = {font = fonts["app-icon"], color = hi.space.label.inactive, highlight_color = hi.space.label.active, padding_right = 14, y_offset = -1}, background = {padding_left = 0, padding_right = 0, color = hi.space.bg, height = 24, drawing = false}}
end
local function create_spaces(n)
  local tbl_26_ = {}
  local i_27_ = 0
  for i = 1, n do
    local val_28_
    do
      local space = sbar.add("space", new_space(i))
      local focus
      local function _3_(_241)
        return sbar.exec(("yabai -m space --focus " .. _241.SID))
      end
      focus = _3_
      local hi_active
      local function _4_(_241)
        local sel_3f = (_241.SELECTED == "true")
        return space:set({background = {drawing = sel_3f}, icon = {highlight = sel_3f}, label = {highlight = sel_3f}})
      end
      hi_active = _4_
      space:subscribe("space_change", hi_active)
      space:subscribe("mouse.clicked", focus)
      val_28_ = space
    end
    if (nil ~= val_28_) then
      i_27_ = (i_27_ + 1)
      tbl_26_[i_27_] = val_28_
    else
    end
  end
  return tbl_26_
end
local spaces = create_spaces(10)
do
  local space_ids
  do
    local tbl_26_ = {}
    local i_27_ = 0
    for _, space in pairs(spaces) do
      local val_28_ = space.name
      if (nil ~= val_28_) then
        i_27_ = (i_27_ + 1)
        tbl_26_[i_27_] = val_28_
      else
      end
    end
    space_ids = tbl_26_
  end
  sbar.add("bracket", space_ids, {background = {color = hi.bracket}})
end
local function update_app_icons(_7_)
  local _arg_8_ = _7_.INFO
  local apps = _arg_8_.apps
  local space = _arg_8_.space
  local space0 = spaces[space]
  local default = icons.Default
  local join
  local function _9_(_241)
    return table.concat(_241, " ")
  end
  join = _9_
  local app_icons
  do
    local tbl_26_ = {}
    local i_27_ = 0
    for app, cnt in pairs(apps) do
      local val_28_
      if (cnt ~= 1) then
        local function _10_()
          local tbl_26_0 = {}
          local i_27_0 = 0
          for _ = 1, cnt do
            local val_28_0 = (icons[app] or default)
            if (nil ~= val_28_0) then
              i_27_0 = (i_27_0 + 1)
              tbl_26_0[i_27_0] = val_28_0
            else
            end
          end
          return tbl_26_0
        end
        val_28_ = join(_10_())
      else
        val_28_ = (icons[app] or default)
      end
      if (nil ~= val_28_) then
        i_27_ = (i_27_ + 1)
        tbl_26_[i_27_] = val_28_
      else
      end
    end
    app_icons = tbl_26_
  end
  local icon_strip = (" " .. join(app_icons))
  if (nil == next(apps)) then
    return space0:set({label = {drawing = false}, icon = {padding_right = 14}})
  else
    return space0:set({label = {drawing = true, string = icon_strip}, icon = {padding_right = 0}})
  end
end
local observer = sbar.add("item", {updates = true, drawing = false})
return observer:subscribe("space_windows_change", update_app_icons)

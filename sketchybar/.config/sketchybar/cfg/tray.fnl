(import-macros {: with-exec} :macro)
(local {:oxocarbon {: hi} : fonts} (require :cfg.style))

(local time (sbar.add :item
                      {:position :right
                       :update_freq 10
                       :background {:color hi.clock-bg}
                       :icon {:drawing false}
                       :label {:padding_left 8
                               :padding_right 8
                               :font fonts.clock}}))

(time:subscribe [:forced :routine :system_woke]
                #(time:set {:label (os.date "%d|%m|%y %H:%M")}))

(sbar.add :event :input_change :AppleSelectedInputSourcesChangedNotification)

(local im (sbar.add :item {:position :right
                           :label {:font fonts.kbd}
                           :icon "􀇳"}))

(fn update-im []
  (let [get-im "defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID"]
    (with-exec [im-name _ get-im]
      (im:set {:label (case (im-name:gsub "%s" "")
                        :com.apple.keylayout.ABC "EN"
                        :com.apple.keylayout.RussianWin "RU"
                        _ "??")}))))

(im:subscribe [:input_change :forced] update-im)

(local battery (sbar.add :item {:position :right :update_freq 30}))

(fn update-battery [{: INFO}]
  (fn %->icon [charging? percent]
    (if charging? ["􀋦" hi.battery.charging]
        (>= 100 percent 75) ["􀛨"]
        (>= 74 percent 50) ["􀺸"]
        (>= 49 percent 25) ["􀺶"]
        (>= 24 percent 10) ["􀛩"]
        ["􀛪" hi.battery.low]))

  (with-exec [status _ "pmset -g batt"]
    (let [charging? (= INFO :AC)
          percent (-> status
                      (string.match "%d+%%")
                      (string.gsub "%%" "")
                      (tonumber nil))
          [string ?highlight-color] (%->icon charging? percent)]
      (battery:set {:icon {: string
                           :highlight (not= ?highlight-color nil)
                           :highlight_color ?highlight-color}
                    :label (.. percent "%")}))))

(battery:subscribe [:power_source_change :forced :system_woke] update-battery)

(local net (sbar.add :item {:position :right}))

; (with-exec [summary _ "ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}'"])
; (net:set)

(fn update-network []
  (with-exec [summary _ "ipconfig getsummary en0"]
    (let [?ssid (-?> summary
                     (string.match "  SSID : (.+)  ")
                     (string.gsub "%s+$" ""))
          icon (if ?ssid "􀤆" "􁣡")
          label (if ?ssid {:drawing true :string ?ssid} {:drawing false})]
      (net:set {: icon : label}))))

(net:subscribe [:system_woke :wifi_change :forced] update-network)

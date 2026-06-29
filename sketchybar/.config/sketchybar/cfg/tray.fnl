(import-macros {: with-exec : defsub} :macro)
(local {:oxocarbon {: hi} : fonts} (require :cfg.style))

;;
;; datetime
;;

(local time (sbar.add :item
                      {:position :right
                       :update_freq 10
                       :background {:color hi.clock-bg}
                       :icon {:drawing false}
                       :label {:padding_left 8
                               :padding_right 8
                               :font fonts.clock}}))

(defsub [time [:forced :routine :system_woke]]
  (time:set {:label (os.date "%d|%m|%y %H:%M")}))

;;
;; current input method
;;

(sbar.add :event :input_change :AppleSelectedInputSourcesChangedNotification)

(local im (sbar.add :item {:position :right
                           :label {:font fonts.kbd}
                           :icon "􀇳"}))

(defsub [im [:input_change :forced]]
  (let [get-im "defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID"]
    (with-exec [im-name _ get-im]
      (im:set {:label (case (im-name:gsub "%s" "")
                        :com.apple.keylayout.ABC "EN"
                        :com.apple.keylayout.RussianWin "RU"
                        _ "??")}))))

;;
;; battery status and percentage
;;

(local battery (sbar.add :item {:position :right :update_freq 30}))
(defsub [battery [:power_source_change :forced :system_woke]]
  (fn %->icon [charging? percent]
    (if charging? ["􀋦" hi.battery.charging]
        (>= 100 percent 75) ["􀛨"]
        (>= 74 percent 50) ["􀺸"]
        (>= 49 percent 25) ["􀺶"]
        (>= 24 percent 10) ["􀛩"]
        ["􀛪" hi.battery.low]))

  (with-exec [status _ "pmset -g batt"]
    (let [charging? (not= (status:match "AC Power") nil)
          percent (-> status
                      (string.match "%d+%%")
                      (string.gsub "%%" "")
                      (tonumber nil))
          [string ?highlight-color] (%->icon charging? percent)]
      (battery:set {:icon {: string
                           :highlight (not= ?highlight-color nil)
                           :highlight_color ?highlight-color}
                    :label (.. percent "%")}))))

;;
;; wifi status
;;

(local net (sbar.add :item {:position :right}))
(defsub [net [:system_woke :wifi_change :forced]]
  (with-exec [summary _ "ipconfig getsummary en0"]
    (let [?name (-?> summary
                     (string.match "  SSID : (.+)  ")
                     (string.gsub "%s+$" ""))
          icon (if ?name "􀤆" "􁣡")
          label (if ?name {:drawing true :string ?name} {:drawing false})]
      (net:set {: icon : label}))))

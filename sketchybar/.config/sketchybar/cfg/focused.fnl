(import-macros {: with-exec : defsub} :macro)

(sbar.add :event :window_focus)

(local focused (sbar.add :item {:position :center :icon {:drawing false}}))
(defsub [focused [:front_app_switched :window_focus :title_change]]
  (with-exec [{: title : app} _ "yabai -m query --windows --window"]
    (let [window-title (string.sub (or title app "") 1 65)]
      (focused:set {:label window-title}))))

(import-macros {: with-exec} :macro)
(sbar.add :event :window_focus)

(let [focused (sbar.add :item {:position :center :icon {:drawing false}})]
  (fn update-focused-window []
    (with-exec [{: title : app} _ "yabai -m query --windows --window "]
      (let [window-title (string.sub (or title app "") 1 65)]
        (focused:set {:label window-title}))))

  (focused:subscribe [:front_app_switched :window_focus :title_change]
                     update-focused-window))

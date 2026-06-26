(import-macros {: |} :macro)
(local {:oxocarbon {: hi} : fonts} (require :cfg.style))
(local icons (require :lib.icon_map))

(fn new-space [i]
  {:associated_space i
   :icon {:string i
          :color hi.space.icon.inactive
          :highlight_color hi.space.icon.active
          :padding_left 14
          :padding_right 14}
   :label {:font fonts.app-icon
           :color hi.space.label.inactive
           :highlight_color hi.space.label.active
           :padding_right 14
           :y_offset -1}
   :background {:padding_left 0
                :padding_right 0
                :color hi.space.bg
                :height 24
                :drawing false}})

(fn create-spaces [n]
  (fcollect [i 1 n]
    (let [space (sbar.add :space (new-space i))
          focus #(sbar.exec (.. "yabai -m space --focus " $.SID))
          hi-active #(let [sel? (= $.SELECTED :true)]
                       (space:set {:background {:drawing sel?}
                                   :icon {:highlight sel?}
                                   :label {:highlight sel?}}))]
      (space:subscribe :space_change hi-active)
      (space:subscribe :mouse.clicked focus)
      space)))

(local spaces (create-spaces 10))

(let [space-ids (icollect [_ space (pairs spaces)] space.name)]
  (sbar.add :bracket space-ids {:background {:color hi.bracket}}))

(fn update-app-icons [{:INFO {: apps : space}}]
  (let [space (. spaces space)
        default (. icons :Default)
        join #(table.concat $ " ")
        app-icons (icollect [app cnt (pairs apps)]
                    (if (not= cnt 1)
                        (join (fcollect [_ 1 cnt] (or (. icons app) default)))
                        (or (. icons app) default)))
        icon-strip (.. " " (join app-icons))]
    (if (= nil (next apps))
        (space:set {:label {:drawing false} :icon {:padding_right 14}})
        (space:set {:label {:drawing true :string icon-strip}
                    :icon {:padding_right 0}}))))

(let [observer (sbar.add :item {:drawing false :updates true})]
  (observer:subscribe :space_windows_change update-app-icons))

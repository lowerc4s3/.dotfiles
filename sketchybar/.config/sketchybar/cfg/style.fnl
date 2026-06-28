(macro hex [rgb]
  (.. "0xff" rgb))

(local M {:fonts nil :oxocarbon nil})

(let [mono "Lilex Nerd Font"
      icon mono
      sans "SF UI Text"]
  (set M.fonts {:label {:family sans :style :Regular :size 14.5}
                :icon {:family icon :style :Regular :size 16}
                :clock {:family mono :style :Regular :size 16}
                :kbd {:family mono :style :Regular :size 14.5}
                :app-icon {:family "sketchybar-app-font" :style :Regular :size 10}}))

(let [col {:bg {:primary (hex "161616") :secondary (hex "262626")}
           :fg {:primary (hex "dde1e6") :secondary (hex "8d8d8d")}
           :red (hex "ee5396")
           :pink (hex "ff7eb6")
           :blue (hex "33b1ff")
           :green (hex "42be65")}
      hi {:bar col.bg.primary
          :label col.fg.primary
          :space {:label {:inactive col.fg.secondary :active col.bg.primary}
                  :icon {:inactive col.fg.primary :active col.bg.primary}
                  :bg col.red}
          :bracket col.bg.secondary
          :battery {:charging col.green :low col.red}
          :clock-bg col.bg.secondary}]
  (set M.oxocarbon {:colors col : hi}))

M

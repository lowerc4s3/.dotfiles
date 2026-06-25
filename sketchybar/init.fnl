(let [user (os.getenv "USER")
      sbarlua (.. "/Users/" user "/.local/share/sketchybar_lua/?.so")]
  (set package.cpath (.. package.cpath ";" sbarlua)))

(set _G.sbar (require :sketchybar))

(sbar.begin_config)
(require :cfg.bar)
(require :cfg.spaces)
(require :cfg.focused)
(require :cfg.tray)
(sbar.end_config)
(sbar.event_loop)

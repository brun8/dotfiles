local awful = require'awful'

awful.spawn.with_shell("~/.config/polybar/launch.sh")
awful.spawn.with_shell("picom")
awful.spawn.with_shell("feh --bg-fill ~/wp/wp.jpg")
awful.spawn.with_shell("xrandr --output DP-0 --mode 1920x1080 --rate 144.00")


local awful = require'awful'

awful.spawn.with_shell("~/.config/polybar/launch.sh")
awful.spawn.with_shell("picom")
awful.spawn.with_shell("feh --bg-fill ~/wp/wp.jpg")


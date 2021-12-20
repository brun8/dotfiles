-- vim:fdm=marker
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local dpi = require("beautiful.xresources").apply_dpi

local theme = {}
theme.dir = os.getenv("HOME").."/.config/awesome/wallpapers"

-- Fonts
theme.font = "Iosevka Nerd Font 9"
theme.taglist_font = "JetBrainsMono Nerd Font 12"
theme.icon_font = "Iosevka Nerd Font 10"
theme.exit_screen_font = "Iosevka Nerd Font Mono 120"
theme.widget_font = 'JetBrainsMono Nerd Font 10'
theme.notification_font = "Sans 10"
theme.tasklist_font = "Roboto Mono 10"

-- colors
theme.clr = {
	purple = "#c792ea",
	blue = "#82aaff",
	green = "#7cd380",
	red = '#ff5370',
	gray = '#8796b0',
	yellow = '#ffcb8b',
	pink = '#fc84e4',
	white = '#8dd1de',
	cyan = '#88c0d0',
	orange = '#ffbd2e'
}

theme.fg_normal = '#424760'
theme.fg_focus = '#a6accd'
theme.fg_urgent = '#424760'

theme.bg_normal = '#00000099' -- '#1e222a'
theme.bg_focus = '#121622'
theme.bg_urgent = "#081218"
theme.bg_light = '#1e222a00' -- '#2c3038'
theme.bg_systray = theme.bg_light

theme.tasklist_bg_normal = '#181828'
theme.tasklist_bg_focus = '#1f1f2f'
theme.tasklist_bg_urgent = '#1b1b2b'

theme.taglist_bg_urgent = "#2f2f3f"
theme.taglist_bg_focus = "#2f2f3f"
theme.taglist_fg_occupied = theme.clr.blue
theme.taglist_fg_urgent = theme.clr.red
theme.taglist_fg_empty = theme.clr.gray
theme.taglist_fg_focus = theme.clr.green

theme.notification_fg = '#a6accd'
theme.notification_bg = '#121622'
theme.notification_opacity = 1

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(2)
theme.border_normal = "#000000"
theme.border_focus  = "#f2777a"
theme.border_marked = "#91231c"

theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true
theme.gap_single_client = true

-- naughty configuration
theme.notification_border_color = theme.bg_light
theme.notification_border_width = dpi(5)

naughty.config.padding = dpi(8)
naughty.config.defaults = {
	timeout = 0,
	text = "",
	ontop = true,
	position = "top_right",
	margin = dpi(10),
}

return theme

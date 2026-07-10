require("env")
require("monitors")
require("xwayland")
require("input")
require("key-bindings")
require("animations")
require("window-rules")
require("workspace-rules")
require("autostart")

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,

		border_size = 0,

		layout = "scrolling",
	},

	decoration = {
		rounding = 20,
		rounding_power = 2,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 8,
			passes = 2,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

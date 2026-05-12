hl.window_rule({
	name = "terminal opacity",
	match = {
		class = "ghostty",
	},
	opacity = "0.85 0.7",
})

hl.window_rule({
	name = "discord opacity",
	match = {
		class = "discord",
	},
	opacity = "0.95 0.9",
})

hl.window_rule({
	name = "fullscreen Warframe",
	match = {
		title = "Warframe",
	},
	fullscreen = true,
})

hl.window_rule({
	name = "float steam",
	match = {
		class = "steam",
	},
	float = true,
})

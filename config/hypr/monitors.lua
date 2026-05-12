hl.monitor({ output = "DP-1", mode = "3840x2160@144", position = "0x0", scale = "1.25" })
hl.monitor({ output = "DP-2", mode = "3840x2160@60", position = "auto-left", scale = "1.25" })

-- workaround cursor being limited to first monitor on startup
hl.on("hyprland.start", function()
	hl.exec_cmd("sleep 2 && hyprctl reload")
end)

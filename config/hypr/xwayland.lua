-- unscale xwayland
hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})
-- scale non-wayland GDK applications
hl.env("GDK_SCALE", 2)

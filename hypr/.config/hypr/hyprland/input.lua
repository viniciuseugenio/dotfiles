---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us,br",
		kb_variant = "altgr-intl,abnt2",
		kb_options = "compose:ralt",
		repeat_delay = 300,
		repeat_rate = 35,

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			disable_while_typing = true,
			natural_scroll = false,
		},

		touchdevice = {
			enabled = false,
		},
	},
})

hl.config({
	gestures = {
		workspace_swipe_distance = 200,
	},
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "logitech-usb-optical-mouse",
	sensitivity = -0.8,
})

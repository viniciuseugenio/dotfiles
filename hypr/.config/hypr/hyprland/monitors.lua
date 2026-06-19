------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- External monitor
hl.monitor({
	output = "HDMI-A-1",
	mode = "1366x768",
	position = "0x0",
	scale = 0.67,
})

-- Notebook's monitor
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = 1.00,
})

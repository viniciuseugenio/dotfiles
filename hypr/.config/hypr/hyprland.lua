-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = 1.0,
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "kitty"
local floatingTerminal = "kitty --class floatingWindow"
local fileManager = "thunar"
local fileManagerCli = "kitty -e yazi"
local menu = "wofi"
local browser = "brave-beta"
local spotify = "flatpak run com.spotify.Client"
local clipboardManager = "kitty --class floatingWindow -e clipse"
local obsidian = "obsidian"
local swayControlCenter = "swaync-client -t -sw"
local bluetoothCtl = "kitty --class floatingWindow -e bluetoothctl"
local btop = "kitty --class floatingWindow -e btop"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--

hl.on("hyprland.start", function()
	hl.exec_cmd("awww-daemon & waybar & hypridle & swaync")
	hl.exec_cmd("hyprctl setcursor WinSur-white-cursors 8")
	hl.exec_cmd("clipse -listen")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme WinSur-white-cursors")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 8")
	hl.exec_cmd("easyeffects --gapplication-service")
	hl.exec_cmd('kitty -a floatingWindow -e bash -c "protonvpn connect; exec zsh"')
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "8")
hl.env("HYPRCURSOR_SIZE", "8")

hl.env("HYPRCURSOR_THEME", "WinSur-white-cursors")
hl.env("XCURSOR_THEME", "WinSur-white-cursors")

hl.env("DEFAULT_FILE_MANAGER", "~/.local/bin/filemanager")
hl.env("SSH_AUTH_SOCK", "$XDG_RUNTIME_DIR/ssh-agent.socket")
hl.env("HYPRSHOT_DIR", "/home/vinicius/Pictures/Screenshots")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 15,

		border_size = 2,

		col = {
			active_border = "rgba(B59E7Dee)",
			inactive_border = "rgba(1E1D1Dee)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		-- rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		dim_inactive = false,
		dim_strength = 0.1,
		dim_special = 0.8,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 1,
			passes = 5,
			special = true,
		},
	},

	animations = {
		enabled = false,
	},

	cursor = {
		inactive_timeout = 3,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.645, 0.045 }, { 0.355, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 0.99 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 8, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = false, speed = 4.1, bezier = "easeOutQuint", style = "popin" })
hl.animation({ leaf = "windowsOut", enabled = false, speed = 5, bezier = "easeOutQuint", style = "popin" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "quick" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.73, bezier = "quick" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "wind", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 5, bezier = "easeOutQuint", style = "fade" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		font_family = "SF Pro Display",
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

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

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local shiftMod = "SUPER + SHIFT" -- Sets "Windows" key as main modifier
local altMod = "SUPER + ALT" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(bluetoothCtl))
hl.bind(shiftMod .. " + B", hl.dsp.exec_cmd(btop))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + X", hl.dsp.layout("togglesplit l")) -- dwindle only
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(swayControlCenter))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(clipboardManager))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(obsidian))
hl.bind(shiftMod .. " + P", hl.dsp.exec_cmd(spotify))
hl.bind(shiftMod .. " + W", hl.dsp.exec_cmd("pkill hyprpaper && hyprpaper &"))
hl.bind(shiftMod .. " + bracketleft", hl.dsp.exec_cmd("hyprlock"))
hl.bind(shiftMod .. " + Q", hl.dsp.window.close())
hl.bind(shiftMod .. " + E", hl.dsp.exec_cmd(fileManagerCli))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(shiftMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(shiftMod .. " + M", hl.dsp.exec_cmd("Telegram"))
hl.bind(shiftMod .. " + T", hl.dsp.exec_cmd(floatingTerminal))

-- Resize windows via keyboard
hl.bind(altMod .. " + H", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -10 0"))
hl.bind(altMod .. " + L", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 10 0"))
hl.bind(altMod .. " + J", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 10"))
hl.bind(altMod .. " + K", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -10"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind("ALT + TAB", hl.dsp.exec_cmd("hyprctl dispatch cyclenext"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(shiftMod .. " + H", hl.dsp.exec_cmd("hyprctl dispatch movewindow l"))
hl.bind(shiftMod .. " + L", hl.dsp.exec_cmd("hyprctl dispatch movewindow r"))
hl.bind(shiftMod .. " + K", hl.dsp.exec_cmd("hyprctl dispatch movewindow u"))
hl.bind(shiftMod .. " + J", hl.dsp.exec_cmd("hyprctl dispatch movewindow d"))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local floatingWindow = hl.window_rule({
	name = "floatingWindow",
	match = { class = "floatingWindow" },
	float = true,
	size = "1300 800",
	center = true,
})

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_initial_focus = false,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

hl.layer_rule({
	match = { namespace = "swaync-control-center" },
	blur = true,
	ignore_alpha = 0.5,
})

hl.layer_rule({
	match = { namespace = "swaync-notification-window" },
	blur = true,
	ignore_alpha = 0.5,
})

hl.layer_rule({
	match = { namespace = "wofi" },
	blur = true,
	ignore_alpha = 0.5,
})

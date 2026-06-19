---------------------
-- Set programs that you use
local terminal = "kitty"
local floatingTerminal = "kitty --class floatingWindow"
local fileManager = "thunar"
local fileManagerCli = "kitty -e yazi"
local menu = "wofi"
local browser = "brave-origin"
local spotify = "flatpak run com.spotify.Client"
local clipboardManager = "kitty --class floatingWindow -e clipse"
local obsidian = "obsidian"
local swayControlCenter = "swaync-client -t -sw"
local bluetoothCtl = "kitty --class floatingWindow -e bluetoothctl"
local btop = "kitty --class floatingWindow -e btop"
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
hl.bind(shiftMod .. " + R", hl.dsp.exec_cmd("hyprctl reload"))

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

hl.bind(shiftMod .. " + H", hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(shiftMod .. " + L", hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(shiftMod .. " + K", hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(shiftMod .. " + J", hl.dsp.window.move({ direction = "down", group_aware = true }))
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

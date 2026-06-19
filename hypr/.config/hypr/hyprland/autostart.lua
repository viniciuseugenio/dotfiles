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

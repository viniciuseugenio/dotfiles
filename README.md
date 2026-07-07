# dotfiles

My personal **Hyprland** dotfiles.

## What is in this repo

- **hypr/**: Hyprland config (window manager behavior, keybinds, startup, layout).
- **waybar/**: Waybar status bar config and styling.
- **kitty/**: Kitty terminal settings.
- **wofi/**: Wofi app launcher/menu config.
- **swaync/**: Sway Notification Center config.
- **nvim/**: Neovim editor config (plugins, UI, keymaps).
- **tmux/**: Tmux terminal multiplexer config.
- **zsh/**: Zsh shell config, aliases, prompt, and environment.
- **scripts/**: Helper shell scripts used by the desktop/workflow.
- **wallpapers/**: Wallpaper files used by the setup.

> Adjust folder names above if your repo uses slightly different names.

## Tool purpose (quick)

- **Hyprland**: Wayland compositor / window manager.
- **Waybar**: Top/bottom status bar.
- **Kitty**: Terminal emulator.
- **Wofi**: App launcher.
- **Mako / SwayNC**: Notifications.
- **Neovim**: Text editor.
- **Tmux**: Terminal session manager.
- **Zsh**: Interactive shell.

## Apply quickly with GNU Stow (recommended)

Using **GNU Stow** is the fastest way to link these dotfiles into your home directory.

```bash
git clone https://github.com/viniciuseugenio/dotfiles.git
cd dotfiles

# Example: stow one package
stow hypr

# Or stow multiple packages
stow hypr waybar kitty wofi mako swaync nvim tmux zsh gtk
```

To remove links later:

```bash
stow -D hypr waybar kitty wofi mako swaync nvim tmux zsh gtk
```

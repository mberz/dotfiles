# Add homebrew to the path
export PATH=/opt/homebrew/bin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

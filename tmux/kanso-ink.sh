#!/usr/bin/env bash

# Kanso Ink surfaces. Kanso shares Kanagawa Dragon's accents, so start from that.
source "$HOME/.tmux/plugins/tmux-powerkit/src/themes/kanagawa/dragon.sh"

THEME_COLORS[background]="#14171d"
THEME_COLORS[statusbar-bg]="#14171d"
THEME_COLORS[statusbar-fg]="#c5c9c7"
THEME_COLORS[session-fg]="#14171d"
THEME_COLORS[message-fg]="#c5c9c7"
THEME_COLORS[message-bg]="#14171d"
THEME_COLORS[popup-bg]="#14171d"
THEME_COLORS[popup-fg]="#c5c9c7"
THEME_COLORS[menu-bg]="#14171d"
THEME_COLORS[menu-fg]="#c5c9c7"
THEME_COLORS[menu-selected-fg]="#14171d"
THEME_COLORS[window-inactive-base]="#393b44"
THEME_COLORS[pane-border-active]="#8992a7"
THEME_COLORS[pane-border-inactive]="#22262d"
# status plugins use the inactive window colour so they stay quiet next to the tabs
THEME_COLORS[ok-base]="#393b44"
THEME_COLORS[info-base]="#393b44"

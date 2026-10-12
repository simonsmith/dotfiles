#!/usr/bin/env bash

# Kanso Pearl surfaces. Kanso shares Kanagawa Lotus's accents, so start from that.
source "$HOME/.tmux/plugins/tmux-powerkit/src/themes/kanagawa/lotus.sh"

THEME_COLORS[background]="#f2f1ef"
THEME_COLORS[statusbar-bg]="#f2f1ef"
THEME_COLORS[statusbar-fg]="#545464"
THEME_COLORS[session-fg]="#f2f1ef"
THEME_COLORS[message-fg]="#545464"
THEME_COLORS[message-bg]="#f2f1ef"
THEME_COLORS[popup-bg]="#f2f1ef"
THEME_COLORS[popup-fg]="#545464"
THEME_COLORS[menu-bg]="#f2f1ef"
THEME_COLORS[menu-fg]="#545464"
THEME_COLORS[menu-selected-fg]="#f2f1ef"
THEME_COLORS[window-inactive-base]="#dddddb"
THEME_COLORS[pane-border-active]="#624c83"
THEME_COLORS[pane-border-inactive]="#dddddb"
# status plugins use the inactive window colour so they stay quiet next to the tabs
THEME_COLORS[ok-base]="#dddddb"
THEME_COLORS[info-base]="#dddddb"

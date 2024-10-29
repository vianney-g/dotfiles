# Color key:
#   #1d1f21 Background
#   #282a2e Current Line
#   #373b41 Selection
#   #c5c8c6 Foreground
#   #969896 Comment
#   #cc6666 Red
#   #de935f Orange
#   #f0c674 Yellow
#   #b5bd68 Green
#   #8abeb7 Aqua
#   #81a2be Blue
#   #b294bb Purple


## set status bar
set -g status-style bg=default
# setw -g window-status-current-style bg="#282a2e"
setw -g window-status-current-style fg="#81a2be"

## highlight active window
setw -g window-style 'bg=#282a2e'
setw -g window-active-style 'bg=#1d1f21'
setw -g pane-active-border-style ''

## highlight activity in status bar
setw -g window-status-activity-style fg="#8abeb7"
setw -g window-status-activity-style bg="#1d1f21"

## pane border and colors
set -g pane-active-border-style bg=default
set -g pane-active-border-style fg="#373b41"
set -g pane-border-style bg=default
set -g pane-border-style fg="#373b41"

set -g clock-mode-colour "#81a2be"
set -g clock-mode-style 24

set -g message-style bg="#8abeb7"
set -g message-style fg="#000000"

set -g message-command-style bg="#8abeb7"
set -g message-command-style fg="#000000"

# message bar or "prompt"
set -g message-style bg="#2d2d2d"
set -g message-style fg="#cc99cc"

set -g mode-style bg="#1d1f21"
set -g mode-style fg="#de935f"

# status left
set -g status-left ''

# right side of status bar holds "[host name] (date time)"
set -g status-right-length 100
set -g status-right-style fg=black
set -g status-right-style bold
# set -g status-right '#[bg=#81a2be fg=#2d2d2d] %A %d %B #[fg=#f0c674 bg=default] %k:%M #[reverse]  #S #[default]'
set -g status-right '#[bg=#f0c674 fg=#2d2d2d]  #S #[default]'

# make background window look like white tab
set-window-option -g window-status-style bg=default
set-window-option -g window-status-style fg=white
set-window-option -g window-status-style none
set-window-option -g window-status-format '#[fg=#2d2d2d,bg=#393939]#[fg=#999999,bg=#393939] #W #[fg=#393939,bg=default]#[default]'

# make foreground window look like bold yellow foreground tab
set-window-option -g window-status-current-style none
set-window-option -g window-status-current-format '#[fg=#2d2d2d,bg=#f0c674 bright]#[fg=#393939,bg=#f0c674] #W #[fg=#f0c674,bg=default]#[default]'

# active terminal yellow border, non-active white
set -g pane-border-style bg=default
set -g pane-border-style fg="#999999"
set -g pane-active-border-style fg="#f0c674"

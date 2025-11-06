# Color key:
background="#0a0e14"
# background="#000000"
current_line="#282a2e"
selection="#607080"
foreground="#cbccc6"
comment="#5c6773"
red="#f28779"
orange="#de935f"
yellow="#e6b450"
green="#bae67e"
aqua="#8abeb7"
blue="#5ccfe6"
purple="#b294bb"

## set status bar
set -g status-style bg=#0a0e14

## highlight active window
setw -g window-style bg=#0a0e14
setw -g window-active-style bg=#0a0e14
setw -g pane-active-border-style ''

## highlight activity in status bar
setw -g window-status-activity-style "fg=#8abeb7"
setw -g window-status-activity-style bg=#0a0e14

## pane border and colors
set -g pane-active-border-style bg=#0a0e14
set -g pane-active-border-style fg=#607080
set -g pane-border-style bg=default
set -g pane-border-style fg=#607080

set -g clock-mode-colour "#5ccfe6"
set -g clock-mode-style 24

set -g message-style bg=#8abeb7
set -g message-style fg=#0a0e14

set -g message-command-style bg=#8abeb7
set -g message-command-style fg=#0a0e14

# message bar or "prompt"
set -g message-style bg=#0a0e14
set -g message-style fg="#cc99cc"

set -g mode-style bg=#0a0e14
set -g mode-style fg=#de935f

# status left
set -g status-left ''

# right side of status bar holds "Session name"
set -g status-right-length 100
set -g status-right-style bg=#0a0e14
set -g status-right-style none
set -g status-right '#[bg=#393939 fg=#0a0e14]#[fg=#cbccc6]  #S #[fg=#0a0e14]#[bg=#0a0e14]'

# make background window look like white tab
set-window-option -g window-status-style bg=#0a0e14
set-window-option -g window-status-style fg=white
set-window-option -g window-status-format '#[fg=#0a0e14,bg=#393939]#[fg=#999999,bg=#393939] #W #[fg=#393939,bg=#0a0e14]'

# make foreground window look like bold yellow foreground tab
set-window-option -g window-status-current-style none
set-window-option -g window-status-current-format '#[fg=#0a0e14,bg=#e6b450 bright]#[fg=#393939,bg=#e6b450] #W #[fg=#e6b450,bg=default]#[default]'

# active terminal yellow border, non-active white
set -g pane-border-style bg=default
set -g pane-border-style fg="#999999"
set -g pane-active-border-style fg=#e6b450

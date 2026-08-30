# Tmux Config

Although the tmux config is typically located elsewhere, I’ve included it in this repository (alongside my Neovim config) for easier access and quicker reference.

```
set -g mouse on
set -g base-index 1
set -g pane-base-index 1
set -g prefix C-a
set -g status-right "%Y-%m-%d %H:%M"

# true color
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",*:Tc"

# gruvbox dark
set -g status-style "bg=#282828,fg=#a89984"
set -g status-left ""
set -g status-right-style "bg=#282828,fg=#a89984"

set -g mode-style "fg=#282828,bg=#a89984"
set -g message-style "fg=#282828,bg=#a89984"

set -g window-status-format "#[fg=#928374] #I:#W "
set -g window-status-current-format "#[fg=#282828,bg=#fabd2f,bold] #I:#W "
set -g window-status-style "bg=default"
set -g window-status-current-style "bg=default"

set -g pane-border-style "fg=#3c3836"
set -g pane-active-border-style "fg=#a89984"
```

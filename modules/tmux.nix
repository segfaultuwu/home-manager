{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    terminal = "screen-256color";
    keyMode = "vi";
    mouse = true;
    baseIndex = 1;
    escapeTime = 10;
    clock24 = true;
    historyLimit = 50000;

    prefix = "C-a";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      resurrect
      continuum
    ];

    extraConfig = ''
      unbind C-b
      bind C-a send-prefix

      # Reload config
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "tmux config reloaded"

      # Splits
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # New window in current path
      bind c new-window -c "#{pane_current_path}"

      # Vim-like pane movement
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Resize panes
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # Windows
      bind -r C-h previous-window
      bind -r C-l next-window

      # Copy mode
      bind Enter copy-mode
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send -X copy-selection-and-cancel
      bind -T copy-mode-vi Escape send -X cancel

      # Status
      set -g status on
      set -g status-position bottom
      set -g status-interval 2
      set -g status-justify left

      set -g status-left-length 40
      set -g status-right-length 120

      set -g status-left "#[bold] #S "
      set -g status-right " %H:%M %d.%m.%Y "

      set -g window-status-format " #I:#W "
      set -g window-status-current-format " #[bold]#I:#W "

      # Better colors
      set -g default-terminal "screen-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Focus events for editors
      set -g focus-events on

      # Renumber windows after closing
      set -g renumber-windows on

      # Resurrect/continuum
      set -g @continuum-restore 'on'
      set -g @continuum-save-interval '10'
    '';
  };
}

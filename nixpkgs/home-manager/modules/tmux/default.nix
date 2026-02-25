{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    escapeTime = 0;
    baseIndex = 1;

    plugins = with pkgs.tmuxPlugins; [
      resurrect
      continuum

      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'macchiato' # or frappe, macchiato, mocha
          set -g @catppuccin_window_status_style "rounded"

          # Make the status line pretty and add some modules
          set -g status-right-length 100
          set -g status-left-length 100
          set -g status-left ""
          set -g status-right "#{E:@catppuccin_status_application}"
          set -ag status-right "#{E:@catppuccin_status_session}"
          set -ag status-right "#{E:@catppuccin_status_uptime}"
          set -g @catppuccin_window_text " #(basename #{pane_current_path})"
          set -g @catppuccin_window_current_text " #(basename #{pane_current_path})"
        '';
      }
    ];

    extraConfig = ''
      set -g @continuum-restore 'on'
      set -g @continuum-save-interval '1'

      # for images
      set -gq allow-passthrough on


      set-option -g mouse off

      bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
      bind -n WheelDownPane select-pane -t= \; send-keys -M

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R
      bind X kill-pane

      bind -n M-H previous-window
      bind -n M-L next-window

      # Allow window swaping with mouse
      bind-key -n MouseDrag1Status swap-window -d -t=

      bind % split-window -h -c "#{pane_current_path}"
      bind '"' split-window -c "#{pane_current_path}"
      bind m set-window-option mouse\; display-message "mouse is now #{?mouse,on,off}"

      set -sg escape-time 0

      set -g default-terminal "screen-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -g renumber-windows on

      set-option -g focus-events on
      set-option -sa terminal-overrides ',alacritty:RGB'

      # Smart pane switching with awareness of Vim splits.
      # See: https://github.com/christoomey/vim-tmux-navigator
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$'"
      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
      tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
      if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
      if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'C-\' select-pane -l
    '';

  };
}

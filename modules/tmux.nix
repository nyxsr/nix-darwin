{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.tmux = {
    enable = true;

    # Use screen-256color for better compatibility
    terminal = "screen-256color";

    # Increase history
    historyLimit = 50000;

    # Start windows and panes at 1, not 0
    baseIndex = 1;

    # Enable mouse support
    mouse = true;

    # Reduce escape time for better vim responsiveness
    escapeTime = 0;

    # Use vi mode
    keyMode = "vi";

    # Custom prefix key (Ctrl-a instead of Ctrl-b)
    prefix = "C-a";

    # Enable focus events
    focusEvents = true;

    # Shell to use
    shell = "${pkgs.zsh}/bin/zsh";

    # Tmux plugins
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      pain-control
      sessionist
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-save 'S'
          set -g @resurrect-restore 'R'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '15'
        '';
      }
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'
          set -g @catppuccin_window_left_separator ""
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"
          set -g @catppuccin_status_modules_right "session directory date_time"
          set -g @catppuccin_status_left_separator  " "
          set -g @catppuccin_status_right_separator ""
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"
          set -g @catppuccin_directory_text "#{pane_current_path}"
          set -g @catppuccin_date_time_text "%H:%M %d-%b"
        '';
      }
    ];

    extraConfig = ''
      # Enable true colors
      set -ga terminal-overrides ",alacritty:Tc"
      set -ga terminal-overrides ",xterm-256color:Tc"

      # Renumber windows when one is closed
      set -g renumber-windows on

      # Set window notifications
      setw -g monitor-activity on
      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      set -g bell-action none

      # Automatically set window title
      set-window-option -g automatic-rename on
      set-option -g set-titles on
      set-option -g set-titles-string '#S › #W'

      # ============================================
      # Key Bindings
      # ============================================

      # Send prefix to nested tmux sessions
      bind-key a send-prefix

      # Reload configuration
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded!"

      # ============================================
      # Window Management
      # ============================================

      # Create new window with current path
      bind c new-window -c "#{pane_current_path}"

      # Window navigation
      bind -n M-h previous-window  # Alt+h
      bind -n M-l next-window      # Alt+l
      bind -n M-j switch-client -n  # Alt+j next session
      bind -n M-k switch-client -p  # Alt+k previous session

      # Quick window selection
      bind -n M-1 select-window -t :=1
      bind -n M-2 select-window -t :=2
      bind -n M-3 select-window -t :=3
      bind -n M-4 select-window -t :=4
      bind -n M-5 select-window -t :=5
      bind -n M-6 select-window -t :=6
      bind -n M-7 select-window -t :=7
      bind -n M-8 select-window -t :=8
      bind -n M-9 select-window -t :=9

      # Move windows left/right
      bind -n C-S-Left swap-window -t -1 \; previous-window
      bind -n C-S-Right swap-window -t +1 \; next-window

      # ============================================
      # Pane Management
      # ============================================

      # Better splitting commands
      bind | split-window -h -c "#{pane_current_path}"
      bind \\ split-window -h -c "#{pane_current_path}"  # Alternative
      bind - split-window -v -c "#{pane_current_path}"
      bind _ split-window -v -c "#{pane_current_path}"  # Alternative
      bind % split-window -h -c "#{pane_current_path}"  # Keep default
      bind '"' split-window -v -c "#{pane_current_path}"  # Keep default

      # Vim-style pane navigation
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Alt + Arrow keys without prefix for pane navigation
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Resize panes with vim keys
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # Resize with Ctrl+Shift+Arrow
      bind -n C-S-Up resize-pane -U 5
      bind -n C-S-Down resize-pane -D 5
      bind -n C-S-Left resize-pane -L 5
      bind -n C-S-Right resize-pane -R 5

      # Toggle pane zoom
      bind z resize-pane -Z
      bind -n M-z resize-pane -Z  # Alt+z without prefix

      # Swap panes
      bind > swap-pane -D
      bind < swap-pane -U

      # Break pane into window
      bind b break-pane

      # Join pane from window
      bind-key S choose-window 'join-pane -v -s "%%"'
      bind-key V choose-window 'join-pane -h -s "%%"'

      # ============================================
      # Copy Mode
      # ============================================

      # Enter copy mode
      bind Enter copy-mode
      bind -n M-v copy-mode  # Alt+v without prefix

      # Vi-style copy mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key -T copy-mode-vi Escape send-keys -X cancel

      # macOS clipboard integration
      if-shell "uname | grep -q Darwin" {
        bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
        bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"
        bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "pbcopy"
      }

      # ============================================
      # Session Management
      # ============================================

      # Session navigation
      bind ( switch-client -p  # Previous session
      bind ) switch-client -n  # Next session

      # Create new session
      bind N new-session

      # Kill session
      bind X confirm-before -p "Kill session #S? (y/n)" kill-session

      # Session picker
      bind s choose-tree -Zs

      # ============================================
      # Smart Vim Integration
      # ============================================

      # Smart pane switching with awareness of Vim splits
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'

      # Clear screen with prefix + Ctrl-l (since Ctrl-l is used for navigation)
      bind C-l send-keys 'C-l'

      # ============================================
      # Quick Layouts
      # ============================================

      # Predefined layouts
      bind M-1 select-layout even-horizontal
      bind M-2 select-layout even-vertical
      bind M-3 select-layout main-horizontal
      bind M-4 select-layout main-vertical
      bind M-5 select-layout tiled

      # ============================================
      # Utility Bindings
      # ============================================

      # Display pane numbers (useful for pane selection)
      bind q display-panes -d 3000

      # Toggle status bar
      bind-key b set-option status

      # Open new window with htop
      bind-key H new-window -n htop 'htop'

      # Open new window with lazygit
      bind-key g new-window -n git 'lazygit'

      # Open new window with k9s
      bind-key K new-window -n k9s 'k9s'

      # ============================================
      # Mouse Enhancements
      # ============================================

      # Middle click to paste from clipboard
      bind-key -n MouseDown2Pane run "tmux set-buffer -b primary_selection \"$(pbpaste)\"; tmux paste-buffer -b primary_selection; tmux delete-buffer -b primary_selection"

      # Double click to select word
      bind-key -n DoubleClick1Pane \
          select-pane \; \
          copy-mode -M \; \
          send-keys -X select-word

      # Triple click to select line
      bind-key -n TripleClick1Pane \
          select-pane \; \
          copy-mode -M \; \
          send-keys -X select-line

      # ============================================
      # Status Bar Customization (if not using theme plugin)
      # ============================================

      # Position
      set -g status-position bottom

      # Update interval
      set -g status-interval 5

      # Length
      set -g status-left-length 50
      set -g status-right-length 60

      # ============================================
      # Pane Border Indicators
      # ============================================

      # Show pane border status
      set -g pane-border-status top
      set -g pane-border-format " #P: #{pane_current_command} "

      # ============================================
      # Popup Windows (tmux 3.2+)
      # ============================================

      # Toggle popup window with lazygit
      bind-key G display-popup -d '#{pane_current_path}' -w80% -h80% -E lazygit

      # Toggle popup window with file picker
      bind-key F display-popup -d '#{pane_current_path}' -w80% -h80% -E 'fzf --preview "bat --color=always {}"'

      # Toggle popup terminal
      bind-key T display-popup -d '#{pane_current_path}' -w80% -h80%

      # ============================================
      # Nesting Remote Sessions
      # ============================================

      # Toggle key bindings for nested sessions
      bind -T root F12  \
        set prefix None \;\
        set key-table off \;\
        if -F '#{pane_in_mode}' 'send-keys -X cancel' \;\
        refresh-client -S

      bind -T off F12 \
        set -u prefix \;\
        set -u key-table \;\
        refresh-client -S
    '';
  };
}

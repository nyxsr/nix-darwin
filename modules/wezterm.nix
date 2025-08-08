{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = {}
      local act = wezterm.action

      -- In newer versions of wezterm, use the config_builder which will
      -- help provide clearer error messages
      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      -- Session management helper functions
      local home = wezterm.home_dir
      local session_file = home .. '/.config/wezterm/saved_sessions.txt'

      -- Function to save current session
      local function save_session(window, pane)
        local session_data = ""
        local tabs = window:tabs()

        for _, tab in ipairs(tabs) do
          local panes = tab:panes()
          for _, p in ipairs(panes) do
            local cwd = p:get_current_working_dir()
            if cwd then
              session_data = session_data .. cwd.file_path .. "\n"
            end
          end
        end

        -- Write to file
        local file = io.open(session_file, "w")
        if file then
          file:write(session_data)
          file:close()
          window:toast_notification("WezTerm", "Session saved!", nil, 2000)
        end
      end

      -- Function to restore session
      local function restore_session(window, pane)
        local file = io.open(session_file, "r")
        if file then
          local first = true
          for line in file:lines() do
            if line ~= "" then
              if first then
                -- Use current tab for first directory
                pane:send_text("cd " .. line .. "\n")
                first = false
              else
                -- Create new tabs for additional directories
                window:perform_action(act.SpawnTab 'CurrentPaneDomain', pane)
                window:active_tab():active_pane():send_text("cd " .. line .. "\n")
              end
            end
          end
          file:close()
          window:toast_notification("WezTerm", "Session restored!", nil, 2000)
        else
          window:toast_notification("WezTerm", "No saved session found", nil, 2000)
        end
      end

      -- Color scheme
      config.color_scheme = 'Gruvbox Dark (Gogh)'

      -- Font configuration
      config.font = wezterm.font_with_fallback {
        'Hack Nerd Font',
        'JetBrainsMono Nerd Font',
        'FiraCode Nerd Font',
        'SF Mono',
      }
      config.font_size = 14.0
      config.line_height = 1.2

      -- Window configuration
      config.window_decorations = "RESIZE"
      config.window_background_opacity = 0.95
      config.macos_window_background_blur = 20
      config.window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
      }

      -- Tab bar
      config.enable_tab_bar = true
      config.hide_tab_bar_if_only_one_tab = false
      config.use_fancy_tab_bar = false
      config.tab_bar_at_bottom = false
      config.tab_max_width = 32

      -- Cursor
      config.default_cursor_style = 'BlinkingBar'
      config.cursor_blink_rate = 600
      config.cursor_blink_ease_in = 'Constant'
      config.cursor_blink_ease_out = 'Constant'

      -- Scrollback
      config.scrollback_lines = 10000

      -- Bell
      config.audible_bell = "Disabled"
      config.visual_bell = {
        fade_in_function = 'EaseIn',
        fade_in_duration_ms = 75,
        fade_out_function = 'EaseOut',
        fade_out_duration_ms = 75,
      }

      -- Performance
      config.max_fps = 120
      config.animation_fps = 60
      config.enable_wayland = false

      -- Set default shell to ensure proper PATH
      config.default_prog = { '/bin/zsh', '-l' }

      -- Session persistence
      config.exit_behavior = "CloseOnCleanExit"
      config.exit_behavior_messaging = "Verbose"

      -- Status update interval
      config.status_update_interval = 1000

      -- Key bindings
      config.keys = {
        -- Split panes
        {
          key = 'd',
          mods = 'CMD',
          action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        {
          key = 'd',
          mods = 'CMD|SHIFT',
          action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
        },

        -- Navigate panes (vim-style)
        {
          key = 'h',
          mods = 'CMD|ALT',
          action = wezterm.action.ActivatePaneDirection 'Left',
        },
        {
          key = 'l',
          mods = 'CMD|ALT',
          action = wezterm.action.ActivatePaneDirection 'Right',
        },
        {
          key = 'k',
          mods = 'CMD|ALT',
          action = wezterm.action.ActivatePaneDirection 'Up',
        },
        {
          key = 'j',
          mods = 'CMD|ALT',
          action = wezterm.action.ActivatePaneDirection 'Down',
        },

        -- Resize panes (vim-style)
        {
          key = 'h',
          mods = 'CMD|SHIFT',
          action = wezterm.action.AdjustPaneSize { 'Left', 5 },
        },
        {
          key = 'l',
          mods = 'CMD|SHIFT',
          action = wezterm.action.AdjustPaneSize { 'Right', 5 },
        },
        {
          key = 'k',
          mods = 'CMD|SHIFT',
          action = wezterm.action.AdjustPaneSize { 'Up', 5 },
        },
        {
          key = 'j',
          mods = 'CMD|SHIFT',
          action = wezterm.action.AdjustPaneSize { 'Down', 5 },
        },

        -- Close pane
        {
          key = 'w',
          mods = 'CMD',
          action = wezterm.action.CloseCurrentPane { confirm = true },
        },

        -- Copy mode
        {
          key = 'x',
          mods = 'CMD|SHIFT',
          action = wezterm.action.ActivateCopyMode,
        },

        -- Search
        {
          key = 'f',
          mods = 'CMD|SHIFT',
          action = wezterm.action.Search { CaseSensitiveString = "" },
        },

        -- Clear scrollback
        {
          key = 'k',
          mods = 'CMD',
          action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
        },

        -- Font size
        {
          key = '=',
          mods = 'CMD',
          action = wezterm.action.IncreaseFontSize,
        },
        {
          key = '-',
          mods = 'CMD',
          action = wezterm.action.DecreaseFontSize,
        },
        {
          key = '0',
          mods = 'CMD',
          action = wezterm.action.ResetFontSize,
        },

        -- Toggle fullscreen
        {
          key = 'Enter',
          mods = 'CMD|SHIFT',
          action = wezterm.action.ToggleFullScreen,
        },

        -- Quick select mode (URLs, file paths, etc)
        {
          key = 'u',
          mods = 'CMD|SHIFT',
          action = wezterm.action.QuickSelect,
        },

        -- Show launcher menu
        {
          key = 'l',
          mods = 'CMD|SHIFT',
          action = wezterm.action.ShowLauncher,
        },

        -- Session management
        {
          key = 's',
          mods = 'CMD|SHIFT|ALT',
          action = wezterm.action_callback(save_session),
        },
        {
          key = 'r',
          mods = 'CMD|SHIFT|ALT',
          action = wezterm.action_callback(restore_session),
        },

        -- Workspace management
        {
          key = 'w',
          mods = 'CMD|SHIFT|ALT',
          action = wezterm.action.SwitchToWorkspace {
            name = 'default',
          },
        },
        {
          key = 'n',
          mods = 'CMD|SHIFT|ALT',
          action = wezterm.action.PromptInputLine {
            description = 'Enter workspace name:',
            action = wezterm.action_callback(function(window, pane, line)
              if line then
                window:perform_action(
                  wezterm.action.SwitchToWorkspace {
                    name = line,
                  },
                  pane
                )
              end
            end),
          },
        },
        {
          key = 'l',
          mods = 'CMD|SHIFT|ALT',
          action = wezterm.action.ShowLauncherArgs {
            flags = 'FUZZY|WORKSPACES',
          },
        },
      }

      -- Mouse bindings
      config.mouse_bindings = {
        -- Open links on Cmd+Click
        {
          event = { Up = { streak = 1, button = 'Left' } },
          mods = 'CMD',
          action = wezterm.action.OpenLinkAtMouseCursor,
        },
        -- Paste on right click
        {
          event = { Down = { streak = 1, button = 'Right' } },
          mods = 'NONE',
          action = wezterm.action.PasteFrom 'Clipboard',
        },
      }

      -- Hyperlink rules
      config.hyperlink_rules = wezterm.default_hyperlink_rules()

      -- Add custom hyperlink rule for GitHub issues/PRs
      table.insert(config.hyperlink_rules, {
        regex = [[\b[a-zA-Z0-9._-]+/[a-zA-Z0-9._-]+#[0-9]+\b]],
        format = 'https://github.com/$0',
      })

      -- SSH domains (you can add your SSH hosts here)
      config.ssh_domains = {
        -- Example:
        -- {
        --   name = 'myserver',
        --   remote_address = 'example.com',
        --   username = 'myuser',
        -- },
      }

      -- Launch menu items (using shell to ensure proper PATH)
      config.launch_menu = {
        {
          label = 'btop',
          args = { '/bin/zsh', '-l', '-c', 'btop' },
        },
        {
          label = 'lazygit',
          args = { '/bin/zsh', '-l', '-c', 'lazygit' },
        },
        {
          label = 'k9s',
          args = { '/bin/zsh', '-l', '-c', 'k9s' },
        },
      }

      -- Tab bar colors and style
      config.colors = {
        tab_bar = {
          background = '#1d2021',
          active_tab = {
            bg_color = '#3c3836',
            fg_color = '#ebdbb2',
            intensity = 'Bold',
          },
          inactive_tab = {
            bg_color = '#282828',
            fg_color = '#928374',
          },
          inactive_tab_hover = {
            bg_color = '#3c3836',
            fg_color = '#d5c4a1',
            italic = false,
          },
          new_tab = {
            bg_color = '#282828',
            fg_color = '#928374',
          },
          new_tab_hover = {
            bg_color = '#3c3836',
            fg_color = '#d5c4a1',
            italic = false,
          },
        },
      }

      -- Custom tab title
      wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
        local title = tab.tab_title
        if title and #title > 0 then
          return title
        end

        local pane = tab.active_pane
        title = pane.title

        -- Remove common shell prefixes
        title = title:gsub('^(%S+:)', "")

        -- Truncate if too long
        if #title > max_width - 4 then
          title = wezterm.truncate_right(title, max_width - 4) .. '...'
        end

        return ' ' .. title .. ' '
      end)

      -- Workspace status in tab bar
      wezterm.on('update-status', function(window, pane)
        local workspace = window:active_workspace()
        local workspace_text = 'Workspace: ' .. workspace .. ' '

        window:set_left_status(wezterm.format({
          { Background = { Color = '#3c3836' } },
          { Foreground = { Color = '#ebdbb2' } },
          { Text = ' ' .. workspace_text },
        }))
      end)

      -- Auto-save session on exit
      wezterm.on('window-close-requested', function(window, pane)
        save_session(window, pane)
        return false -- Allow window to close
      end)

      -- Restore previous workspace on startup with auto-restore option
      wezterm.on('gui-startup', function(cmd)
        -- The mux is the multiplexer that manages windows, tabs and panes
        local mux = wezterm.mux

        -- Create a new window with default workspace
        local tab, pane, window = mux.spawn_window(cmd or {})

        -- Auto-restore last session (optional - uncomment to enable)
        -- if you want auto-restore on startup, uncomment the next lines:
        -- wezterm.sleep_ms(100)
        -- restore_session(window, pane)
      end)

      -- Quick session switcher using workspaces
      wezterm.on('update-right-status', function(window, pane)
        -- Show current workspace and number of tabs
        local workspace = window:active_workspace()
        local tabs = window:tabs()
        local tab_count = #tabs

        window:set_right_status(wezterm.format({
          { Background = { Color = '#282828' } },
          { Foreground = { Color = '#928374' } },
          { Text = ' Tabs: ' .. tab_count .. ' ' },
        }))
      end)

      return config
    '';
  };
}

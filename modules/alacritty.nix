{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      # Window configuration
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        decorations = "buttonless";
        opacity = 0.95;
        blur = true;
        option_as_alt = "Both";
        startup_mode = "Windowed";
        dynamic_title = true;
      };

      # Scrolling
      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      # Font configuration
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
        size = 14.0;
        offset = {
          x = 0;
          y = 1;
        };
        glyph_offset = {
          x = 0;
          y = 0;
        };
        builtin_box_drawing = true;
      };

      # Cursor configuration
      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
        vi_mode_style = {
          shape = "Beam";
          blinking = "On";
        };
        blink_interval = 600;
        blink_timeout = 0;
        unfocused_hollow = true;
        thickness = 0.15;
      };

      # Terminal configuration
      terminal = {
        shell = {
          program = "/bin/zsh";
          args = [ "-l" ];
        };
      };

      # Selection
      selection = {
        semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
        save_to_clipboard = true;
      };

      # Mouse
      mouse = {
        hide_when_typing = true;
        bindings = [
          {
            mouse = "Right";
            action = "Paste";
          }
          {
            mouse = "Middle";
            action = "PasteSelection";
          }
        ];
      };

      # Colors (Gruvbox Dark)
      colors = {
        primary = {
          background = "#282828";
          foreground = "#ebdbb2";
          bright_foreground = "#fbf1c7";
          dim_foreground = "#a89984";
        };

        cursor = {
          text = "#282828";
          cursor = "#ebdbb2";
        };

        vi_mode_cursor = {
          text = "#282828";
          cursor = "#b8bb26";
        };

        search = {
          matches = {
            foreground = "#282828";
            background = "#fabd2f";
          };
          focused_match = {
            foreground = "#282828";
            background = "#fe8019";
          };
        };

        hints = {
          start = {
            foreground = "#282828";
            background = "#fabd2f";
          };
          end = {
            foreground = "#282828";
            background = "#8ec07c";
          };
        };

        line_indicator = {
          foreground = "None";
          background = "None";
        };

        footer_bar = {
          foreground = "#ebdbb2";
          background = "#1d2021";
        };

        selection = {
          text = "CellForeground";
          background = "#504945";
        };

        normal = {
          black = "#282828";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };

        bright = {
          black = "#928374";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#ebdbb2";
        };

        dim = {
          black = "#1d2021";
          red = "#9d0006";
          green = "#79740e";
          yellow = "#b57614";
          blue = "#076678";
          magenta = "#8f3f71";
          cyan = "#427b58";
          white = "#928374";
        };
      };

      # Bell
      bell = {
        animation = "EaseOutExpo";
        duration = 100;
        color = "#fabd2f";
        command = "None";
      };

      # Keyboard bindings
      keyboard = {
        bindings = [
          # Application controls
          {
            key = "Q";
            mods = "Command";
            action = "Quit";
          }
          {
            key = "W";
            mods = "Command";
            action = "CloseWindow";
          }
          {
            key = "N";
            mods = "Command";
            action = "CreateNewWindow";
          }
          {
            key = "T";
            mods = "Command";
            action = "CreateNewTab";
          }
          {
            key = "M";
            mods = "Command";
            action = "Minimize";
          }
          {
            key = "H";
            mods = "Command";
            action = "Hide";
          }
          {
            key = "H";
            mods = "Command|Alt";
            action = "HideOtherApplications";
          }

          # Tab management
          {
            key = "Tab";
            mods = "Control";
            action = "SelectNextTab";
          }
          {
            key = "Tab";
            mods = "Control|Shift";
            action = "SelectPreviousTab";
          }
          {
            key = "1";
            mods = "Command";
            action = "SelectTab1";
          }
          {
            key = "2";
            mods = "Command";
            action = "SelectTab2";
          }
          {
            key = "3";
            mods = "Command";
            action = "SelectTab3";
          }
          {
            key = "4";
            mods = "Command";
            action = "SelectTab4";
          }
          {
            key = "5";
            mods = "Command";
            action = "SelectTab5";
          }
          {
            key = "6";
            mods = "Command";
            action = "SelectTab6";
          }
          {
            key = "7";
            mods = "Command";
            action = "SelectTab7";
          }
          {
            key = "8";
            mods = "Command";
            action = "SelectTab8";
          }
          {
            key = "9";
            mods = "Command";
            action = "SelectLastTab";
          }

          # Font size controls
          {
            key = "Plus";
            mods = "Command";
            action = "IncreaseFontSize";
          }
          {
            key = "Equals";
            mods = "Command";
            action = "IncreaseFontSize";
          }
          {
            key = "Minus";
            mods = "Command";
            action = "DecreaseFontSize";
          }
          {
            key = "Key0";
            mods = "Command";
            action = "ResetFontSize";
          }

          # Clipboard
          {
            key = "C";
            mods = "Command";
            action = "Copy";
          }
          {
            key = "V";
            mods = "Command";
            action = "Paste";
          }
          {
            key = "X";
            mods = "Command";
            action = "Cut";
          }
          {
            key = "A";
            mods = "Command";
            action = "SelectAll";
          }

          # Scrolling
          {
            key = "K";
            mods = "Command";
            action = "ClearHistory";
          }
          {
            key = "K";
            mods = "Command";
            chars = "\u000c";
          }
          {
            key = "L";
            mods = "Command";
            action = "ClearLogNotice";
          }
          {
            key = "PageUp";
            mods = "Shift";
            mode = "~Alt";
            action = "ScrollPageUp";
          }
          {
            key = "PageDown";
            mods = "Shift";
            mode = "~Alt";
            action = "ScrollPageDown";
          }
          {
            key = "Home";
            mods = "Shift";
            mode = "~Alt";
            action = "ScrollToTop";
          }
          {
            key = "End";
            mods = "Shift";
            mode = "~Alt";
            action = "ScrollToBottom";
          }
          {
            key = "Up";
            mods = "Command|Shift";
            action = "ScrollLineUp";
          }
          {
            key = "Down";
            mods = "Command|Shift";
            action = "ScrollLineDown";
          }

          # Search
          {
            key = "F";
            mods = "Command";
            action = "SearchForward";
          }
          {
            key = "B";
            mods = "Command";
            action = "SearchBackward";
          }
          {
            key = "F";
            mods = "Command|Shift";
            mode = "~Search";
            action = "SearchForward";
          }
          {
            key = "B";
            mods = "Command|Shift";
            mode = "~Search";
            action = "SearchBackward";
          }

          # Vi Mode
          {
            key = "Space";
            mods = "Control|Shift";
            mode = "~Search";
            action = "ToggleViMode";
          }
          {
            key = "Space";
            mods = "Control|Shift";
            mode = "Vi|~Search";
            action = "ScrollToBottom";
          }
          {
            key = "Escape";
            mode = "Vi|~Search";
            action = "ClearSelection";
          }
          {
            key = "I";
            mode = "Vi|~Search";
            action = "ToggleViMode";
          }
          {
            key = "C";
            mods = "Control";
            mode = "Vi|~Search";
            action = "ToggleViMode";
          }

          # Vi Mode navigation
          {
            key = "H";
            mode = "Vi|~Search";
            action = "Left";
          }
          {
            key = "J";
            mode = "Vi|~Search";
            action = "Down";
          }
          {
            key = "K";
            mode = "Vi|~Search";
            action = "Up";
          }
          {
            key = "L";
            mode = "Vi|~Search";
            action = "Right";
          }
          {
            key = "Up";
            mode = "Vi|~Search";
            action = "Up";
          }
          {
            key = "Down";
            mode = "Vi|~Search";
            action = "Down";
          }
          {
            key = "Left";
            mode = "Vi|~Search";
            action = "Left";
          }
          {
            key = "Right";
            mode = "Vi|~Search";
            action = "Right";
          }
          {
            key = "Key0";
            mode = "Vi|~Search";
            action = "First";
          }
          {
            key = "Key4";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "Last";
          }
          {
            key = "Key6";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "FirstOccupied";
          }
          {
            key = "H";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "High";
          }
          {
            key = "M";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "Middle";
          }
          {
            key = "L";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "Low";
          }
          {
            key = "B";
            mode = "Vi|~Search";
            action = "SemanticLeft";
          }
          {
            key = "W";
            mode = "Vi|~Search";
            action = "SemanticRight";
          }
          {
            key = "E";
            mode = "Vi|~Search";
            action = "SemanticRightEnd";
          }
          {
            key = "B";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "WordLeft";
          }
          {
            key = "W";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "WordRight";
          }
          {
            key = "E";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "WordRightEnd";
          }
          {
            key = "Key5";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "Bracket";
          }
          {
            key = "G";
            mode = "Vi|~Search";
            action = "ScrollToTop";
          }
          {
            key = "G";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "ScrollToBottom";
          }

          # Vi Mode selection
          {
            key = "V";
            mode = "Vi|~Search";
            action = "ToggleNormalSelection";
          }
          {
            key = "V";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "ToggleLineSelection";
          }
          {
            key = "V";
            mods = "Control";
            mode = "Vi|~Search";
            action = "ToggleBlockSelection";
          }
          {
            key = "Return";
            mode = "Vi|~Search";
            action = "Open";
          }
          {
            key = "Y";
            mode = "Vi|~Search";
            action = "Copy";
          }
          {
            key = "Y";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "Copy";
          }
          {
            key = "Slash";
            mode = "Vi|~Search";
            action = "SearchForward";
          }
          {
            key = "Slash";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "SearchBackward";
          }
          {
            key = "N";
            mode = "Vi|~Search";
            action = "SearchNext";
          }
          {
            key = "N";
            mods = "Shift";
            mode = "Vi|~Search";
            action = "SearchPrevious";
          }

          # Fullscreen
          {
            key = "Return";
            mods = "Command|Shift";
            action = "ToggleFullscreen";
          }

          # Debug
          {
            key = "D";
            mods = "Command|Shift";
            action = "Debug";
          }
        ];
      };

      # Hints configuration for URL clicking
      hints = {
        enabled = [
          {
            regex = "(ipfs:|ipns:|magnet:|mailto:|gemini:|gopher:|https:|http:|news:|file:|git:|ssh:|ftp:)[^\\u0000-\\u001F\\u007F-\\u009F<>\"\\\\s{-}\\\\^⟨⟩`]+";
            command = "open";
            post_processing = true;
            mouse = {
              enabled = true;
              mods = "Command";
            };
            binding = {
              key = "U";
              mods = "Command|Shift";
            };
          }
        ];
      };
    };
  };
}

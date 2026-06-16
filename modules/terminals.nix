{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      # Font
      font_family = "IosevkaTerm Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 11;

      # Window / look
      background_opacity = "0.88";
      background_blur = 12;
      dynamic_background_opacity = true;
      window_padding_width = 14;
      placement_strategy = "center";

      # Cursor
      cursor_shape = "beam";
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = 15;

      # Quality of life
      enable_audio_bell = false;
      visual_bell_duration = "0.0";
      confirm_os_window_close = 0;
      remember_window_size = true;
      initial_window_width = 110;
      initial_window_height = 32;

      # Scrollback
      scrollback_lines = 20000;
      wheel_scroll_multiplier = 3;
      touch_scroll_multiplier = 3;

      # Clipboard / selection
      copy_on_select = "clipboard";
      strip_trailing_spaces = "smart";
      select_by_word_characters = "@-./_~?&=%+#:";

      # URLs
      detect_urls = true;
      show_hyperlink_targets = true;
      open_url_with = "default";
      url_style = "curly";

      # Tabs
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{index}: {title}";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";

      # Shell integration
      shell_integration = "enabled";
      allow_remote_control = true;
      listen_on = "unix:/tmp/kitty";
    };

    extraConfig = ''
      include ${config.home.homeDirectory}/.config/kitty/themes/noctalia.conf
    '';

    keybindings = {
      "ctrl+shift+enter" = "new_window";
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+w" = "close_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";

      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";

      "ctrl+shift+plus" = "increase_font_size";
      "ctrl+shift+minus" = "decrease_font_size";
      "ctrl+shift+backspace" = "restore_font_size";

      "ctrl+shift+f" = "show_scrollback";
      "ctrl+shift+u" = "kitten unicode_input";
      "ctrl+shift+e" = "kitten hints";
      "ctrl+shift+o" = "kitten hints --type url --program default";
    };
  };

  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.88;
        padding = {
          x = 14;
          y = 14;
        };
      };

      font = {
        size = 11;

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
      };

      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
      };

      bell = {
        duration = 0;
      };
    };
  };
}

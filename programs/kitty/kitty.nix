{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile  = "Ayaka";

    font = {
      name = "Iosevka Nerd Font";
      size = 11.5;
    };

    settings = {

      # ── Cursor ─────────────────────────────────────────────────────────────
      cursor_beam_thickness = "1";
      cursor_shape      = "underline";

      # ── URLs ───────────────────────────────────────────────────────────────
      url_color   = "#fa89c1";
      url_style   = "curly";
      detect_urls = true;

      # ── Apariencia ─────────────────────────────────────────────────────────
      background_opacity      = "0.75";
      window_padding_width    = 8;
      hide_window_decorations = true;
      disable_ligatures       = "never";
      tab_bar_style           = "powerline";
      active_border_color     = "#a6b7b7";
      inactive_border_color   = "#000000";

      # ── Comportamiento ─────────────────────────────────────────────────────
      enable_audio_bell       = false;
      confirm_os_window_close = 0;
      scrollback_lines        = 10000;
      mouse_hide_wait         = "1.0";

      # ── Rendimiento ────────────────────────────────────────────────────────
      repaint_delay   = 10;
      input_delay     = 3;
      sync_to_monitor = true;
    };

    keybindings = {
      # ── Navegación entre ventanas split ────────────────────────────────────
      "ctrl+left"  = "neighboring_window left";
      "ctrl+right" = "neighboring_window right";
      "ctrl+up"    = "neighboring_window up";
      "ctrl+down"  = "neighboring_window down";

      # ── Buffers de portapapeles ─────────────────────────────────────────────
      "f1" = "copy_to_buffer a";
      "f2" = "paste_from_buffer a";
      "f3" = "copy_to_buffer b";
      "f4" = "paste_from_buffer b";

      # ── Layout y nuevas ventanas ────────────────────────────────────────────
      "ctrl+shift+z"     = "toggle_layout stack";
      "ctrl+shift+enter" = "new_window_with_cwd";
      "ctrl+shift+t"     = "new_tab_with_cwd";
    };
  };
}

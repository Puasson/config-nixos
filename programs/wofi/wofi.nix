{ config, pkgs, lib, ... }:

{
  programs.wofi = {
    enable = true;

    settings = {
      width             = 520;
      height            = 420;
      location          = "center";
      show              = "drun";
      prompt            = "  Buscar...";
      lines             = 0;
      filter_rate       = 100;
      allow_markup      = true;
      no_actions        = true;
      halign            = "fill";
      orientation       = "vertical";
      content_halign    = "fill";
      insensitive       = true;   # Búsqueda sin distinción mayúsculas/minúsculas
      allow_images      = true;   # Muestra íconos de apps
      image_size        = 28;
      gtk_dark          = true;
      dynamic_lines     = false;
      display           = "icons";
      term              = "kitty";
      hide_scroll       = true;
    };

    style = ./style.css;
  };
}

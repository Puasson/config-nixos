{ config, pkgs, lib, ... }:

{
  # ── Tema GTK ─────────────────────────────────────────────────────────────────
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "Reversal-dark";
    };

    cursorTheme = {
      name = "Vimix-cursors";
      size = 24;
    };

    font = {
      name = "Ubuntu Sans";
      size = 11;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  # ── Dark mode ────────────────────────────────────────────────────────────────
  dconf = {
    enable = true;

    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  # ── Tema Qt ──────────────────────────────────────────────────────────────────
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  # ── Variables de entorno ─────────────────────────────────────────────────────
  home.sessionVariables = {
    GTK_THEME = "adw-gtk3-dark";
    QT_STYLE_OVERRIDE = "adwaita-dark";
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
    };
  };
}

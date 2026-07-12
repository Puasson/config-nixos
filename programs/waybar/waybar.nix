{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [{
      layer    = "top";
      position = "top";
      height   = 14;
      margin-top    = 3;
      margin-left   = 6;
      margin-right  = 6;
      spacing       = 2;
      exclusive     = true;

      modules-left   = [ "custom/launcher" "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ "clock" ];
      modules-right  = [ "mpris" "pulseaudio" "network" "cpu" "memory" "tray" "custom/power" ];

      "custom/launcher" = {
        format   = "󱄅";
        on-click = "wofi --show drun --allow-images";
        tooltip  = false;
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        format-icons = {
          "1"     = "󰲠"; "2"  = "󰲢"; "3"  = "󰲤";
          "4"     = "󰲦"; "5"  = "󰲨"; "6"  = "󰲪";
          "7"     = "󰲬"; "8"  = "󰲮"; "9"  = "󰲰";
          "10"    = "󰿬";
          active  = "󰮯";
          urgent  = "󰗖";
          default = "○";
          special = "󰓎";
        };
        on-click       = "activate";
        sort-by-number = true;
        active-only    = false;
      };

      "hyprland/window" = {
        format           = "  {}";
        max-length       = 40;
        separate-outputs = false;
        rewrite = {
          "(.*) — Brave"  = "󰖟  $1";
          "(.*) - VSCode" = "  $1";
          "kitty"         = "  Terminal";
          "Nautilus"      = "  Archivos";
          "OnlyOffice.*"  = "  $0";
        };
      };

      "clock" = {
        format         = "  {:%H:%M}";
        format-alt     = "  {:%A, %d %B %Y}";
        tooltip        = false;
      };

      "mpris" = {
        format        = "{player_icon}  {dynamic}";
        format-paused = "{player_icon}  <i>{dynamic}</i>";
        player-icons = {
          default = "▶";
          mpv     = "🎵";
        };
        status-icons = {
          paused  = "⏸";
          stopped = "⏹";
        };
        dynamic-len    = 24;
        dynamic-order  = [ "title" "artist" "album" ];
        tooltip        = true;
        tooltip-format = "{title} — {artist}\n{album}";
        on-click       = "playerctl play-pause";
        on-click-right = "playerctl next";
        max-length     = 30;
      };

      "pulseaudio" = {
        format       = "{icon}  {volume}%";
        format-muted = "󰝟  Silenciado";
        format-icons = {
          default   = [ "󰕿" "󰖀" "󰕾" ];
          headphone = "󰋋";
          headset   = "󰋎";
        };
        on-click       = "pavucontrol";
        on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        scroll-step    = 5;
        tooltip        = false;
      };

      "network" = {
        format-wifi         = "󰤨  {signalStrength}%";
        format-ethernet     = "󰈀  Conectado";
        format-linked       = "󰤭  Sin IP";
        format-disconnected = "󰤮  Desconectado";
        format-alt          = "󰩟  {ipaddr}";
        on-click-right      = "nm-connection-editor";
        tooltip-format      = "󰤨 {essid} ({signalStrength}%)\n󰩟 {ipaddr}/{cidr}\n󰕒 ↑{bandwidthUpBits}  󰇚 ↓{bandwidthDownBits}";
      };

      "cpu" = {
        format         = "󰻠  {usage}%";
        interval       = 2;
        tooltip        = true;
        tooltip-format = "CPU: {usage}%\nFreq: {avg_frequency} GHz";
      };

      "memory" = {
        format         = "󰍛  {percentage}%";
        interval       = 5;
        tooltip-format = "RAM: {used:0.1f}G / {total:0.1f}G\nSwap: {swapUsed:0.1f}G / {swapTotal:0.1f}G";
      };

      "tray" = {
        spacing          = 6;
        icon-size        = 14;
        show-passive-items = true;
      };

      "custom/power" = {
        format   = "⏻";
        on-click = "wlogout -p layer-shell";
        tooltip  = false;
      };
    }];

    style = ./style.css;
  };
}

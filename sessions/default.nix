{ config, pkgs, lib, ... }:

{
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;

  home.file.".config/hypr/wallpaper.sh" = { 
     executable = true;
     source = ./scripts/wallpaper.sh;
  };
}


{ config, pkgs, lib, ... }:

{
  imports = [
     ./programs/kitty/kitty.nix
     ./programs/waybar/waybar.nix
     ./programs/wofi/wofi.nix 
     ./themes/gtk.nix
     ./sessions/default.nix
     ./sessions/hypridle.nix
     ./programs/fastfetch/fastfetch.nix
     ./programs/mpv/mpv.nix
     ./programs/swaync/swaync.nix
     ./shell/bash.nix
  ];

  home = {
    username      = "edu";
    homeDirectory = "/home/edu";
    stateVersion  = "26.05";
  };

  home.packages = with pkgs; [
   # browser
   brave
   # media
   swayimg
   gimp
   audacity
   tauon
   pinta
   # office
   papers
   onlyoffice-desktopeditors
   img2pdf
   # code
   vscode
   nixd
   nil
   python314
   git
   # tools
   oh-my-posh
   btop
   nautilus
   unzip
   yazi
   # hyprland
   ffmpegthumbnailer
   pavucontrol
   playerctl
   grim
   wlogout
   networkmanagerapplet
   awww
   hypridle
   # GTK and QT
   qt6.qtwayland
   qt5.qtwayland

   # neovim
   neovim
   gcc
   fd
   ripgrep
   fzf
   tree-sitter
   lua-language-server
   stylua
  ];
  services.ssh-agent.enable = true;
}

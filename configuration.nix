{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
     
    plymouth.enable = true;
    kernelParams = [
      "quiet"
      "splash"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  hardware.graphics.enable = true;

  networking = {
       hostName = "nixos";
       networkmanager.enable = true;
       firewall = {
           enable = true;
           logReversePathDrops = true;
       };
  };

  time.timeZone = "America/Lima";
  i18n.defaultLocale = "es_PE.UTF-8";

  services = {
    displayManager ={
           sddm = {
             enable = true;
             wayland.enable = true;
             theme = "catppuccin-mocha-mauve";
           };
           autoLogin = {
              enable = true;
              user = "edu";
           };
       
      };
      pipewire = {
           enable = true;
           alsa.enable = true;
           alsa.support32Bit = true;
           pulse.enable = true;
      };
  };
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.gvfs.enable = true;

  console.keyMap = "la-latin1";

  programs.hyprland = {
     enable = true;
     withUWSM = true;
     xwayland.enable = true;
  };

  users.users.edu = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
  };
  
  environment.systemPackages = with pkgs; [
  inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    wget
    udiskie
    tree 
    # Theme and Icons
    adw-gtk3
    reversal-icon-theme
    vimix-cursors
    catppuccin-sddm
  ];

  fonts.packages = with pkgs; [
       inter
       ubuntu-sans
       nerd-fonts.fira-code
       nerd-fonts.iosevka
  ];

  nix = {
     settings.auto-optimise-store = true;
     gc ={
         automatic = true;
         dates     = "weekly";
         options   = "--delete-older-than 7d";
     };
  };

  programs.nix-ld.enable = true;

  programs.appimage = {
       enable = true;
        binfmt = true;
  };

  nixpkgs.config.allowUnfree = true;

  services.avahi = {
      enable = true;
      nssmdns4 =true;
      openFirewall = true;
    };
 
  
  fileSystems."/mnt/Datos" = {
      device = "/dev/disk/by-uuid/4673cfcb-5a1f-4c5f-ba9e-6284325aefc1";
      fsType = "ext4";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05"; 
}


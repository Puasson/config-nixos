{ config, pkgs, ...}:

{
 programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    useTheme = "spaceship";
  };

 programs.bash = {
    enable = true;
    shellAliases = {
      "station" = "cd /mnt/Datos/Workstation";
      "img" = "kitten icat";
       ".." = "cd ..";
       datos = "cd /mnt/Datos";
       nrs   = "sudo nixos-rebuild switch --flake $HOME/nixos#nixos";
       dellete = "sudo nix-collect-garbage -d";
       update = "nix flake update $HOME/nixos";
    };

    profileExtra = ''
       if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
           exec uwsm start -S hyprland-uwsm.desktop      
       fi
    '';
  };
}
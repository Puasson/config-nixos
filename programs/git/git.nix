{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
  };

  services.ssh-agent.enable = true;
}

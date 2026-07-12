{ pkgs, ... }:

{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        after_sleep_cmd   = "hyprctl dispatch dpms on";   # Enciende monitores al despertar
        ignore_dbus_inhibit = false;   # Respeta inhibidores (ej: video en curso)
      };

      listener = [
        {
          timeout    = 900;   # 15 min
          on-timeout = "hyprctl dispatch dpms off";
          on-resume  = "hyprctl dispatch dpms on";
        }

        {
          timeout    = 1200;  # 20 min
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}

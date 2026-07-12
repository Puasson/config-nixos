{ ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      logo = {
        source = "$HOME/nixos/programs/fastfetch/logos/jean-eula.png";
        type = "kitty";
        width = 30;
        padding = {
          top = 0;
          left = 2;
        };
      };

      display = {
        separator = " - ";
      };

      modules = [
        {
          type = "custom";
          format = "{#90}  {#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37}  {#38}  {#39} ";
        }

        "break"

        {
          type = "os";
          key = " OS";
          keyColor = "yellow";
        }
        {
          type = "kernel";
          key = " ├";
          keyColor = "yellow";
        }
        {
          type = "packages";
          key = " ├󰏖";
          keyColor = "yellow";
        }
        {
          type = "shell";
          key = " └";
          keyColor = "yellow";
        }

        {
          type = "de";
          key = " DE";
          keyColor = "blue";
        }
        {
          type = "wm";
          key = " ├";
          keyColor = "blue";
        }
        {
          type = "lm";
          key = " ├󰧨";
          keyColor = "blue";
        }
        {
          type = "wmtheme";
          key = " ├󰉼";
          keyColor = "blue";
        }
        {
          type = "icons";
          key = " ├󰀻";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = " ├";
          keyColor = "blue";
        }
        {
          type = "wallpaper";
          key = " └󰸉";
          keyColor = "blue";
        }

        "break"

        {
          type = "host";
          key = " PC";
          keyColor = "green";
        }
        {
          type = "cpu";
          key = " ├";
          keyColor = "green";
        }
        {
          type = "disk";
          key = " ├";
          keyColor = "green";
        }
        {
          type = "memory";
          key = " ├󰑭";
          keyColor = "green";
        }
        {
          type = "swap";
          key = " ├󰓡";
          keyColor = "green";
        }
        {
          type = "uptime";
          key = " ├󰅐";
          keyColor = "green";
        }
        {
          type = "display";
          key = " └󰍹";
          keyColor = "green";
        }

        "break"

        {
          type = "custom";
          format = "{#90}  {#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37}  {#38}  {#39} ";
        }
      ];
    };
  };
}

{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    
    config = {
      border = false;   
      keep-open = "yes";          
      snap-window = true;     
      cursor-autohide = 1000;   

      vo = "gpu-next";            
      hwdec = "auto-safe";    
      gpu-context = "auto";

      slang = "es,en";          
      alang = "ja,en,es";       
      sub-auto = "fuzzy"; 
      
      sub-font = "Sans Serif";
      sub-font-size = 40;
      sub-color = "#FFFFFF";
      sub-border-size = 2;
      sub-border-color = "#000000";
      sub-shadow-offset = 0;
    };

    bindings = {
      "l" = "seek 5";
      "h" = "seek -5";
      "j" = "seek -60";
      "k" = "seek 60";
      
      "LEFT"  = "seek -5";
      "RIGHT" = "seek 5";
      "UP"    = "add volume 2";
      "DOWN"  = "add volume -2";
    };

    scripts = with pkgs.mpvScripts; [
      mpris     
      uosc
    ];
  };
}

{ pkgs, config, ...}:

{
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    settings = {
      color_theme = "catppuccin_mocha";
      theme_background = false;
      update_ms = 1000;
      selected_battery = "Auto";
    };
  };
}

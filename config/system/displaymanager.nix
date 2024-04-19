{ pkgs, config, host, ... }:

let inherit (import ../../hosts/${host}/options.nix) theKBDVariant
theKBDLayout theSecondKBDLayout; in
{
  services.xserver = {
    enable = true;
    xkb = {
      variant = "${theKBDVariant}";
      layout = "${theKBDLayout}, ${theSecondKBDLayout}";
    };
    libinput.enable = true;
  };

  services.displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      #theme = "tokyo-night-sddm";
      theme = "catppuccin-mocha";
  };


  environment.systemPackages =
  let
    sddm-catppuccin = pkgs.callPackage ../pkgs/sddm-catppuccin.nix {};
    sugar = pkgs.callPackage ../pkgs/sddm-sugar-dark.nix {};
    tokyo-night = pkgs.libsForQt5.callPackage ../pkgs/sddm-tokyo-night.nix {};
in [ 
    sugar.sddm-sugar-dark # Name: sugar-dark
    tokyo-night # Name: tokyo-night-sddm
    sddm-catppuccin
    pkgs.libsForQt5.qt5.qtgraphicaleffects
    pkgs.qt6.full
  ];
}

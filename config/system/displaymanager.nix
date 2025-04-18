{ pkgs,  host, ... }:

let inherit (import ../../hosts/${host}/options.nix) theKBDVariant
theKBDLayout theSecondKBDLayout; in
{
  services.xserver = {
    enable = true;
    xkb = {
      variant = "${theKBDVariant}";
      layout = "${theKBDLayout}, ${theSecondKBDLayout}";
    };
  };
  services.libinput.enable = true;

  services.displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      theme = "tokyo-night-sddm";
  };

  environment.systemPackages =
  let
    sugar = pkgs.callPackage ../pkgs/sddm-sugar-dark.nix {};
    tokyo-night = pkgs.libsForQt5.callPackage ../pkgs/sddm-tokyo-night.nix {};
in [ 
    sugar.sddm-sugar-dark # Name: sugar-dark
    tokyo-night # Name: tokyo-night-sddm
    pkgs.libsForQt5.qt5.qtgraphicaleffects
    pkgs.qt6.full
    pkgs.qt6.qtsvg
  ];
}

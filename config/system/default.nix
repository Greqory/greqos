{ config, pkgs, ... }:

{
  imports = [
    ./amd-gpu.nix
    ./appimages.nix
    ./autorun.nix
    ./boot.nix
    ./displaymanager.nix
    ./flatpak.nix
    ./hwclock.nix
    ./intel-amd.nix
    ./intel-gpu.nix
    ./intel-nvidia.nix
    ./kernel.nix
    ./logitech.nix
    ./nfs.nix
    ./ntp.nix
    ./nvidia.nix
    ./packages.nix
    ./polkit.nix
    ./printer.nix
    ./services.nix
    ./steam.nix
    ./power.nix
    ./vm.nix
  ];
}

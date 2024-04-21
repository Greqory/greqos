{ pkgs, config, ... }:

{
  imports = [
    # Enable &/ Configure Programs
    ./alacritty.nix
    ./gtk-qt.nix
    ./hyprland.nix
    ./neofetch.nix
    ./neovim.nix
    ./packages.nix
    ./rofi.nix
    ./starship.nix
    ./waybar.nix
    ./wlogout.nix
    ./swappy.nix
    ./swaylock.nix
    ./swaync.nix
    ./zeroad.nix
    ./zsh.nix

    # Place Home Files Like Pictures
    ./files.nix
  ];
  programs.home-manager.enable = true;
}

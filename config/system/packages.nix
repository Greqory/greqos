{ pkgs, config, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List System Programs
  environment.systemPackages = with pkgs; [
    wget curl git cmatrix lolcat neofetch htop btop libvirt
    polkit_gnome lm_sensors unzip unrar libnotify eza
    v4l-utils ydotool wl-clipboard socat cowsay lsd lshw
    pkg-config meson hugo gnumake ninja go nodejs symbola
    noto-fonts-color-emoji material-icons brightnessctl
    toybox virt-viewer swappy ripgrep appimage-run 
    networkmanagerapplet yad playerctl nh
    # own packages:
    geekbench powertop undervolt vscode gh tmux fzf tldr bat intel-gpu-tools
    android-tools zoxide yazi libreoffice-qt
    nmap qtcreator obsidian docker ansible
    modemmanager remmina cmake fd
    home-manager  
    #linuxKernel.packages.linux_xanmod_latest.phc-intel

  ];

  programs = {
    steam.gamescopeSession.enable = true;
    dconf.enable = true;
    seahorse.enable=true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    virt-manager.enable = true;
  };

  virtualisation.libvirtd.enable = true;
}

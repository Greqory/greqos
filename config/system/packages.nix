{ pkgs,  inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List System Programs
  environment.systemPackages = with pkgs; [
    wget curl git cmatrix lolcat btop libvirt
    polkit_gnome lm_sensors unzip unrar libnotify eza
    v4l-utils ydotool wl-clipboard socat cowsay lsd lshw
    pkg-config meson hugo gnumake ninja go nodejs 
    noto-fonts-color-emoji material-icons brightnessctl
    toybox virt-viewer swappy ripgrep appimage-run 
    networkmanagerapplet yad playerctl nh
    # own packages:
    geekbench powertop undervolt vscode gh tmux fzf tldr bat intel-gpu-tools
    ncdu fastfetch vivaldi zed ghostty
    android-tools zoxide yazi libreoffice-qt
    nmap obsidian docker ansible
    modemmanager remmina cmake fd
    telegram-desktop home-manager  ungoogled-chromium
    rustc rustscan rustcat gcc elf2uf2-rs glibc glib glibc_multi gdb 
    python312Packages.pyserial picocom
    doxygen gccMultiStdenv openocd
    gcc_multi gcc-arm-embedded libgcc mkspiffs-presets.esp-idf esptool qemu newlib binutils
    dbus c-periphery python3Full gob2 python311Packages.pygobject3 gobject-introspection python311Packages.wheel
    pipx
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

  # Docker Settings:
  virtualisation.docker.enable = true;
  #virtualisation.docker.storageDriver = "btrfs";
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}

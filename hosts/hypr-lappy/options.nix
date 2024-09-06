let
  setUsername = "greg";
  setHostname = "hypr-lappy";

in {
  username = "${setUsername}";
  hostname = "${setHostname}";
  userHome = "/home/${setUsername}";
  flakeDir = "/home/${setUsername}/greqos";
  wallpaperGit = "https://github.com/Greqory/Wallpapers"; # Can be changed IF you know what your doing
  wallpaperDir = "/home/${setUsername}/Pictures/Wallpapers";
  screenshotDir = "/home/${setUsername}/Pictures/Screenshots";
  flakePrev = "/home/${setUsername}/.greqos-previous";
  flakeBackup = "/home/${setUsername}/.greqos-backup";


  # Git
  gitUsername = "Greqory";
  gitEmail = "gregor.thume@gmail.com";

  # Base16 Theme
  theme = "catppuccin-mocha";

  # Waybar Settings
  waybarAnim = true; # Enable / Disable Waybar Animation CSS
  bar-number = true; # Enable / Disable Workspace Numbers In Waybar

  # Hyprland Settings
  #slickbar = true;
  borderAnim = true;

  # Default Programs
  browser = "brave";
  terminal = "alacritty";
  flatpak = true;
  enableZeroAD = false;
  
  # Enable Support For
  # Logitech Devices
  logitech = true;

  # System Settings
  clock24h = true;
  theLocale = "en_US.UTF-8";
  theKBDLayout = "de";
  theSecondKBDLayout = "";
  theKBDVariant = ""; 
  theLCVariables = "de_DE.UTF-8";
  theTimezone = "Europe/Berlin";
  theShell = "zsh";
  theKernel = "zen";
  # theKernel = "xanmod"; # possible options: default, latest, lqx, xanmod, zen
  sdl-videodriver = "wayland"; # Either x11 or wayland ONLY. Games might require x11 set here
  # For Hybrid Systems intel-nvidia
  # Should Be Used As gpuType
  cpuType = "intel";
  gpuType = "intel";

  # Nvidia Hybrid Devices
  # ONLY NEEDED FOR HYBRID
  # SYSTEMS! 
  intel-bus-id = "PCI:0:2:0";
  nvidia-bus-id = "PCI:1:0:0";

  # Enable / Setup NFS
  nfs = false;
  nfsMountPoint = "/mnt/nas";
  nfsDevice = "nas:/volume1/nas";

  # Printer, NTP, HWClock Settings
  localHWClock = false;
  ntp = true;
  printer = false;

  # Enable Terminals
  # If You Disable All You Get Kitty
  wezterm = false;
  alacritty = true;
  kitty = false;


  powerOptimization = true;
}

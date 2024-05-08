{ pkgs, config, lib, host, ... }:

let inherit (import ../../hosts/${host}/options.nix) powerOptimization; in
lib.mkIf (powerOptimization == true) {

    # undervolting services:
    services.undervolt = {   
        enable = true;
        coreOffset = -100;
        uncoreOffset = -100;
        analogioOffset = -100;
        gpuOffset = -100;
        #temp = 90;
        #p1.limit = 60;
        #p1.window = 99;
        #p2.limit = 60;
        #p2.window = 999;
        useTimer = true;
    };

    # Laptop Power settings:
    services.tlp = {
        enable = true;
        settings = {
            CPU_SCALING_GOVERNOR_ON_AC = "performance";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
            CPU_ENERGY_PERF_POLICY_ON_AC = "";
            CPU_MIN_PERF_ON_AC = 0;
            CPU_MAX_PERF_ON_AC = 100;
            CPU_MIN_PERF_ON_BAT = 0;
            CPU_MAX_PERF_ON_BAT = 20;

            #Optional helps save long term battery health
            #START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
            #STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
        };
    };

    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
        battery = {
            governor = "powersave";
            turbo = "never";
        };
        charger = {
            governor = "performance";
            turbo = "auto";
        };
    };

    # enable powertop:
    powerManagement.powertop.enable = true;
}

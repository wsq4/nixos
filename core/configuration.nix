{ config, lib, pkgs, ... }: {
  imports = [ 
    ./hardware-configuration.nix
    ./software.nix
    ./autologin.nix
    ./nfs.nix
    ./sshd.nix
    ./docker.nix
    ./obs.nix
  ];

  nixpkgs = { config = { allowUnfree = true; }; };

  security.sudo.extraRules = [{
    users = [ "wsq" ];

    commands = [{
      command = "ALL";
      options = [ "NOPASSWD" ];
    }];
  }];

  services.xserver.videoDrivers = [ "nvidia" ];

  nix = {
    settings = {
      substituters = [
        "https://mirrors.nju.edu.cn/nix-channels/store"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      ];
      experimental-features = [ "nix-command" "flakes" ];
      nix-path = config.nix.nixPath;
    };
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = lib.mkForce 3;
    };
   blacklistedKernelModules = [ "nouveau" ];
    initrd.kernelModules = 
     [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  };

  users.users = {
    wsq = {
      isNormalUser = true;
      extraGroups = [ "wheel" "kvm" "adbusers" ];
    };
  };

  hardware.graphics = { enable = true; enable32Bit = true; };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  
  programs.hyprland.enable = true;
  services.openssh.enable = true;
  services.qemuGuest.enable = true;

  networking.hostName = "wsq-Linux";
  time.timeZone = "Asia/Hong_Kong";
  i18n.defaultLocale = "en_HK.UTF-8";
  i18n.inputMethod.fcitx5.waylandFrontend = true;
  system.stateVersion = "24.05";

  environment.sessionVariables.NIXOS_OZONE_WL = "1";


  programs.adb.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 5901 ];
  };
    
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}";
    ISOLATE_CONFIG_FILE="/etc/isolate.conf";
   };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

}

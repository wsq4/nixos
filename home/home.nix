{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./software.nix
    ./waybar.nix
    ./bash.nix
    ./vscode.nix
    ./nvim.nix
    ./alacritty.nix
    ./fcitx5.nix
    ./dunst.nix
    ./obs.nix
  ];

  home = {
    username = "wsq";
    homeDirectory = "/home/wsq";
  };
  
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  
  programs.git = {
    enable = true;
    userName = "Siqi Wang";
    userEmail = "siqi_wang@smail.nju.edu.cn";
  };

  programs.home-manager.enable = true;
  programs.fish.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "24.05";
}

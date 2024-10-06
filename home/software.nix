{ pkgs, ... }: { home.packages = with pkgs; [
  nur.repos.linyinfeng.wemeet
  
  v4l-utils

  fastfetch

  zip
  unzip
  xz
  p7zip

  firefox
  google-chrome
  microsoft-edge-dev
  alacritty
  vscode
  thunderbird
  calibre
  gimp
  appimage-run
  ffmpeg
  vlc

  wofi
  wofi-pass
  waybar
  hyprpaper

  font-awesome
  wayvnc
  wf-recorder
  slurp
  wayshot

#  jetbrains.clion
  jetbrains.rider
#  jetbrains.rust-rover
  jetbrains.idea-ultimate
#  jetbrains.datagrip
  
  gdb
  flex
  bison

  libreoffice-qt6-fresh
  qq

  vistafonts-chs

  android-studio

  nodejs
  dotnet-sdk_8

  tinyproxy

  (pkgs.python3.withPackages (python-pkgs: [
    # select Python packages here
    python-pkgs.pandas
    python-pkgs.requests
  ]))

 ]; }

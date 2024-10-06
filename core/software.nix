{ pkgs, ... }: with pkgs; {
  environment.systemPackages = [
    neovim
    fish
    alacritty
    git
    iputils
    dnsutils
    tree
    btrfs-progs
    dnsutils
    python3
    gnat14
    graalvm-ce
    typst
    wget
    curl
    pciutils
    usbutils
    openssl
    nodejs
    gnumake
    isolate
    busybox
    dotnet-sdk_8
    postgresql
    libcap
    pavucontrol
  ];
}

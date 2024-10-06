{ pkgs, ... }: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        rime-data
        fcitx5-gtk
        fcitx5-rime
        libsForQt5.fcitx5-configtool
        libsForQt5.fcitx5-qt
        fcitx5-chinese-addons
      ];
    };
  };

  xdg.configFile = {
    "fcitx5/profile" = {
      source = ./rime/fcitx5-profile;
      force = true;
    };
  };

  home.file.".local/share/fcitx5/rime/double_pinyin_flypy.schema.yaml" = {
    source = ./rime/double_pinyin_flypy.schema.yaml;
  };
  home.file.".local/share/fcitx5/rime/double_pinyin_flypy.custom.yaml" = {
    source = ./rime/double_pinyin_flypy.custom.yaml;
  };
  home.file.".local/share/fcitx5/rime/default.custom.yaml" = {
    source = ./rime/default.custom.yaml;
  };
}

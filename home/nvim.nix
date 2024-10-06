{...}: {
    programs.neovim = {
        defaultEditor = true;
        enable = true;
        extraConfig = ''
          se nu
          se ai
          se ts=4
          se sw=4
          se mouse=a
          se et
        '';
    };
}
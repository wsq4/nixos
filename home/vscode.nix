{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      brettm12345.nixfmt-vscode
      ms-vscode.cpptools
      ms-python.python
      vscjava.vscode-java-pack
      formulahendry.code-runner
      rust-lang.rust-analyzer
      ms-vscode.hexeditor
      tomoki1207.pdf
      nvarner.typst-lsp
      myriad-dreamin.tinymist
      github.copilot
    ];
  };
}
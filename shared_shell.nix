{ pkgs }: {
  buildInputs = with pkgs; [
    alejandra
    rnix-lsp
    stylua
    sumneko-lua-language-server
  ];
}

with builtins;
  pkgs: let
    fontPackages = (import ./fonts.nix).packages pkgs;
  in
    with pkgs; {
      tui = [
        atool
        bandwhich
        du-dust
        fd
        neofetch
        procs
        ripgrep
        #ripgrep-all
        tokei
        watchexec

        # javascript
        vscode-langservers-extracted

        # nix
        alejandra
        nixd
        nurl

        # lua
        lua-language-server

        # rust
        rustup
        cargo-watch
        cargo-outdated
        cargo-feature

        mob
      ];
      gui = concatLists [
        fontPackages
        [
          anki
          gh-markdown-preview
          gimp
          imv
          inkscape
          pavucontrol
          tor-browser-bundle-bin
          transmission-gtk
          vlc
          wl-clipboard
          wl-color-picker
          xdg-utils
        ]
      ];
    }

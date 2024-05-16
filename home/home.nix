{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit
    (builtins)
    readDir
    ;

  inherit
    (lib)
    attrNames
    mkIf
    mkOption
    types
    ;

  username = "mightyiam";
  userAndHome.config = mkIf (!config.isNixOnDroid) {
    home.username = username;
    home.homeDirectory = "/home/${username}";
  };
  modules = let
    dir = "${../.}/home/modules";
    relativePaths = attrNames (readDir dir);
  in
    map (path: "${dir}/${path}") relativePaths;
  always = {
    imports = modules;

    config.programs.home-manager.enable = true;

    config.home.stateVersion = "21.05";
    config.home.sessionVariables.TZ = "\$(<~/.config/timezone)";
  };
in {
  options.gui.enable = mkOption {
    type = types.bool;
    default = true;
  };

  options.location.latitude = mkOption {
    type = types.numbers.between (-90) 90;
  };

  options.location.longitude = mkOption {
    type = types.numbers.between (-180) 180;
  };

  options.isNixOnDroid = mkOption {
    type = types.bool;
    default = false;
  };

  options.style.windowOpacity = mkOption {
    type = types.numbers.between 0 1.0;
    default = 1.0;
  };

  options.style.bellColor = mkOption {
    type = types.str;
    default = "#000000";
  };

  options.style.bellDuration = mkOption {
    type = types.numbers.between 0 1000;
    default = 200.0;
  };

  options.gui.fonts.packages = mkOption {
    type = types.listOf types.package;
    default = with pkgs; [
      open-dyslexic
      (nerdfonts.override {fonts = ["OpenDyslexic"];})
      font-awesome
      noto-fonts
      noto-fonts-emoji
    ];
  };

  options.gui.fonts.default.family = mkOption {
    type = types.str;
    default = "sans-serif";
  };

  options.gui.fonts.default.size = mkOption {
    type = types.float;
    default = 10.0;
  };

  options.gui.fonts.monospace.family = mkOption {
    type = types.str;
    default = "monospace";
  };

  options.gui.fonts.monospace.size = mkOption {
    type = types.float;
    default = 10.0;
  };

  options.gui.fonts.aliases = mkOption {
    type = types.listOf (types.submodule {
      options.family = mkOption {
        type = types.str;
      };

      options.prefer = mkOption {
        type = types.listOf types.str;
      };
    });

    default = [
      {
        family = "monospace";
        prefer = [
          "OpenDyslexicM Nerd Font Mono"
          "Noto Color Emoji"
        ];
      }
      {
        family = "sans-serif";
        prefer = [
          "OpenDyslexic"
        ];
      }
      {
        family = "serif";
        prefer = [
          "OpenDyslexic"
        ];
      }
    ];
  };

  imports = [always userAndHome];
}

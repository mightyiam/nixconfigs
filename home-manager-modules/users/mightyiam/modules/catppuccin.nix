{ self, ... }:
{
  imports = [ self.inputs.catppuccin.homeManagerModules.catppuccin ];
  catppuccin.flavor = "mocha";
  catppuccin.enable = true;
  catppuccin.pointerCursor.enable = true;

  # IFD
  programs.swaylock.catppuccin.enable = false;
  services.mako.catppuccin.enable = false;

  programs.chromium.extensions = [ { id = "bkkmolkhemgaeaeggcmfbghljjjoofoh"; } ];
  gtk.gtk2.extraConfig = ''
    gtk-theme-name="Adwaita-dark"
  '';
  gtk.gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
  gtk.gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
}

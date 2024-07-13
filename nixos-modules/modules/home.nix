{self, ...}: {
  imports = [self.inputs.home-manager.nixosModules.home-manager];
  home-manager.useGlobalPkgs = true;
  home-manager.users.mightyiam.imports = [
    ../../home-manager-modules/users/mightyiam
    ({osConfig, ...}: {home.stateVersion = osConfig.system.stateVersion;})
  ];
  home-manager.extraSpecialArgs = {inherit self;};
}

{
  imports = [
    ../../nixos-modules/types/desktop.nix
    ./mobo.nix
    ./gpu.nix
    ./cpu.nix
    ./state-version.nix
  ];

  networking.hostName = "termitomyces";
  networking.hostId = "6b5dea2a";
}

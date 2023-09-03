instance: let
in {
  services.batsignal.enable = true;
  services.batsignal.extraArgs = [
    "-w"
    "85"
  ];
}


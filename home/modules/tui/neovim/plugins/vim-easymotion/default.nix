{...}: let
  keyboard = import ../../../../keyboard.nix;
in
  "
local easy_motion = \"${keyboard.easyMotion}\"
" ++ readFile ./config.lua

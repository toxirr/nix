{
  inputs,
  lib,
  config,
  ...
}:
{
  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {

        substituters = [
          "https://mirror.sjtu.edu.cn/nix-channels/store?priority=1" # Shanghai Jiao Tong University - best for Asia
          "https://mirrors.ustc.edu.cn/nix-channels/store?priority=2" # USTC backup mirror
          "https://cache.xinux.uz?priority=3" # Uzbek Xinux mirror
          "https://nix-community.cachix.org?priority=4" # Community packages
          "https://cache.nixos.org?priority=5" # Official global cache
        ];
        http-connections = 128;
        max-substitution-jobs = 128;
        max-jobs = "auto";
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
        ];
      };
      # Opinionated: disable channels
      channel.enable = false;

      # Opinionated: make flake registry and nix path match flake inputs
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };
}

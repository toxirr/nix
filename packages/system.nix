{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  nixpkgs-unstable = import inputs.nixpkgs-unstable { inherit system; };
in
{
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    alacritty
    ayugram-desktop
    zed-editor
    element-desktop
    zmk-studio
    zsh
    eza
    direnv
    docker
  ]
  ++(with nixpkgs-unstable;
    [
     flameshot
    ]
  );
}

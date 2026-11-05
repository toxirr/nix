{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  nixpkgs-unstable = import inputs.nixpkgs-unstable { inherit system; };
in
{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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

{ pkgs,... }:
with pkgs; [
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

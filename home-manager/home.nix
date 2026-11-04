{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../modules/git.nix
    ../modules/zed
    ../modules/lazygit.nix
    ../modules/zsh.nix
    ../modules/brave.nix
    ../modules/firefox.nix
    ../modules/additions.nix
  ];
  home.stateVersion = "26.05";
}

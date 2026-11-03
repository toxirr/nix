{ ... }:
{
  imports = [
    ./modules/git.nix
    ./modules/zed
    ./modules/lazygit.nix
    ./modules/zsh.nix
  ];
	home.stateVersion = "26.05";
}

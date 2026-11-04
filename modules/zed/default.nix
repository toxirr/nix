{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;

    package = pkgs.zed-editor;
    userKeymaps = import ./keymaps.nix {};

    userSettings = import ./settings.nix {};

    extraPackages = with pkgs; [
      biome
      nodejs
      cargo-toml-lint
    ];

    extensions = [
      "zig"
      "material-icon-theme"
      "toml"
      "biome"
      "nix"
      "make"
      "env"
      "git-firefly"
      "direnv"
    ];
  };
}

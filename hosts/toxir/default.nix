{
  nixpkgs,
  home-manager,
  ...
}:
{
  nixpkgs.lib.nixosSystem {
   specialArgs = {
    inherit inputs;
   };
   modules = [
     ./conf
   ];
  }
}

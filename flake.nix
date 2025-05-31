{
  description = "Home Manager configurations";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    unstable = nixpkgs-unstable.legacyPackages.${system};

    # Customized username
    user = "jsc";
    work_user = "jchauhan";

    # Generate home-manager config names
    cfgs =
      {
        "${user}@rocinante" = true;
        "${work_user}@jaspal-virt" = true;
        "${work_user}@jaspals-thinkpad" = true;
      }
      // builtins.listToAttrs (
        builtins.genList (i: {
          name = "root@jcvirt" + toString (i + 1);
          value = true;
        })
        7
      );

    mkHomeCfg = {name, ...}: let
      username = builtins.head (builtins.match "(.+)@.+" name);
      host = let
        hostname = builtins.head (builtins.match ".+@(.+)" name);
      in
        if builtins.match "^jcvirt[0-9]+$" hostname != null
        then "jcvirt"
        else hostname;
    in
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          # Essentially like a "home.nix", but customized per user/host
          rec {
            config = {
              # Don't change this value
              home.stateVersion = "24.11"; # Please read the comment before changing.

              home.username = username;
              home.homeDirectory =
                if builtins.match "root" username != null
                then "/root"
                else "/home/${username}";

              programs.home-manager.enable = true;
            };

            options = import ./options.nix {inherit config pkgs;};

            imports = [
              ./common.nix
              ./hosts/${host}.nix
            ];
          }
        ];
        extraSpecialArgs = {
          inherit unstable;
          user = username;
        };
      };
  in {
    homeConfigurations = builtins.mapAttrs (name: value:
      mkHomeCfg {
        inherit name;
      })
    cfgs;
  };
}

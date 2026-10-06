{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    # nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

    dotfiles.url = "github:mrnossiom/dotfiles";
    dotfiles.flake = false;
  };

  outputs =
    {
      self,
      nixpkgs,
      dotfiles,
    }:
    let
      inherit (nixpkgs.lib) genAttrs;

      forAllSystems = genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forAllPkgs =
        function:
        forAllSystems (
          system:
          function {
            pkgs = pkgs.${system};
            lpkgs = lpkgs.${system};
          }
        );

      pkgs = forAllSystems (
        system:
        import nixpkgs {
          inherit system;
          overlays = [ ];
        }
      );
      lpkgs = forAllSystems (system: {
        website-static = pkgs.${system}.callPackage (import "${dotfiles}/pkgs/website-static.nix") { };
        inherit (self.packages.${system})
          redirects
          resume-en
          resume-fr
          website-raw
          ;
      });
    in
    {
      formatter = forAllPkgs ({ pkgs, ... }: pkgs.nixfmt-tree);

      packages = forAllPkgs (
        { pkgs, lpkgs }:
        let
          renderTypstPdf =
            let
              fontsConf = pkgs.makeFontsConf {
                fontDirectories = [
                  pkgs.merriweather
                  pkgs.noto-fonts-color-emoji
                ];
              };
            in
            name: entrypoint:
            pkgs.stdenv.mkDerivation {
              name = "${name}.pdf";
              src = ./.;
              nativeBuildInputs = [ pkgs.typst ];
              FONTCONFIG_FILE = "${fontsConf}";
              buildPhase = "typst compile $src/${entrypoint} $out";
            };
        in
        {
          resume-en = renderTypstPdf "resume-milo_moisson" "private/resume-en.typ";
          resume-fr = renderTypstPdf "cv-milo_moisson" "private/resume-fr.typ";

          redirects = pkgs.writeText "_redirects" ''
            # skip home page, redirect to about page
            /fr/ /fr/about 301!
            / /about 301!

            # hide french version until revamp
            /fr/* / 307!
          '';

          website-raw = pkgs.stdenv.mkDerivation {
            name = "wiro.world-website-raw";
            src = ./.;
            nativeBuildInputs = [ pkgs.zola ];
            buildPhase = "zola build";
            installPhase = "cp -r public $out";
          };

          website = pkgs.runCommand "wiro.world-website" { } ''
            mkdir -p $out
            cp -rT ${lpkgs.website-raw} $out/
            cp -rTL ${lpkgs.website-static} $out/
            cp -rT ${lpkgs.resume-en} $out/resume-milo_moisson.pdf
            cp -rT ${lpkgs.resume-fr} $out/cv-milo_moisson.pdf
            cp -rT ${lpkgs.redirects} $out/_redirects
          '';

          inherit (pkgs)
            git-pages-cli
            ;
        }
      );

      devShells = forAllPkgs (
        { pkgs, lpkgs }:
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              just
              tinymist
              typst
              watchexec
              zola
            ];
          };
        }
      );
    };
}

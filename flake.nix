{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
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
        inherit (self.packages.${system}) resume-en resume-fr;
      });
    in
    {
      formatter = forAllPkgs ({ pkgs, ... }: pkgs.nixfmt-tree);

      packages = forAllPkgs (
        { pkgs, lpkgs }:
        let
          renderTypstPdf =
            let
              fontsConf = pkgs.makeFontsConf { fontDirectories = [ pkgs.merriweather ]; };
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

          website = pkgs.stdenv.mkDerivation {
            name = "wiro.world-website";
            src = ./.;
            nativeBuildInputs = [ pkgs.zola ];
            buildPhase = "zola build";
            installPhase = ''
              cp -r public $out
              cp ${lpkgs.resume-en} $out/resume-milo_moisson.pdf
              cp ${lpkgs.resume-fr} $out/cv-milo_moisson.pdf
            '';
          };

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
              zola
            ];
          };
        }
      );
    };
}

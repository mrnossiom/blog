use pkgs;
// use pkgs::prelude::*;

use gitignore;
// not from pkgs, as more specialized
use rust as rust_external;

// formatter already exist by default

let packages = {
    let lspelling: Drv = /* import lspelling package */; // { inherit gitignore; };
    
    Packages::new_default(lspelling, { lspelling })
}

let apps = {
    let lspelling = super::packages::lspelling::build().bin.lspelling;
    
    Packages::new_default(lspelling, { lspelling })
}

let shells: std::???::Shells = {
    let rust_toolchain: Drv = rust_external::from_rustup_toolchain_file("./rust-toolchain.toml");
    // shadowing :eyes:
    let rust_toolchain: Drv = rust_toolchain.override({ extensions: [ "rust-analyzer" ]; });
    // -- other, cleaner imo, way
    let rust_toolchain: Drv = rust_external::from_rustup_toolchain_file("./rust-toolchain.toml", /* to_add: */ _ { extensions: [ "rust-analyzer" ] });

    let dev = Shell::new {
        host_packages: [
            // with pkgs; ???
            pkgs::pkg_config,
            rust_toolchain,
            pkgs::act,

            pkgs::cargo_workspaces,
        ],
        target_packages: [
            pkgs::hunspell,
            pkgs::libclang,
            pkgs::cc // stdenv.cc.cc
        ],

        env: {
            RUST_SRC_PATH: rust_toolchain.rust_lib_source as Str,
            LD_LIBRARY_PATH: makeLibraryPath buildInputs,

            RUST_LOG: "lspelling_lsp=debug,lspelling_wordc=debug,debug",
            LOG_FILE: "/tmp/lspelling.log",

            HUNSPELL_DICT: "${pkgs::hunspell_dicts::en_us_large.build()}/share/hunspell/en_US",
        } as Map<Str, impl ToString | Arr<impl ToString>>,
        // } as Map<Str, impl ToString>,
    };

    Shells::new({ dev })
}

// Flake::new(_ {
    // packages: { lspelling: lspelling_pkgs },
    // packages: { lspelling: pkgs::lspelling },
    // apps, // same
    // shells: { dev: dev_shell },
// })

// this is returned
Flake::new(_ { packages, apps, shells })

// # Ressources
// https://github.com/NixOS/nixpkgs/blob/master/doc/stdenv/stdenv.chapter.md
// ---

//! In separate crates/projects

/// tools for transforming data, building derivations
mod std/core {
    // lib, build, install, etc.

    mod derivation {
        // e.g. X is lspelling
        struct Drv<X> {
            meta: DrvMeta,
            source: Src,
            build_plan: BuildPlan,

            more: X,
        }
    }

    mod build {
        let unpack = BuildStep(|| {
            let src: PathBuf = std::build::source();

            // unpack in cwd
            match src.ext() {
                ".tar.gz" | ".tgz" | ".tar.Z" => gzip(src),
                ".tar.bz2" | ".tbz2" | ".tbz" => bzip2(src),
                ".tar.xz" | ".tar.lzma" | ".txz" => xz(src),
                _ => panic!("could not unpack")
            }
        });
    }
}

/// all package derivations
mod pkgs {
    mod hello;
    mod libxkbcommon;
    mod sway;
}

/// options definitions
mod options {
    mod machine { }
    mod user { }
}

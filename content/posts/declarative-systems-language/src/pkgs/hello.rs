use std::derivation::{Derivation, DerivationMeta, BuildStep, Source};

pub let meta = DerivationMeta::new(_ {
    name: "hello", 
    version: "2.12.1",
    description: "Program that produces a familiar, friendly greeting",

    license: License::Gpl3Plus | License::Apache,

    // changelog, mainteners, platforms, etc.
    // `mainProgram` makes no sense
});

let source = Source::fetch_url(_ {
    // interpolation                vvvvvvvvvvvv
    url: "mirror://gnu/hello/hello-{meta.version}.tar.gz",
    // keep hash in source?
    hash: "sha256-jZkUKv2SV28wsM18tCqNxoCZmLxdYH2Idh9RLibH2yA=",
});

// none
let build_step = BuildStep::new(|| {
    // call `./configure`
    std::build::???::configure();
    // call `make`
    std::build::make::???();
});

// special imperative block to act
let install_step = BuildStep::new(|| {
    // type is opt, just to show here
    let out: PathBuf = std::build::request_output_dir();

    std::install::make::install();
});

// special imperative block to act
let install_check = BuildStep::new(|| {
    let out: PathBuf = std::build::request_output_dir();
    let hello_bin = out.join("bin/hello");

    std::check::is_present(hello_bin)?;

    std::check::exec(hello_bin, []);
});

// ability to document derivations
pub let derivation = Derivation::new(_ {
    meta,
    source,

    // new starts from empty plan, could have `unpack` with first being unpack phase, `stdenv` for configure make make install workflows
    steps: BuildPlan::new([
        // see example down below
        std::build::unpack(),
        // patch step
        // configure step
        build_step,
        // build check step
        install_step,
        // fixup step, patches files to work in nix??? envs
        install_check, // could do some `bin/<name> -v` to ensure that linking worked fine
        // distribution step
    ]),
});

let out = derivation.out();

pub let bin = out.join()

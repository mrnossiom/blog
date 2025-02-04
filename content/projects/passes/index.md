+++
title = "Wallet Passes"
date = "2024-07-12"
updated = "2024-07-12"

draft = true

[extra]
status = "hold"
# forge = "https://github.com/wirolibre/passes"
skills = ["rust", "apple"]

# TODO: split introduction and implmentation into different articles
linked_posts = [
   # "passes-introduction",
   # "passes-lib"

   "posts/sign-wallet-pass/index.md"
]

summary = """
TODO
"""
+++

# Why?

After booking an exhibition in May 2024 and recieving my ticket as yet another PDF file, I wondered how are the [Apple Wallet](apple-wallet) passes created.  You can often get these passes from rail companies or when attending some events, and they are very handy, even kinda cool.

<!-- adventages -->
(**What format**) This is the whole point of this format? Ergonomics! You get first-class support for tickets on your phone. Metadata stored in the ticket helps it to show it to you at the right moment on your lockscreen. No need to search inside your email for 5 minutes, before noticing that you can't get a signal and that you forgot to preload the PDF outside. Ticket code is the main visible part, easy to scan, with your phone automatically raising brightness to the maximum. I'm mainly talking about iOS here, but Android supports these files too.
Also, it is fairly easy to transform an existing PDF ticket to a Wallet Pass one. You only need to grab the barcode data for it to be valid. (**barcode spec**)

When thinking about it, the data stored in these virtual tickets is quite basic. At its *rudimentary* form, each ticket just needs a title, an event date and some qr code/barcode data that the museum employees will scan. If that is really the case, then why doesn't every museum, theater or any other kind of ticket selling institution provides such virtual and convienient tickets?

It didn't take long to find that these tickets are under the [`pkpass`](pkpass) file format. Which, we'll see in more details later, is just really a ZIP file containing [JSON](json) data and other assets. I also stumbled upon [Building a Pass](building-a-pass) Apple clear documentation.

First reaction was to try and build myself a custom Pass. I found the [passes](passes-docs-rs) Rust library that has examples to tinker around. Ten minutes later, I would upload the resulting file onto my phone and... wut? The file doesn't behave like a pass, it seems like it was corrupted. Anyway, something went wrong. Fast-forward a bit and I quickly understand that Apple requires you to sign the file with a certificate provided by Apple.

So what's the issue here? Wallet Passes have a high entry cost that is both technical and financial.

- **technical**: there at least some development effort that needs to go into automating pass bundle crafting, bundling assets and most importantly signing them to distribute them on iOS platforms.

- **financial**: getting the required certificate from Apple forces you to apply to their Developper Program whose Membership costs $100 per year. This cost may be negligible for enterprises, but it is not an investment some individual would consider simply to emit private usage passes.

But this barrier can be lowered. First, the technical aspect: Open Source is one way to go, as a product that would normally fit a niche use-case of an individual, it can find relevency among others. It would also enable users to enlarge that use-case and evolve the project. Second, the financial aspect: after some digging, Apple actually offers fee waivers for non-profit organisations. It took two-three month to create a non-profit with a friend, called `WIRO LOGICIEL LIBRE` (`WIRO FREE SOFTWARE`) and enroll as a non-profit in Apple's program. This non-profit is a core component of the next steps as it becomes a custom passes signing platform to empower individuals.

[apple-wallet]: https://en.wikipedia.org/wiki/Apple_Wallet
[pkpass]: https://en.wikipedia.org/wiki/PKPASS
[json]: https://en.wikipedia.org/wiki/JSON
[building-a-pass]: https://developer.apple.com/documentation/walletpasses/building_a_pass
[passes-docs-rs]: https://docs.rs/passes/latest/passes/


# How?

After some discussion and thinking, I have this project roadmap to share. It starts from minimal yet effective tooling that can demonstrate capabilities to a simpler and more accessible interface lowering even more the technical barrier and enabling any individual to make his own **pass**.

<!-- move elsewhere? -->
0. Rebuild a library to manipulate pkpasses. Because I intend to build the following steps in Rust, I want a robust library able to both emit only valid passes and deserialize with a bit more flexibility.

1. Create a [CLI](cli) tool to generate `pkpass` files. This allows for prototyping, getting along with generating passes and certificate management.

   Creating tooling to locally validate passes without needing roundtrips to an actual Apple device or generate keypairs and [certificate signing requests](certificate-signing-requests) to quick get a new Apple certificate.

2. Expose API endpoints to sign `pkpass` manifests or a full-fledged builder.

   This should happen with proper payload validation and verification.

   This part of the roadmap fulfills the goal of lowering financial entry cost.

3. Present a website to allow interaction with our API.

   This part of the roadmap fulfills the goal of lowering technical entry cost.

At the same time, I want to build a collaborative library of templates for a large collection museum, theater or recurring event, so you could have images, titles, links, places and more prefilled. *(+++)*

[cli]: https://en.wikipedia.org/wiki/CLI
[certificate-signing-requests]: https://en.wikipedia.org/wiki/Certificate_signing_request


We talked a bit about a high level overview implementation. Now we are going to deep into the format and how did I actually build that technically.

# What?

So what is a `pkpass` file exactly? It's a `ZIP` file with a specific file tree.

Top-level `pass.json` file is one major component, containing pass fields, barcode data, pass color theme and metadata which makes the whole point of a digital pass.

Second major component is the ability to add images that will be displayed in different parts of the pass: logo icon, strip, thumbnail, etc.

Finally, you can localize your pass text and images by adding `<lang>.lproj` subdirectories.

Additionally, each asset in the archive (including `pass.json`) must have an entry with a hash of his content in the `manifest.json` file.

That's where Apple secret sauce intervenes, for the pass to be considered valid on their devices, a detached signature of the manifest made with the certificate Apple provided should be written to `signature`.

# Implementation

## 0. Library

When prepping for the actual implementation, I stumbled upon two libraries (passes and wallet-pass). I experimented with passes, but I quickly figured out that I wanted more control over the library and figured out it's also a good exercise to think a great library API.

---

Ideally I want my library to have only serialize valid passes. I also want to deserialize existing passes and validate them. While testing the deserialization with random passes on my phone, I found that there's alw

## 1. 


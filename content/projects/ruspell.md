+++
title = "lspelling & ruspell"
date = "2024-05-27"
updated = "2024-05-27"

draft = true

[extra]
# TODO: fix rendering first
# overview = "A port of Hunspell to Rust"
# skills = "rust"

summary = """
TODO
"""
+++

Though `lspelling` and `ruspell` are separate projects, their development is closely related as `ruspell` is supposed to provide spell checking functionalities to `lspellling`, which then cleverly parses the code and tries to find spelling mistakes.

# Story

Since I've met the [Language Server Protocol] (LSP) specification, I've always thought it was a great way to make universal extensions that can quickly integrate into any existing code editor. I don't want to deal too much with *VS Code* specific APIs. When switching editors, an extension I missed a lot is [CSpell]. It smartly parses your code to search for dumb spelling mistakes and provide quick suggestions that most of the time make it instant.

You can guess what's next, in Mars 2024, I started working on such an extension under the form of an LSP. I want it to be able to intelligently parses code to spell check with different contexts (e.g. variable names in `camelCase` or `snake_case` must be correctly split). Some ideas to get better context would be to use [Tree-sitter] grammars and query specific parts. Imagine having [LanguageTool] checking your user facing errors strings for wording and mistakes.

My first (and only approach as of today) is to fragmentize source files into text tokens that you can then spellcheck. The most basic one is `DumbFragmentizer`, it ignores every special characters and tries to read every single word as it could a variable name.

As of May 2024, `lspelling` recomputes tokens and checks on every save. Next steps would be to recompute only parts that changed and generate suggestions on demand.

In parallel, I had to find a way to spellcheck words, I opted for [Hunspell] which seems widespread and battle-tested as it is the default for `LibreOffice`, `Firefox`, `macOS` and more. My first PoC is done with some Hunspell C bindings. For more flexibility, I quickly decided to start my own port of [`ruspell`], to Rust.

In April 2024, I made the first commit. I was greatly helped by [`spylls`] (an explanatory port to Python) and the [blog series along it](https://zverok.space/spellchecker.html).

> *(+)*


<!-- TODO: insert small icon for GitHub, needs icon shortcode -->
See both projects on GitHub: [`lspelling`] and [`ruspell`]

[Language Server Protocol]: https://en.wikipedia.org/wiki/Language_Server_Protocol
[CSpell]: https://cspell.org/
[Tree-sitter]: https://en.wikipedia.org/wiki/Tree-sitter_(parser_generator)
[LanguageTool]: https://en.wikipedia.org/wiki/LanguageTool
[`spylls`]: https://github.com/zverok/spylls
[Hunspell]: https://hunspell.github.io/

[`ruspell`]: https://github.com/mrnossiom/ruspell
[`lspelling`]: https://github.com/mrnossiom/lspelling

#import "resume-common.typ": resume, header, experience, formation, project

#set text(lang: "en", region: "gb")

#show: resume

#header

I’m a 20 y.o. French developer, currently studying at EPITA Paris.
I enjoy diving into complex parts of our everyday stack.
That’s why I like low level stuff, compilers, protocols, and systems programming in general.

= Professional experience

#experience(
  title: [Back-end Developer],
  company: [Adaptive ML],
  date: [Summers 2025 & 2024],
  techs: [Rust, Grafana, TypeScript, NATS]
)[
  - Worked on an existing Rust back-end codebase.
  - Implemented the queue system of an event-driven architecture to replace a non-scalable polling mechanism for jobs management.
  - Implemented metrics collection and integration with Prometheus and Grafana.
]

#experience(
  title: [Full-stack Developer],
  company: [LightOn],
  date: [Summers 2024 & 2023],
  techs: [TypeScript, Vue, Python]
)[
  - Worked on the front-end of an on-premise RAG platform.
]

#experience(
  title: [Web Developer],
  company: [LightOn],
  date: [Summer 2022],
  techs: [TypeScript, Vue]
)[
  - Developed a Google Sheets extension to interact with LLMs in batches.
]

= Projects

#project(
  name: "kaleic",
  link: link("https://kalei.wiro.world", "kalei.wiro.world"),
  date: [May 2025 --- Present],
)[
  Following my attempt at a DSL for *OpenAPI* back in 2024,
    kalei is my first Ahead-of-Time compiler front-end which is still in early developement.
  This is also an opportunity to experiment with a few #emph[novel] PL features like effects/capabilites.
]

#project(
  name: "tower-lsp-server",
  link: link("https://github.com/tower-lsp-community/tower-lsp-server", "github.com"),
  date: [November 2024 --- Present],
)[
  There were stale discussions around forking the unmaintained #emph[tower-lsp] project.
  I finally took action to create the #emph[tower-lsp-community] organization and take over the maintainance.
]

#project(
  name: "wakatime-ls",
  link: link("https://github.com/mrnossiom/wakatime-ls", "github.com"),
  date: [April 2024 --- Present],
)[
  This project is quite small, but it made me interact with a lot of people.
  It's the reason I had any interest for language servers and cared about the absence of maintainers on #emph[tower-lsp].
]

#project(
  name: "discord-smp-link",
  link: link("https://github.com/mrnossiom/discord-smp-link", "github.com"),
  date: [April 2022 --- March 2023],
)[
  #emph[Rust, Axum, OAuth2, Docker, Terraform, MySQL, Diesel] \
  Throughout the project,
    I
    used diesel to have type-safe SQL queries,
    made custom futures,
    used Docker and Terraform to deploy it,
    finished an OAuth2 flow,
    learned a lot about procedural and MBE macros,
    and in general touched way more technologies than necessary.
  As the first large project I did in Rust, it served as a way to discover the ecosystem and other technologies.
]

#pagebreak()

= Personal experience

- Actively involved in the *Open Source community*,
    I try to fill issues and merge requests whenever possible.
  I choose tools that I can contribute to.

- I joined most of the Paris *Rust Meetups* organised by one of the Rust team leads *since 2022*,
    there have been many opportunities for me to learn from talks and to discuss technical topics.

- In 2025, I’ve participated in several *hackathons* organised by the French government around *accessibility* and *open source software*.

= Formation

#formation(
  place: [EPITA],
  date: [2024 --- Present]
)[
  2nd year of Computer Science
]

#formation(
  place: [Heriot-Watt University],
  date: [2026]
)[
  Semester abroad in Edinburgh, UK
]

#formation(
  place: [Saint-Michel de Picpus High School],
  date: [2020 --- 2024]
)[
  Mathematics and Physics
]

= Skills

*Programming languages* : Rust #emoji.crab, Nix, TypeScript, Python, Go, HTML, CSS \
*Technologies* : Tokio, React, Grafana, OpenTelemetry \
*Interests*: Hiking, Movies \
*Languages*: French (Native), English (Fluent) \

#import "resume-common.typ": resume, header, experience, formation, project

#set text(lang: "fr")

#show: resume

#header

Je suis un développeur français de 20 ans, actuellement étudiant à l'EPITA Paris.
J'aime me plonger dans les aspects complexes de notre pile quotidienne.
C'est pourquoi j'apprécie les aspects bas niveau, les compilateurs, les protocoles et la programmation système en général.

= Expérience professionnelle

#experience(
  title: [Développeur Back-End],
  company: [Adaptive ML],
  date: [Étés 2025 & 2024],
  techs: [Rust, Grafana, TypeScript]
)[
  - Travail au sein d'une back-end existante en Rust.
  - Passage de l'orchestration de tâches, d'un système de polling vers une architecture évènementielle plus robuste.
  - Collecte de métriques et leur intégration avec Prometheus et Grafana.
]

#experience(
  title: [Développeur Fullstack],
  company: [LightOn],
  date: [Étés 2024 & 2023],
  techs: [TypeScript, Vue, Python]
)[
  - Développement de l'interface web d'une platforme RAG.
]

#experience(
  title: [Développeur Web],
  company: [LightOn],
  date: [Été 2022],
  techs: [TypeScript, Vue]
)[
  - Création d'une extention Google Sheets pour interagir en masse avec les LLMs.
]

#experience(
  title: [Stage d'observation],
  company: [JoliCode],
  date: [Février 2021],
)[]

= Projets

#project(
  name: "kaleic",
  link: link("https://kalei.wiro.world", "kalei.wiro.world"),
  date: [Mai 2025 --- Aujourd'hui],
)[
  Following my attempt at a DSL for REST APIs back in 2024,
    kalei is my first machine code compiler which is still in very early developement.
  I want to experiment with a few #emph[novel] PL features like effects/capabilites.
]

#project(
  name: "tower-lsp-server",
  link: link("https://github.com/tower-lsp-community/tower-lsp-server", "github.com"),
  date: [Novembre 2024 --- Aujourd'hui],
)[
  There were stale discussions around forking the unmaintained #emph[tower-lsp] project.
  I finally took action to create the #emph[tower-lsp-community] organization and take over the maintainance.
]

#project(
  name: "wakatime-ls",
  link: link("https://github.com/mrnossiom/wakatime-ls", "github.com"),
  date: [Avril 2024 --- Aujourd'hui],
)[
  This project is quite small, but it made me interact with a lot of people.
  It's the reason I had any interest for language servers and cared about the absence of maintainers on #emph[tower-lsp].
]

#project(
  name: "discord-smp-link",
  link: link("https://github.com/mrnossiom/discord-smp-link", "github.com"),
  date: [Avril 2022 --- Mars 2023],
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

= Experience personelle

- Activement impliqué dans la *communauté Open Source*,
    j'essaie de remplir des tickets et de proposer des changements de code dès que possible.
    Je choisis des outils auquels je peux contribuer.

// Ayant participé à la plupart des rencontres Paris Rust Meetups organisées par l'un des chefs d'équipe Rust depuis 2022,
//   j'ai eu de nombreuses occasions d'apprendre grâce à des conférences et de discuter de sujets techniques.

- En 2025, j'ai participé à plusieurs *hackathons* organisés par le gouvernement français.

// Le premier portait sur la validation des PDF à des fins d'accessibilité, et le concept de mon équipe a été sélectionné pour être développé en un projet pleinement fonctionnel.
// Le second était un hackathon international consacré à La Suite Numérique (suite bureautique open source européenne).


= Formation

#formation(
  place: [EPITA],
  date: [2024 --- Aujourd'hui]
)[
  2ème année d'informatique
]

#formation(
  place: [Université Heriot-Watt],
  date: [Janvier --- Juin 2026]
)[
  Semestre à l'étranger à Édinbourgh, GB
]

#formation(
  place: [Lycée Saint-Michel de Picpus],
  date: [2020 --- 2024]
)[
  Mathématiques et Physique-Chimie
]

= Compétences

*Languages de programmation* : Rust #emoji.crab, Nix, TypeScript, Python, Go, HTML, CSS \
*Technologies* : Tokio, React, Grafana, OpenTelemetry \
*Intérêts* : Randonnée, Cinéma \
*Langages* : Français (Natif), Anglais (Courant)

#import "resume-common.typ": resume, header, experience, formation

#set text(lang: "fr")

#show: resume

#header

Je suis un développeur français de 20 ans, actuellement étudiant à l'EPITA Paris.
J'aime me plonger dans les aspects complexes de notre pile quotidienne.
C'est pourquoi j'apprécie les aspects bas niveau, les compilateurs, les protocoles et la programmation système en général, et j'aime en discuter aussi bien en français qu'en anglais.

// = ???

// Je me suis de plus en plus impliqué dans le développement open source en contribuant à de nombreux outils que j'utilise et en discutant des décisions de conception.
// La rédaction technique m'a permis d'acquérir des connaissances dans un large éventail de sujets,
//   du débogage des problèmes de performances à la compréhension du fonctionnement interne d'une bibliothèque.

// Ayant participé à la plupart des rencontres Paris Rust Meetups organisées par l'un des chefs d'équipe Rust depuis 2022,
//   j'ai eu de nombreuses occasions d'apprendre grâce à des conférences et de discuter de sujets techniques.

// En 2025, j'ai participé à plusieurs hackathons organisés par le gouvernement français.
// Le premier portait sur la validation des PDF à des fins d'accessibilité, et le concept de mon équipe a été sélectionné pour être développé en un projet pleinement fonctionnel.
// Le second était un hackathon international consacré à La Suite Numérique (suite bureautique open source européenne).

// Au cours de toutes ces années, j'ai pu m'essayer à de nombreuses piles de programmation.
// Au début, j'ai exploré le développement front-end, en apprenant JavaScript puis rapidement TypeScript.
// Au cours des quatre dernières années, je me suis concentré sur Rust pour le développement back-end, les CLI ou pour bricoler sur divers projets.

= Expérience professionnelle

#experience(
  title: [Développeur Back-End],
  company: [Adaptive ML],
  date: [Juillet/Août 2025 & Août 2024],
  techs: [Rust, Grafana, TypeScript]
)[
  - Travail au sein d'une back-end existante en Rust.
  - Passage de l'orchestration de tâches, d'un système de polling vers une architecture évènementielle plus robuste.
  - Collecte de métriques et leur intégration avec Prometheus et Grafana.
]

#experience(
  title: [Développeur Fullstack],
  company: [LightOn],
  date: [Juillet 2024 & Juillet/Août 2023],
  techs: [TypeScript, Vue, Python]
)[
  - Développement de l'interface web d'une platforme RAG.
]

#experience(
  title: [Développeur Web],
  company: [LightOn],
  date: [Juillet/Août 2022],
  techs: [TypeScript, Vue]
)[
  - Création d'une extention Google Sheets pour interagir en masse avec les LLMs.
]

#experience(
  title: [Stage d'observation],
  company: [JoliCode],
  date: [Été 2020],
)[]

= Formation

#formation(
  place: [EPITA (2nd année)],
  date: ("2024", "Aujourd'hui")
)[]

#formation(
  place: [Université Heriot-Watt (Édinbourgh, GB)],
  date: ("Janvier 2026", "Juin 2026")
)[
  Semestre à l'étranger
]

#formation(
  place: [Lycée Saint-Michel de Picpus],
  date: ("2020", "2024")
)[
  Mathématiques et Physique-Chimie
]

= Compétences

*Languages de programmation* : Rust #emoji.crab, Nix, TypeScript, Go, HTML, CSS \
*Technologies* : Tokio, React, Grafana, OpenTelemetry \
*Intérêts* : Randonnée, Cinéma \

#import "resume-common.typ": resume, header, experience, formation, project

#set text(lang: "en", region: "gb")

#show: resume

#header

I’m a 20 y.o French developer, currently studying at EPITA Paris.
I enjoy diving into complex parts of our everyday stack.
That’s why I like low level stuff, compiler, protocols, and systems programming in general and enjoy discussing this both in French and English.

= Narrative

I got more and more involved into open source development by contributing to many of the tools I use and discussing design decisions.
Technical writing has enabled me to gather knowledge in a wide range of topics,
  from debugging performance issues to understanding the internals of a library.

As someone who’s joined most of the Paris Rust Meetups organised by one of the Rust team leads since 2022,
  there have been many opportunities for me to learn from talks and discuss technical topics.

In 2025, I’ve participated in several hackathons organised by the French government.
The first one was about PDF validation for accessibility purposes where my team’s proof of concept was selected to grow in a fully functional project.
The second was an international one about tinkering around "La Suite Numérique" (European open source office suite).

In all these years, I’ve been able to play with many programming stacks.
At first, I explored front-end development, learning JavaScript then quickly TypeScript.
In the last five years, I focused my attention on Rust for tooling, CLIs, back-end development or to tinker on various projects and ideas.

= Professional experience

#experience(
  title: [Back-end Developer],
  company: [Adaptive ML],
  date: [Summer 2024 & Summer 2025],
  techs: [Rust, Grafana, TypeScript]
)[
  - Worked on an existing Rust back-end codebase.
  - Implemented the queue system (NATS) of an event-driven architecture to replace a non-scalable polling mechanism for jobs management.
  - Implemented metrics collection and integration with Prometheus and Grafana.
]

#experience(
  title: [Full-stack Developer],
  company: [LightOn],
  date: [Summer 2023 & Summer 2024],
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

#experience(
  title: [Internship],
  company: [JoliCode],
  date: [Summer 2020],
)[]

= Formation

#formation(
  place: [EPITA (2nd year)],
  date: ("2024", "Present")
)[]

#formation(
  place: [Heriot-Watt University (Edinburgh, UK)],
  date: ("January 2026", "June 2026")
)[]

#formation(
  place: [Saint-Michel de Picpus High School],
  date: ("2020", "2024")
)[
  Mathematics and Physics
]

// = Extra curricular activities

// = Projects

// #project(
//   name: "kaleic",
//   url: "https://github.com/mrnossiom/kaleic",
//   date: ("2024", "Present"),
// )[]

// #project(
//   name: "wakatime-ls",
//   url: "https://github.com/mrnossiom/wakatime-ls",
//   date: ("2022", "Present"),
// )[]

// #project(
//   name: "tower-lsp",
//   url: "https://github.com/tower-lsp-community/tower-lsp",
//   date: ("2024", "Present"),
// )[]

= Additional

*Interests*: Hiking, Movies

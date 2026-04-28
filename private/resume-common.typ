// Acknowledgements
// - https://typst.app/universe/package/basic-resume

// #let accent-color = oklch(62%, .22, 23deg, 100%)
#let accent-color = oklch(40%, 0.4, 23deg, 100%)

#let resume(
  accent-color: accent-color,
  body
) = {
  set par(justify: true)
  show link: underline

  set text(font: "Merriweather")
  set page(margin: (x: 1.8cm, y: 1.3cm))

  show heading: set text(fill: accent-color)

  // add lines under the headers
  show heading: it => {
    pad(smallcaps(it), top: 0pt, bottom: -14pt)
    line(length: 100%, stroke: 1pt)
  }

  body
}

#let generic-two-by-two(
  top-left: "",
  top-right: "",
  bottom-left: "",
  bottom-right: "",
) = {
  [
    #top-left #h(1fr) #top-right \
    #bottom-left #h(1fr) #bottom-right
  ]
}

#let generic-one-by-two(
  left: "",
  right: "",
) = {
  [
    #left #h(1fr) #right
  ]
}

#let dimmed(body) = { text(fill: luma(40%), body) }
#let soft-newline = [ \ ]

// -- Resume blocks

#let header = [
  #box(
    height: 30pt,
    stack(
      dir: ltr,
      spacing: 5pt,
      box(
        height: 100%,
        radius: 100%, clip: true,
        image("resume-picture.jpg")
      ),
      align(start + horizon, text(size: 25pt)[Milo Moisson])
    )
  )

  #(
    link("mailto:milo@wiro.world"),
    link("https://wiro.world", "wiro.world"),
    link("https://github.com/mrnossiom", "github.com/mrnossiom"),
    // link("https://tangled.org/wiro.world", "tangled.org/wiro.world"),
    link("https://linkedin.com/in/milomoisson", "linkedin.com/in/milomoisson"),
  ).join[ | ]
]

#let experience(
  title: "",
  company: "",
  date: "",
  techs: "",
  body,
) = {
  let title-at-company = strong(delta: 200)[#title @ #company]

  if techs == "" {
    generic-one-by-two(
      left: title-at-company,
      right: date,
    )
  } else {
    generic-two-by-two(
      top-left: title-at-company,
      top-right: date,
      bottom-left: emph(techs),
      // bottom-right: ?
    )
  }
  soft-newline
  body
}

#let formation(
  place: "",
  date: ("", ""),
  body
) = {
  generic-one-by-two(
    left: strong(delta: 200, place),
    right: date.join[ --- ],
  )
  soft-newline
  dimmed(body)
}

#let project(
  name: "",
  url: "",
  date: ("", ""),
  body
) = {
  generic-two-by-two(
    top-left: strong(delta: 200, name),
    top-right: date.join[ --- ],
    bottom-left: link(url),
    // bottom-right: ?
  )
  soft-newline
  body
}


// FIXME: workaround for the lack of `std` scope
#let std-bibliography = bibliography

#let template(
  // Your thesis title
  title: [Thesis Title],

  // The academic year you're graduating in
  academic-year: [2023/2024],

  // Your thesis subtitle, should be something along the lines of
  // "Bachelor's Thesis", "Tesi di Laurea Triennale" etc.
  course: [INFORMATICA],

  // The paper size, refer to https://typst.app/docs/reference/layout/page/#parameters-paper for all the available options
  paper-size: "a4",

  // Candidate's informations. You should specify a `name` key and
  // `matricola` key
  candidate: (
    name: "Francesco Bortuzzo",
    matricola: 157430
  ),

  // The thesis' supervisor (relatore)
  supervisor: "Professor Angelo Montanari",

  // An array of the thesis' co-supervisors (correlatori).
  // Set to `none` if not needed
  co-supervisor: (
    "Dottor Andrea Brunello",
    "Dottor Nicola Saccomano"
  ),

  // Set to "it" for the italian template
  lang: "it",

  // The thesis' bibliography, should be passed as a call to the
  // `bibliography` function or `none` if you don't need
  // to include a bibliography
  bibliography: none,

  // Abstract of the thesis, set to none if not needed
  abstract: none,

  // Acknowledgments, set to none if not needed
  acknowledgments: none,

  // The thesis' content
  body
) = {
  // Set document matadata.
  set document(title: title, author: candidate.name)

  // Set the body font, "New Computer Modern" gives a LaTeX-like look
  set text(font: "New Computer Modern", lang: lang, size: 12pt)

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)

  // Configure raw text/code blocks
  show raw.where(block: true): set text(size: 0.8em)
  show raw.where(block: true): set par(justify: false)
  show raw.where(block: true): set align(left)
  show raw.where(block: true): block.with(
    fill: gradient.linear(luma(240), luma(245), angle: 270deg),
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )
  show raw.where(block: false): box.with(
    fill: gradient.linear(luma(240), luma(245), angle: 270deg),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  // Configure figure's captions
  show figure.caption: set text(size: 0.8em)

  // Configure lists and enumerations.
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt, marker: ([•], [--]))

  // Configure headings
  set heading(numbering: "1.a.I")
  show heading.where(level: 1): it => {
    if it.body not in ([References], [Riferimenti]) {
      block(width: 100%, height: 20%)[
        #set align(center + horizon)
        #set text(1.3em, weight: "bold")
        #smallcaps(it)
      ]
    } else {
      block(width: 100%, height: 8%)[
        #set align(center + horizon)
        #set text(1.1em, weight: "bold")
        #smallcaps(it)
      ]
    
    }
  }
  show heading.where(level: 2): it => block(width: 100%)[
    #set align(center)
    #set text(1.1em, weight: "bold")
    #v(1em)
    #smallcaps(it)
    #v(1em)
  ]
  show heading.where(level: 3): it => block(width: 100%)[
    #set align(left)
    #set text(1em, weight: "bold")
    #smallcaps(it)
  ]

  // Title page
  // Configure the page
  set page(
    paper: paper-size,

    margin: (right: 1.5cm, left: 2cm, top: 1cm, bottom: 3cm)
  )

  set align(center)

  rect(
    fill: rgb("#0000FF"),
    width: 100%,
    height: 55pt,
    grid(
      columns: (140pt, 1fr),
      align: left + horizon,
      pad(
        left: 8pt,
        top: 4pt,
        bottom: 2pt,
        image("/img/logo.svg"),
      ),
      text(0.67em, font:"Arial", weight: 700, fill: white)[ DIPARTIMENTO DI SCIENZE MATEMATICHE, INFORMATICHE E FISICHE ]
    )
  )

  v(3fr)

  text(1.5em, [TESI DI LAUREA IN \ #course])
  v(1.5fr, weak: true)
  text(2em, weight: 700, title)

  v(4fr)

  grid(
    columns: (1fr, 1fr),
    align: left,
    grid.cell(
      inset: (left: 40pt)
    )[
      #if lang == "en" {
        smallcaps("candidate")
      } else {
        smallcaps("candidato")
      }\
      *#candidate.name*
    ],
    grid.cell(
      inset: (right: 30pt)
    )[
      #if lang == "en" {
        smallcaps("supervisor")
      } else {
        smallcaps("relatore")
      }\
      *#supervisor*

      #if co-supervisor != none {
        if lang == "en" {
          smallcaps("co-supervisor")
        } else {
          smallcaps("correlatore")
        }
        linebreak()
        co-supervisor.map(it => [
          *#it*
        ]).join(linebreak())
      }
    ],
  )

  v(5fr)

  text(1.2em, [
    #if lang == "en" {
      "Academic Year "
    } else {
      "Anno Accademico "
    }
    #academic-year
  ])

  pagebreak(to: "odd")
  set par(justify: true, first-line-indent: 1em)
  set align(center + horizon)


  // Configure the page
  set page(
    paper: paper-size,

    // Margins are taken from the university's guidelines
    margin: (right: 3cm, left: 3.5cm, top: 3.5cm, bottom: 3.5cm)
  )

  // Abstract
  if abstract != none {
    heading(
      level: 2,
      numbering: none,
      outlined: false,
      "Abstract"
    )
    abstract
  }

  pagebreak(weak: true, to: "odd")

  // Table of contents
  // Outline customization
  show outline.entry.where(level: 1): it => {
    if it.body != [References] {
    v(12pt, weak: true)
    link(it.element.location(), strong({
      it.body
      h(1fr)
      it.page
    }))}
    else {
      text(size: 1em, it)
    }
  }
  show outline.entry.where(level: 3): it => {
    text(size: 0.8em, it)
  }
  
  outline(depth: 3, indent: true)

  pagebreak(to: "odd")

  // Main body

  show link: underline
  set page(numbering: "1")
  set align(top + left)
  counter(page).update(1)

  body

  pagebreak(to: "odd")

  // Bibliography
  if bibliography != none {
    heading(
      level: 1,
      numbering: none,
      if lang == "en" {
        "References"
      } else {
        "Riferimenti"
      }
    )
    show std-bibliography: set text(size: 0.9em)
    set std-bibliography(title: none)
    bibliography
  }

  pagebreak()
  set align(center + horizon)

  // Acknowledgments
  if appendix != none {
    heading(
      level: 2,
      numbering: none,
      outlined: false,
      if lang == "en" {
        "Appendice"
      } else {
        "Appendice"
      }
    )
    acknowledgments

    pagebreak(weak: true)
  }
}
#let script-size = 7.97224pt
#let footnote-size = 8.50012pt
#let small-size = 9.24994pt
#let normal-size = 10.00002pt
#let large-size = 11.74988pt

#let project(
  title: "",
  abstract: [],
  authors: (),
  date: none,
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    margin: (left: 30mm, right: 30mm, top: 30mm, bottom: 30mm),
    numbering: "1",
    number-align: center,
  )
  set text(font: "New Computer Modern", lang: "en")
  show math.equation: set text(weight: 400)

  // Set run-in subheadings, starting at level 5.
  show heading: it => {
    if it.level > 4 {
      parbreak()
      text(10pt, weight: "semibold", it.body + ".", style: "italic")
    } else if it.level == 4 {
      parbreak()
      text(11pt, weight: "black", it.body)
      parbreak()
    } else {
      it
    }
  }


  // Title row.
  align(center)[
    #block(text(weight: 500, 1.75em, title))
    #v(1em, weak: true)
    #date
  ]

  // Author information.
  pad(
    top: 2em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(2, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center)[
        *#author.name* \
        #author.email
        #author.identification_number
      ]),
    ),
  )

  

  // Main body.
  set par(justify: true, first-line-indent: 1em)
  set text(hyphenate: false)

  body
}
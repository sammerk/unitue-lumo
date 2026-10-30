// unitue-typst: Corporate Design der Universität Tübingen (Pendant zu unitue-html)
#let ut-karminrot = rgb("#A51E37")
#let ut-mattgold = rgb("#B4A069")
#let ut-anthrazit = rgb("#32414B")
#let ut-xmargin = 20mm
#let ut-ymargin = 22mm

// Statisches Partikelnetz (deterministisch, damit der Umbruch stabil bleibt)
#let ut-particles(w, h, seed: 7) = {
  let rnd(k) = {
    let v = calc.sin((k + 1) * 12.9898 + seed * 78.233) * 43758.5453
    v - calc.floor(v)
  }
  let n = calc.max(12, int(calc.round(w.mm() * h.mm() / 420)))
  let pts = range(n).map(i => (rnd(3 * i) * w, rnd(3 * i + 1) * h, 0.4 + rnd(3 * i + 2) * 0.9))
  let maxd = 30mm
  for i in range(n) {
    for j in range(i + 1, n) {
      let dx = pts.at(i).at(0) - pts.at(j).at(0)
      let dy = pts.at(i).at(1) - pts.at(j).at(1)
      let d = calc.sqrt((dx / 1mm) * (dx / 1mm) + (dy / 1mm) * (dy / 1mm)) * 1mm
      if d < maxd {
        let a = 1 - d / maxd
        place(top + left, line(
          start: (pts.at(i).at(0), pts.at(i).at(1)),
          end: (pts.at(j).at(0), pts.at(j).at(1)),
          stroke: 0.4pt + ut-mattgold.transparentize(100% - 40% * a),
        ))
      }
    }
  }
  for p in pts {
    place(top + left, dx: p.at(0) - p.at(2) * 1mm, dy: p.at(1) - p.at(2) * 1mm,
      circle(radius: p.at(2) * 1mm, fill: ut-mattgold.transparentize(40%), stroke: none))
  }
}

#let article(
  title: none,
  subtitle: none,
  authors: none,
  keywords: (),
  date: none,
  abstract-title: none,
  abstract: none,
  thanks: none,
  cols: 1,
  lang: "de",
  region: "DE",
  font: none,
  fontsize: 10.5pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: none,
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  sectionnumbering: none,
  linkcolor: none,
  citecolor: none,
  filecolor: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  // unitue-Optionen
  faculty: none,
  institute: none,
  ut-logo: none,
  particles: false,
  particles-seed: 7,
  accent: none,
  author-label: "Autor",
  date-label: "Datum",
  doc,
) = {
  let akzent = if accent != none { rgb(content-to-string(accent)) } else { ut-karminrot }

  set document(title: title, keywords: keywords)
  set document(
    author: authors.map(author => content-to-string(author.name)).join(", ", last: " & "),
  ) if authors != none and authors != ()
  set page(
    paper: "a4",
    footer: context {
      set text(size: 8pt, fill: ut-anthrazit.transparentize(25%))
      line(length: 100%, stroke: 1.2pt + ut-mattgold)
      v(-2mm)
      grid(columns: (1fr, auto),
        [Eberhard Karls Universität Tübingen#if institute != none [ · #institute]],
        counter(page).display())
    },
    footer-descent: 6mm,
  )
  set par(justify: false, leading: 0.75em)
  set text(lang: lang, region: region, size: fontsize, fill: ut-anthrazit,
    font: if font != none { font } else { ("Arial", "Helvetica Neue", "Helvetica") })
  show math.equation: set text(font: mathfont) if mathfont != none
  show raw: set text(font: codefont) if codefont != none

  set heading(numbering: sectionnumbering)
  show link: set text(fill: akzent)
  show ref: set text(fill: akzent)

  // Überschriften wie im HTML-Format
  show heading: set text(fill: ut-anthrazit, weight: "bold")
  show heading.where(level: 9): it => {
    v(1.6em, weak: true)
    text(size: 1.6em, it)
    v(0.6em, weak: true)
  }
  show heading.where(level: 1): it => {
    v(1.6em, weak: true)
    block(width: 100%, above: 0pt, below: 0.9em, breakable: false,
      stroke: (bottom: 0.5pt + rgb("#e3e6e8")), inset: (bottom: 0.5em))[
      #text(size: 1.1em, it)
    ]
  }
  show heading.where(level: 2): it => {
    v(2.4em, weak: true)
    text(size: 1.05em, it)
    v(0.5em, weak: true)
  }

  // Titelblock: randlos, Marke auf Weiß, rote/goldene Leiste, Titelbereich
  let has-title-block = title != none
  if has-title-block {
    context { move(dx: -ut-xmargin, dy: -ut-ymargin, block(width: page.width, above: 0pt, below: 0pt, {
      block(width: 100%, inset: (x: ut-xmargin, y: 9mm), grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
        if ut-logo != none { image(content-to-string(ut-logo), height: 14mm) },
        {
          set text(size: 9pt)
          set par(leading: 0.5em)
          if faculty != none { text(fill: ut-anthrazit.transparentize(25%), faculty); linebreak() }
          if institute != none { strong(institute) }
        }))
      rect(width: 100%, height: 3mm, fill: ut-karminrot, stroke: none)
      rect(width: 100%, height: 1.1mm, fill: ut-mattgold, stroke: none)

      let inhalt = block(width: 100%, inset: (x: ut-xmargin, top: 16mm, bottom: 2mm))[
        #set par(leading: heading-line-height)
        #text(size: 2.3em, weight: "bold", fill: ut-karminrot)[#title]
        #v(0.2em)
        #line(length: 30mm, stroke: 0.9mm + ut-karminrot)
        #v(0.2em)
        #if subtitle != none { text(size: 1.15em)[#subtitle]; v(0.8em) }
        #let keyword(k) = box(width: 18mm, text(size: 0.75em, weight: "bold", fill: ut-mattgold, tracking: 0.06em, upper(k)))
        #if authors != none and authors != () {
          keyword(author-label)
          authors.map(a => a.name).join(", ")
          linebreak()
        }
        #if date != none { keyword(date-label); date }
      ]
      if particles {
        layout(size => {
          let h = measure(width: size.width, inhalt).height
          block(width: size.width, height: h, clip: true, {
            ut-particles(size.width, h, seed: particles-seed)
            inhalt
          })
        })
      } else { inhalt }
    }))
    v(-ut-ymargin + 3mm, weak: false)
    }
  }

  if abstract != none {
    block(inset: (y: 1em))[#text(weight: "bold")[#abstract-title] #h(1em) #abstract]
  }

  if toc {
    block(above: 0em, below: 2em)[
      #outline(title: toc_title, depth: toc_depth, indent: toc_indent)
    ]
  }

  doc
}

// Callouts flach: 3pt linker Rand, leichte Tönung (wie unitue-html).
// Die Struktur (Titelblock -> Inhalt) muss zu Quartos Figure-Show-Regel passen.
#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black, body_background_color: white) = {
  block(
    breakable: false,
    fill: icon_color.transparentize(94%),
    stroke: (left: 3pt + icon_color),
    width: 100%,
    radius: 0pt,
    block(
      inset: 1pt,
      width: 100%,
      below: 0pt,
      block(
        width: 100%,
        inset: (x: 8pt, y: 6pt))[#if icon != none [#text(icon_color, weight: 900)[#icon] ]#text(weight: "bold", fill: ut-anthrazit)[#title]]) +
      if (body != []) {
        block(
          inset: 1pt,
          width: 100%,
          block(width: 100%, inset: (x: 8pt, top: 0pt, bottom: 6pt), body))
      }
  )
}

// Tabellen: Kopfzeile mit anthrazitfarbener Linie, sonst feine Trennlinien
#set table(
  inset: (x: 8pt, y: 5pt),
  stroke: (x, y) => (
    bottom: if y == 0 { 1.2pt + ut-anthrazit } else { 0.4pt + rgb("#e3e6e8") },
  ),
)
#show table.cell.where(y: 0): set text(weight: "bold")

// unitue-brief: Geschäftsbrief im Corporate Design der Universität Tübingen
// Layout orientiert an UT_wiso_brief_1a_farbe_dt.dot (Briefbogen Wiso-Fakultät)
#let ut-karminrot = rgb("#A51E37")
#let ut-mattgold = rgb("#B4A069")
#let ut-anthrazit = rgb("#32414B")

#let brief(
  lang: "de",
  region: "DE",
  font: none,
  fontsize: 10.5pt,
  logo: none,
  university: [Eberhard Karls Universität Tübingen],
  faculty: none,
  institute: none,
  department: none,
  sender-name: none,
  contact-name: none,
  contact-function: none,
  phone: none,
  fax: none,
  email: none,
  web: none,
  reference: none,
  street: none,
  city: none,
  letter-date: none,
  recipient: (),
  subject: none,
  salutation: "Sehr geehrte Damen und Herren,",
  closing: "Mit freundlichen Grüßen",
  signature: none,
  enclosures: none,
  doc,
) = {
  set document(title: if subject != none { content-to-string(subject) } else { "" })
  set page(
    paper: "a4",
    margin: (top: 20mm, bottom: 25mm, left: 25mm, right: 20mm),
    footer: context {
      set text(size: 8pt, fill: ut-anthrazit.transparentize(25%))
      line(length: 100%, stroke: 0.6pt + ut-mattgold)
      v(-1mm)
      grid(columns: (1fr, auto),
        [#university · #street · #city],
        [Seite #counter(page).display() von #context counter(page).final().first()])
    },
    footer-descent: 6mm,
  )
  set par(justify: false, leading: 0.65em, spacing: 1.1em)
  set text(lang: lang, region: region, size: fontsize, fill: ut-anthrazit,
    font: if font != none { font } else { ("Arial", "Helvetica Neue", "Helvetica") })

  // Kopfbereich: Fakultät/Institut links, Logo und Absender rechts
  grid(columns: (1fr, 60mm), gutter: 6mm,
    align(left)[
      #if logo != none { logo }
    ],
    align(right)[
      #if faculty != none { text(size: 11pt, weight: "bold", fill: ut-karminrot, faculty); linebreak() }
      #if institute != none { text(size: 9.5pt, fill: ut-karminrot, institute); linebreak() }
      #if department != none { text(size: 9.5pt, department) }
      #v(3mm)
      #set text(size: 8pt, fill: ut-anthrazit.transparentize(20%))
      #set par(leading: 0.45em, spacing: 0.45em)
      #if contact-name != none [#contact-name \ ]
      #if contact-function != none [#contact-function \ ]
      #if phone != none [Telefon #phone \ ]
      #if fax != none [Telefax #fax \ ]
      #if email != none [#email \ ]
      #if web != none [#web]
    ],
  )

  // Fensterbereich DIN 5008: Anschrift links, Datum und Az/Gz rechts
  v(18mm)
  grid(columns: (1fr, 60mm), gutter: 6mm,
    block(height: 40mm)[
      #set text(size: 8pt, fill: ut-anthrazit.transparentize(25%))
      #if sender-name != none [#sender-name · #street · #city]
      #v(1.5mm)
      #set text(size: fontsize, fill: ut-anthrazit)
      #for line in recipient [#line \ ]
    ],
    align(right)[
      #set text(size: 9.5pt)
      #let heute = datetime.today().display("[day].[month].[year]")
      #if letter-date != none [Tübingen, den #if letter-date == "today" { heute } else { letter-date }]
      #v(4mm)
      #if reference != none [Az/Gz #reference]
    ],
  )

  v(4mm)
  if subject != none {
    text(weight: "bold", fill: ut-karminrot, subject)
    v(2mm)
  }
  if salutation != none { [#salutation] }
  doc
  v(8mm, weak: true)
  if closing != none { [#closing] }
  if signature != none {
    v(4mm, weak: true)
    signature
  } else {
    v(14mm, weak: true)
  }
  if sender-name != none { [#sender-name] }
  if enclosures != none {
    v(8mm, weak: true)
    text(size: 9pt)[Anlagen: #enclosures]
  }
}

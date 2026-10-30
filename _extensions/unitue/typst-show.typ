#show: doc => article(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(by-author)$
  authors: (
$for(by-author)$
$if(it.name.literal)$
    ( name: [$it.name.literal$],
      affiliation: [$for(it.affiliations)$$it.name$$sep$, $endfor$],
      email: [$it.email$] ),
$endif$
$endfor$
    ),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(abstract)$
  abstract: [$abstract$],
  abstract-title: "$labels.abstract$",
$endif$
$if(mainfont)$
  font: ("$mainfont$",),
$endif$
$if(fontsize)$
  fontsize: $fontsize$,
$endif$
$if(codefont)$
  codefont: ($for(codefont)$"$codefont$",$endfor$),
$endif$
$if(section-numbering)$
  sectionnumbering: "$section-numbering$",
$endif$
$if(toc)$
  toc: $toc$,
$endif$
$if(toc-title)$
  toc_title: [$toc-title$],
$endif$
  toc_depth: $toc-depth$,
$if(faculty)$
  faculty: [$faculty$],
$endif$
$if(institute)$
  institute: [$institute$],
$endif$
$if(ut-logo)$
  ut-logo: [$ut-logo$],
$endif$
$if(particles)$
  particles: true,
$endif$
$if(particles-seed)$
  particles-seed: $particles-seed$,
$endif$
$if(primary-color)$
  accent: [$primary-color$],
$endif$
$if(author-label)$
  author-label: [$author-label$],
$endif$
$if(date-label)$
  date-label: [$date-label$],
$endif$
  doc,
)

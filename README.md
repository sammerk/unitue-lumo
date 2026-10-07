# unitue-lumo

Ein Quarto-HTML-Format im Corporate Design der Eberhard Karls Universität Tübingen,
angelehnt an [Lumo](https://github.com/holtzy/lumo).

## Installation

Neues Projekt aus dem Template:

```bash
quarto use template sammerk/unitue-lumo
```

Nur die Extension in ein bestehendes Projekt einfügen:

```bash
quarto add sammerk/unitue-lumo
```

Dann im YAML-Header:

```yaml
format:
  unitue-html:
    institute: "Institut für Erziehungswissenschaft"
    faculty: "Wirtschafts- und Sozialwissenschaftliche Fakultät"
```

## Folien (revealjs)

Das Repo enthält zusätzlich das Format `unitue-revealjs`. Eine Beispielpräsentation liegt in
`slides.qmd`:

```yaml
format:
  unitue-revealjs:
    footer: "Name · Titel der Präsentation"
```

Das Layout ist an die Folien der VL Forschungsmethoden (C. Parrisius) angelehnt: zweispaltige
Titelfolie mit rundem Bild (Standard: Alte Aula, eigenes Bild über `title-image`), große
Überschriften in Karminrot, Logo unten rechts. `date` darf freier Text sein
(z. B. „Wintersemester 2026/27“); für echte Datumsangaben `date-format: long` setzen.
Kapiteltrennseiten entstehen über `#`-Überschriften, Inhaltsfolien über `##`.

## Optionen

| Option | Bedeutung |
|---|---|
| `institute`, `faculty` | Dachmarke rechts neben der Wort-Bild-Marke |
| `github-repo` | Blendet eine GitHub-Ecke mit Link ein |
| `particles` | `true` blendet ein dezentes, animiertes Netz in Mattgold im Titelbereich ein (wird bei „Bewegung reduzieren“ deaktiviert) |
| `bg-image` | Optionale Bildleiste unterhalb des Kopfbereichs |
| `primary-color` | Akzentfarbe (Links, Tabs, TOC) überschreiben |
| `author-label`, `date-label` | Beschriftungen im Titelblock (Standard: Autor, Datum) |

## Farben

Alle Farbwerte stammen aus dem CD-Leitfaden (Primärfarben S. 34, Sekundärfarben S. 35).
`template.qmd` definiert eine kategoriale Plotpalette `ut_palette` sowie
`scale_colour_ut()` und `scale_fill_ut()`:

Karminrot, Mattgold, Anthrazit, Blau, Hellblau, Violett, Ziegel, Ocker

Die Reihenfolge wurde so gewählt, dass die Farben auch bei simulierter Deuteranopie,
Protanopie und Tritanopie möglichst gut unterscheidbar bleiben (kleinster ΔE2000:
14,3 bei 4 Farben, 11,0 bei 8 Farben). Engpass ist Karminrot vs. Anthrazit unter
Protanopie. Ab etwa 5 Gruppen sollten zusätzlich Formen oder Linientypen genutzt werden.

## Nutzungshinweis

Das Corporate Design der Universität Tübingen und die Wort-Bild-Marke dürfen laut
CD-Leitfaden nur von Beschäftigten der Universität verwendet werden, die im Namen der
Universität kommunizieren. Fragen zum CD: design@cd.uni-tuebingen.de

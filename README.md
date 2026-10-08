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
Überschriften in Karminrot, Logo unten rechts. Für freien Text unter dem Namen
`semester: "Wintersemester 2026/27"` verwenden (Quarto würde ihn unter `date` als Datum
interpretieren); alternativ `date: last-modified` mit `date-format: long`.
Kapiteltrennseiten entstehen über `#`-Überschriften, Inhaltsfolien über `##`.

Mit `titel-qr: "https://…"` erscheint auf der Titelfolie statt des Bildes ein QR-Code
zur angegebenen Adresse (Karminrot, quadratischer Rahmen mit runden Ecken). Der Code wird
im Browser mit [qrcode.js](https://github.com/davidshimjs/qrcodejs) erzeugt; mit
`embed-resources: true` wird die Bibliothek eingebettet und funktioniert auch offline.

Der Folienhintergrund ist leicht abgedunkelt (6 % Anthrazit, #F3F4F4). Damit die rote
Wort-Bild-Marke CD-konform auf Weiß steht, liegt sie auf einem eigenen weißen Feld.
`slides.qmd` setzt ein ggplot-Theme mit transparentem Hintergrund, damit Plots sich einfügen.

Titelbild: Alte Aula der Universität Tübingen, Foto: Samuel Merk.

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
Universität kommunizieren.

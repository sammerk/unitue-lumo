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

## Quiz (exams2forms)

Dynamische Übungen aus dem R-Paket [R/exams](https://www.R-exams.org) lassen sich über
das Paket [exams2forms](https://www.r-exams.org/tutorials/exams2forms/) als interaktives
Quiz im CD der Universität Tübingen einbetten, z. B. für Selbstlerntests.

```r
library("exams2forms")
exams2forms(c("uebung1.Rmd", "uebung2.Rmd"), n = 3)
```

Der R-Chunk benötigt `#| results: asis`. Beide Pakete müssen installiert sein
(`install.packages(c("exams", "exams2forms"))`). Die Button-Beschriftungen
(Prüfen, Lösung, Nächste Frage) sind auf Deutsch lokalisiert; Farben (richtig:
Hellgrün, falsch: Ziegel, neutral/Rahmen: Blau) und Formsprache (scharfe Kanten,
Arial) sind an das CD angepasst – siehe `_extensions/unitue/webex.css` und
`webex.js`. Beide Dateien stammen aus dem `exams2forms`-Paket und wurden für das
CD angepasst (`:root`-Variablen und Beschriftungen am Dateianfang).

### In `unitue-html`

Funktioniert direkt: `webex.css`/`webex.js` sind Teil des `unitue-html`-Formats.
Ein eigenständiges Beispiel mit mehreren Übungen liegt in `quiz.qmd`.

### In `unitue-revealjs` (Folien)

`webex.js` verträgt sich **nicht** mit reveal.js (Navigation/Tastaturkürzel
brechen, siehe [dieser Stack-Overflow-Thread](https://stackoverflow.com/questions/79561442/exams2forms-in-quarto-reveal-js)).
`unitue-revealjs` bindet `webex.css`/`webex.js` deshalb bewusst **nicht** ein.

Stattdessen wird jede Quizfrage als eigene, schlanke HTML-Seite gerendert und per
`<iframe>` in die Folie eingebettet – analog zu
[diesem Beispiel](https://github.com/sammerk/VL-Forschungsmethoden-SoSe25/blob/master/Block01-Methodologie/Folien/index.qmd):

1. Quiz-Seite z. B. unter `aufgaben/<name>.qmd` anlegen (Vorlage:
   `aufgaben/swisscapital.qmd`). Diese nutzt bewusst das schlichte `html`-Format
   statt `unitue-html`, da der Kopfbereich (Logo, Dachmarke, Inhaltsverzeichnis,
   Fußzeile) in einem kleinen iframe zu viel Platz beanspruchen würde; Farben/Schrift
   kommen weiterhin über `unitue.scss` und `webex.css` aus dem CD.
2. Seite separat rendern: `quarto render aufgaben/<name>.qmd`.
3. In der Folie einbetten:

   ```html
   <iframe width="900" height="480" src="aufgaben/<name>.html" title="Quizfrage"></iframe>
   ```

Siehe das Beispiel am Ende von `slides.qmd`.

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

// Template do TCC — Manual SENAI-SP 2025 (capítulo 5).
// Este arquivo concentra a formatação. Os alunos não devem alterá-lo.

#let fonte = "Arial"

// Marca o início dos elementos textuais. O número de página só aparece
// a partir daqui (manual, 2.8).
#let inicio-textual = state("inicio-textual", false)

// Título de elemento sem indicativo numérico (manual, 2.5):
// centralizado, maiúsculas, negrito, mesmo corpo das seções primárias.
#let titulo-sem-numero(texto) = align(
  center,
  text(size: 12pt, weight: "bold", upper(texto)),
)

#let configurar(d, corpo) = {
  set page(
    paper: "a4",
    margin: (top: 3cm, left: 3cm, bottom: 2cm, right: 2cm),
    // O número de página fica a 2 cm da borda superior (manual, 2.8).
    header-ascent: 0.75cm,
    header: context {
      if inicio-textual.get() {
        set text(size: 10pt, font: fonte)
        align(right, str(counter(page).get().first()))
      }
    },
  )

  set text(font: fonte, size: 12pt, lang: "pt", region: "BR", hyphenate: false)
  set par(justify: true, leading: 1em, first-line-indent: 1.25cm)
  set heading(numbering: "1.1.1.1.1")
  set figure.caption(separator: [ – ])
  show figure.caption: set text(size: 10pt)
  show figure.where(kind: image): set figure.caption(position: top)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: "quadro"): set figure.caption(position: top)

  show heading: it => {
    let num = if it.numbering != none {
      numbering(it.numbering, ..counter(heading).at(it.location()))
    } else {
      none
    }
    let prefixo = if num == none { [] } else { [#num ] }
    let corpo-titulo = prefixo + if it.level == 1 { upper(it.body) } else { it.body }

    if it.level == 1 {
      pagebreak(weak: true)
    }

    if it.level == 1 and it.numbering == none {
      // Elemento pós-textual sem número: centralizado (manual, 2.5 e 5.4).
      align(center, text(size: 12pt, weight: "bold", upper(it.body)))
    } else {
      block(above: 1.5em, below: 1.5em, sticky: true)[
        #set par(first-line-indent: 0pt)
        #if it.level == 1 {
          text(size: 12pt, weight: "bold", corpo-titulo)
        } else if it.level == 2 {
          text(size: 12pt, weight: "bold", corpo-titulo)
        } else if it.level == 3 {
          text(size: 12pt, weight: "bold", style: "italic", corpo-titulo)
        } else if it.level == 4 {
          text(size: 12pt, style: "italic", corpo-titulo)
        } else {
          underline(text(size: 12pt, corpo-titulo))
        }
      ]
    }
  }

  corpo
}

// ---------- Capa (manual, 5.2.1) ----------
#let capa(d) = block(height: 100%)[
  #set par(justify: false, first-line-indent: 0pt, leading: 1em)
  #align(center)[
    #text(size: 12pt, weight: "bold", upper(d.instituicao))
    #linebreak()
    #text(size: 12pt, weight: "bold", upper(d.unidade))
  ]
  #v(0.5em)
  #align(center, text(size: 12pt, weight: "bold", upper(d.curso)))
  #v(1fr)
  #align(center, text(size: 12pt, weight: "bold", d.autores.map(upper).join(linebreak())))
  #v(1.9fr)
  #align(center)[
    #text(
      size: 12pt,
      weight: "bold",
      upper(d.titulo) + if d.subtitulo != none { ":" } else { "" },
    )
    #if d.subtitulo != none [
      #linebreak()
      #text(size: 12pt, weight: "bold", upper(d.subtitulo))
    ]
  ]
  #v(3.7fr)
  #align(center)[
    #text(size: 12pt, weight: "bold", upper(d.cidade))
    #linebreak()
    #text(size: 12pt, weight: "bold", d.ano)
  ]
]

// ---------- Folha de rosto (manual, 5.2.3) ----------
#let folha-de-rosto(d) = block(height: 100%)[
  #set par(justify: false, first-line-indent: 0pt, leading: 1em)
  #align(center, text(size: 12pt, weight: "bold", d.autores.map(upper).join(linebreak())))
  #v(4.5cm)
  #align(center)[
    #text(
      size: 12pt,
      weight: "bold",
      upper(d.titulo) + if d.subtitulo != none { ":" } else { "" },
    )
    #if d.subtitulo != none [
      #linebreak()
      #text(size: 12pt, weight: "bold", d.subtitulo)
    ]
  ]
  #v(3cm)
  #block(inset: (left: 8cm))[
    #set par(justify: true, first-line-indent: 0pt, leading: 0.43em)
    #set text(hyphenate: true)
    #text(size: 12pt, d.natureza)
    #v(1em)
    #text(size: 12pt)[Orientador: #d.orientador]
    #if d.coorientador != none [
      #linebreak()
      #text(size: 12pt)[Coorientador: #d.coorientador]
    ]
  ]
  #v(1fr)
  #align(center)[
    #text(size: 12pt, weight: "bold", upper(d.cidade))
    #linebreak()
    #text(size: 12pt, weight: "bold", d.ano)
  ]
]

// ---------- Folha de aprovação (manual, 5.2.5) ----------
#let folha-de-aprovacao(d) = block(height: 100%)[
  #set par(justify: false, first-line-indent: 0pt, leading: 1em)
  #align(center, text(size: 12pt, weight: "bold", d.autores.map(upper).join(linebreak())))
  #v(4.5cm)
  #align(center)[
    #text(
      size: 12pt,
      weight: "bold",
      upper(d.titulo) + if d.subtitulo != none { ":" } else { "" },
    )
    #if d.subtitulo != none [
      #linebreak()
      #text(size: 12pt, weight: "bold", d.subtitulo)
    ]
  ]
  #v(3cm)
  #block(inset: (left: 8cm))[
    #set par(justify: true, first-line-indent: 0pt, leading: 0.43em)
    #set text(hyphenate: true)
    #text(size: 12pt, d.natureza)
    #v(1em)
    #text(size: 12pt)[Orientador: #d.orientador]
    #if d.coorientador != none [
      #linebreak()
      #text(size: 12pt)[Coorientador: #d.coorientador]
    ]
    #v(1.2cm)
    #text(size: 12pt)[Aprovado em: #d.data-aprovacao]
  ]
  #v(0.75cm)
  #for examinador in d.banca [
    #block(inset: (left: 8cm))[
      #line(length: 100%)
      #align(center, text(size: 12pt)[#examinador.nome])
      #align(center, text(size: 12pt)[#examinador.titulo — #examinador.instituicao])
    ]
    #v(0.8cm)
  ]
  #v(1fr)
]

// ---------- Resumo e abstract (manual, 5.2.9 e 5.2.10) ----------
#let bloco-resumo(titulo, texto, rotulo, palavras) = {
  titulo-sem-numero(titulo)
  v(1.5em)
  block[
    #set par(first-line-indent: 0pt)
    #texto
  ]
  v(1.5em)
  block[
    #set par(first-line-indent: 0pt)
    *#rotulo:* #palavras.
  ]
}

// ---------- Sumário (manual, 5.2.15) ----------
#let sumario() = {
  titulo-sem-numero([SUMÁRIO])
  v(1.5em)
  show outline.entry: it => {
    let corpo = if it.level == 1 { upper(it.body()) } else { it.body() }
    let peso = if it.level <= 2 { "bold" } else { "regular" }
    let estilo = if it.level == 3 { "italic" } else { "normal" }
    link(
      it.element.location(),
      {
        if it.level == 1 { v(0.75em) }
        grid(
          columns: (4em, 1fr, auto),
          column-gutter: 0.5em,
          align: (left, left, right),
          text(weight: peso, style: estilo, it.prefix()),
          text(weight: peso, style: estilo, corpo) + h(0.3em) + box(width: 1fr, it.fill),
          text(weight: peso, style: estilo, it.page()),
        )
      },
    )
  }
  outline(title: none, depth: 5)
}

// ---------- Referências (manual, 5.4.1; NBR 6023) ----------
#let referencias(arquivo) = {
  heading(numbering: none, level: 1)[Referências]
  set par(justify: false, first-line-indent: 0pt, leading: 0.43em)
  bibliography(arquivo, style: "associacao-brasileira-de-normas-tecnicas", title: none)
}

// ---------- Citação direta longa (manual, 2.1 e 3.3; NBR 10520) ----------
// Use para citações com mais de três linhas: recuo de 4 cm,
// espaçamento simples e fonte 10.
#let citacao-longa(corpo) = block(
  inset: (left: 4cm),
  above: 1em,
  below: 1em,
  {
    set par(justify: false, leading: 0.43em, first-line-indent: 0pt)
    set text(size: 10pt)
    corpo
  },
)

// ---------- Figura (manual, 2.11) ----------
// Legenda acima (tipo, número, travessão e título) e fonte abaixo,
// ambas em fonte 10. A fonte faz parte do bloco da figura para não
// se separar dela na quebra de página.
#let figura(caminho, legenda, fonte: none, largura: 100%) = figure(
  stack(
    align(center, image("/" + caminho, width: largura)),
    if fonte != none {
      v(0.5em)
      align(center, text(size: 10pt)[Fonte: #fonte])
    },
  ),
  caption: legenda,
  kind: image,
  supplement: [Figura],
  numbering: "1",
)

// ---------- Tabela e quadro (manual, 2.12) ----------
// Legenda acima e fonte abaixo, ambas em fonte 10.
// Tabelas e quadros têm numeração independente (manual, pp. 10-11).
#let tabela(corpo, legenda, fonte: none, tipo: [Tabela]) = {
  let chave = if tipo == [Tabela] { table } else { "quadro" }
  figure(
    stack(
      corpo,
      if fonte != none {
        v(0.5em)
        align(center, text(size: 10pt)[Fonte: #fonte])
      },
    ),
    caption: legenda,
    kind: chave,
    supplement: tipo,
    numbering: "1",
  )
}

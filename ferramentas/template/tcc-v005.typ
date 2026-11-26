// v005 | 26/11/2026 | sumario (P-05), contagem de palavras (P-04), recuo de paragrafo, citacao e nota (P-07)
// Template do TCC — Manual SENAI-SP 2025 (capítulo 5).
// Este arquivo concentra a formatação. É uma versão publicada: não edite.
// Correções geram uma nova versão (tcc-v002.typ) em ferramentas/template.

#let fonte = "Arial"

// Versão do template, informada pelo gerar-pdf.bat com
// --input versao-template=vNNN. O padrão cobre compilação manual.
#let versao-template = sys.inputs.at("versao-template", default: "nao-informada")

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
  // Registra nos metadados do PDF qual versão do template foi usada.
  set document(
    title: d.titulo,
    author: d.autores,
    keywords: ("template-" + versao-template, "typist"),
  )

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
  // O recuo de 1,25 cm vale para todos os paragrafos, inclusive o
  // primeiro depois de um titulo (manual, 2.3).
  set par(justify: true, leading: 1em, first-line-indent: (amount: 1.25cm, all: true))
  // O CSL ABNT insere dois espacos antes da pagina na citacao
  // ("Luck, 2010,  p. 15"); normaliza para um espaco.
  show regex("  "): " "
  set heading(numbering: "1.1.1.1.1")
  set figure.caption(separator: [ – ])
  show figure.caption: it => {
    let num = if it.numbering != none {
      numbering(it.numbering, ..it.counter.at(it.location()))
    } else {
      none
    }
    block(
      width: 100%,
      above: 0.5em,
      below: 0.5em,
      align(left, text(size: 10pt)[
        #if num != none [*#it.supplement #num*]
        #it.separator
        #it.body
      ]),
    )
  }
  show figure.where(kind: image): set figure.caption(position: top)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: "quadro"): set figure.caption(position: top)
  // Notas de rodapé em espaço simples, fonte 10 e segunda linha
  // alinhada abaixo da primeira palavra da nota (manual, 2.7).
  show footnote.entry: it => {
    set par(leading: 0.43em, first-line-indent: 0pt)
    let marca = numbering(it.note.numbering, ..counter(footnote).at(it.note.location()))
    grid(
      columns: (auto, 1fr),
      column-gutter: 0.25em,
      align: (right + top, left + top),
      super(text(size: 10pt, marca)),
      text(size: 10pt, it.note.body),
    )
  }

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
      #align(center, text(size: 12pt)[#examinador.at("titulo", default: "") #examinador.nome])
      #align(center, text(size: 12pt)[#examinador.instituicao])
    ]
    #v(0.8cm)
  ]
  #v(1fr)
]

// ---------- Resumo e abstract (manual, 5.2.9 e 5.2.10) ----------
// Conta as palavras de um conteudo, percorrendo o texto e os elementos
// que o envolvem (negrito, italico, link, nota).
#let contar-palavras(conteudo) = {
  let contar(c) = {
    let n = 0
    if c.func() == text {
      n += c.text.split(regex("\\s+")).filter(s => s != "").len()
    }
    if c.has("children") {
      for filho in c.children { n += contar(filho) }
    }
    if c.has("body") { n += contar(c.body) }
    n
  }
  contar(conteudo)
}

#let bloco-resumo(titulo, texto, rotulo, palavras, limite: 500) = {
  let total = contar-palavras(texto)
  if total > limite {
    panic("O texto tem " + str(total) + " palavras e o manual (5.2.9, item h) limita o resumo a " + str(limite) + ". Reduza o texto.")
  }
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

// ---------- Sumário (manual, 5.2.15; NBR 6027) ----------
// O sumário repete o destaque usado no texto (manual, 2.4; NBR 6027, 6.2):
// nível 1 maiúsculas e negrito, 2 negrito, 3 negrito e itálico,
// 4 itálico e 5 sublinhado.
#let sumario() = {
  titulo-sem-numero([SUMÁRIO])
  v(1.5em)
  show outline.entry: it => {
    let corpo = if it.level == 1 { upper(it.body()) } else { it.body() }
    let peso = if it.level <= 3 { "bold" } else { "regular" }
    let estilo = if it.level == 3 or it.level == 4 { "italic" } else { "normal" }
    // Nível 5 recebe sublinhado, como no texto.
    let destaque(conteudo) = {
      let conteudo = text(weight: peso, style: estilo, conteudo)
      if it.level == 5 { underline(conteudo) } else { conteudo }
    }
    link(
      it.element.location(),
      {
        if it.level == 1 { v(0.75em) }
        grid(
          columns: (5.5em, 1fr, auto),
          column-gutter: 0.5em,
          align: (left, left, right),
          destaque(it.prefix()),
          destaque(corpo) + h(0.3em) + box(width: 1fr, it.fill),
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
    set par(justify: true, leading: 0.43em, first-line-indent: 0pt)
    set text(size: 10pt)
    corpo
  },
)

// ---------- Nota de rodapé (manual, 2.1 e 2.3) ----------
// A nota é impressa em fonte 10 e com espaçamento simples.
// Use "#nota[texto]" no lugar de "#footnote[texto]".
#let nota(corpo) = footnote(text(size: 10pt, corpo))

// ---------- Figura (manual, 2.11) ----------
// Legenda acima (tipo, número, travessão e título) e fonte abaixo,
// ambas em fonte 10. A fonte faz parte do bloco da figura para não
// se separar dela na quebra de página.
#let figura(caminho, legenda, fonte: none, largura: 100%) = align(
  center,
  block(
    width: largura,
    figure(
      block(width: 100%, {
        align(center, image("/" + caminho, width: 100%))
        if fonte != none {
          v(0.5em)
          align(left, text(size: 10pt)[*Fonte:* #fonte])
        }
      }),
      caption: legenda,
      kind: image,
      supplement: [Figura],
      numbering: "1",
    ),
  ),
)

// ---------- Tabela e quadro (manual, 2.12) ----------
// Legenda acima e fonte abaixo, ambas em fonte 10.
// Tabelas e quadros têm numeração independente (manual, pp. 10-11).
#let tabela(corpo, legenda, fonte: none, tipo: [Tabela]) = {
  let chave = if tipo == [Tabela] { table } else { "quadro" }
  figure(
    block(width: 100%, {
      corpo
      if fonte != none {
        v(0.5em)
        align(left, text(size: 10pt)[*Fonte:* #fonte])
      }
    }),
    caption: legenda,
    kind: chave,
    supplement: tipo,
    numbering: "1",
  )
}

// ---------- Referência manual: anais de evento (manual, 4.6) ----------
// Use quando o CSL não formatar o anais corretamente. Coloque o sobrenome
// do autor em negrito (como nas referências do .bib). A entrada deve ser
// inserida na posição alfabética correta, após #referencias(...).
#let anais(autor, titulo, container, local, data, url: none, acesso: none) = {
  set par(justify: false, first-line-indent: 0pt, leading: 0.43em)
  [#autor #titulo. In: #container. #local, #data.]
  if url != none [ Disponível em: #url.]
  if acesso != none [ Acesso em: #acesso.]
}

// ---------- Referência manual: patente (manual, 4.7) ----------
#let patente(autores, titulo, depositante, numero, deposito, procurador: none, concessao: none) = {
  set par(justify: false, first-line-indent: 0pt, leading: 0.43em)
  [#autores #titulo. Depositante: #depositante.]
  if procurador != none [ Procurador: #procurador.]
  [ #numero. Depósito: #deposito.]
  if concessao != none [ Concessão: #concessao.]
}

// ---------- Referência manual: entrada genérica (manual, 4) ----------
#let referencia-manual(corpo) = {
  set par(justify: false, first-line-indent: 0pt, leading: 0.43em)
  corpo
}

#let lista-de-ilustracoes() = {
  pagebreak()
  titulo-sem-numero([LISTA DE ILUSTRAÇÕES])
  show outline.entry: it => link(
    it.element.location(),
    it.prefix() + [ – ] + it.body() + h(0.3em) + box(width: 1fr, it.fill) + [ ] + it.page(),
  )
  outline(title: none, target: figure.where(kind: image), depth: 1)
  outline(title: none, target: figure.where(kind: "quadro"), depth: 1)
}

#let lista-de-tabelas() = {
  pagebreak()
  titulo-sem-numero([LISTA DE TABELAS])
  show outline.entry: it => link(
    it.element.location(),
    it.prefix() + [ – ] + it.body() + h(0.3em) + box(width: 1fr, it.fill) + [ ] + it.page(),
  )
  outline(title: none, target: figure.where(kind: table), depth: 1)
}

#let glossario(corpo) = {
  pagebreak()
  heading(numbering: none, level: 1)[GLOSSÁRIO]
  set par(first-line-indent: 0pt, justify: false)
  corpo
}

#let errata(referencia, tabela) = {
  pagebreak()
  titulo-sem-numero([ERRATA])
  set par(first-line-indent: 0pt, justify: false)
  referencia
  v(1em)
  tabela
}

#let dedicatoria(corpo) = {
  pagebreak()
  block(height: 100%)[
    #v(1fr)
    #block(inset: (left: 8cm))[
      #set par(first-line-indent: 0pt, justify: false)
      #corpo
    ]
  ]
}

#let epigrafe(corpo, autor: none) = {
  pagebreak()
  block(height: 100%)[
    #v(1fr)
    #block(inset: (left: 8cm))[
      #set par(first-line-indent: 0pt, justify: false)
      #corpo
      #if autor != none [
        #linebreak()
        #h(1fr) #autor
      ]
    ]
  ]
}

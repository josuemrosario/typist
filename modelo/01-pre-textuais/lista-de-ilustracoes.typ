#import "../tcc.typ": titulo-sem-numero

// LISTA DE ILUSTRAÇÕES — elemento opcional (manual, 5.2.11), depois dos
// resumos. Relaciona figuras e quadros na ordem em que aparecem no
// texto, com o número da página. A lista é gerada pelo Typst a partir
// dos elementos #figura() e #tabela(tipo: [Quadro]) do trabalho.
// Ela só faz sentido quando o grupo já inseriu figuras ou quadros.
// Para ativar, remova o "//" do #include correspondente em main.typ.
//
// Ressalva: o título de cada item sai sem o travessão entre o número e
// a legenda (o manual pede "Figura 1 – Título"). A correção depende de
// uma função própria no template (ver docs/PENDENCIAS.md).

#pagebreak()
#titulo-sem-numero([LISTA DE ILUSTRAÇÕES])
#outline(title: none, target: figure.where(kind: image), depth: 1)
#outline(title: none, target: figure.where(kind: "quadro"), depth: 1)

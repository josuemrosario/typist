#import "../tcc.typ": titulo-sem-numero

// LISTA DE TABELAS — elemento opcional (manual, 5.2.12), depois da
// lista de ilustrações. Relaciona as tabelas na ordem em que aparecem
// no texto, com o número da página. A lista é gerada pelo Typst a
// partir dos elementos #tabela() do trabalho.
// Para ativar, remova o "//" do #include correspondente em main.typ.
//
// Ressalva: o título de cada item sai sem o travessão entre o número e
// a legenda (o manual pede "Tabela 1 – Título"). A correção depende de
// uma função própria no template (ver docs/PENDENCIAS.md).

#pagebreak()
#titulo-sem-numero([LISTA DE TABELAS])
#outline(title: none, target: figure.where(kind: table), depth: 1)

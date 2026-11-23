#import "../tcc.typ": errata

// ERRATA — elemento condicionado à necessidade (manual, 5.2.4).
// Entra logo depois da folha de rosto e só é usado quando o trabalho
// já impresso precisa de correção. Para ativar, remova o "//" do
// #include correspondente em main.typ.
//
// Preencha a referência completa do trabalho e a tabela de correções,
// com as colunas Folha, Linha, Onde se lê e Leia-se. Exemplo de
// referência:
//
//   SILVA, Antonia da. Administração da produção. São Paulo: Artller, 2010.
//
// A formatação (título centralizado, tabela com travessão) vem do
// template, via #errata.

#pagebreak()
#errata(
  [SILVA, Antonia da. Administração da produção. São Paulo: Artller, 2010.],
  table(
    columns: (auto, auto, 1fr, 1fr),
    [Folha], [Linha], [Onde se lê], [Leia-se],
    [12], [3], [produção], [produção industrial],
  ),
)

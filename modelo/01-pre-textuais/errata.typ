#import "../tcc.typ": titulo-sem-numero

// ERRATA — elemento condicionado à necessidade (manual, 5.2.4).
// Entra logo depois da folha de rosto e só é usado quando o trabalho
// já impresso precisa de correção. Para ativar, remova o "//" do
// #include correspondente em main.typ.
//
// Depois do título, escreva a referência completa do trabalho e a
// tabela de correções, com as colunas Folha, Linha, Onde se lê e
// Leia-se. Exemplo de referência:
//
//   SILVA, Antonia da. Administração da produção. São Paulo: Artller, 2010.
//
// A tabela da errata ainda não tem função própria no template; use
// table() simples e confira a apresentação com o professor.

#pagebreak()
#titulo-sem-numero([ERRATA])

#import "../tcc.typ": bloco-resumo

// Escreva o resumo em um único parágrafo, de 150 a 500 palavras
// (manual, 5.2.9). Informe objetivo, método, resultados e conclusão.
// Informe também a categoria do trabalho (projeto, estudo de caso etc.).
//
// O template conta as palavras e interrompe a compilação, com uma
// mensagem, quando o texto passa de 500 palavras. O mínimo de 150
// não é verificado automaticamente.
#bloco-resumo(
  [RESUMO],
  [
    Este trabalho apresenta o desenvolvimento de um projeto técnico realizado
    pelos alunos do curso técnico. O objetivo foi verificar a viabilidade de
    uma solução para o problema estudado. A metodologia adotada foi a pesquisa
    bibliográfica e a realização de testes em laboratório. Os resultados
    obtidos demonstraram que a solução proposta atende aos requisitos
    definidos. Conclui-se que o projeto é viável e pode ser aplicado na
    prática, com as devidas adaptações.
  ],
  [Palavras-chave],
  "educação profissional; projeto técnico; viabilidade",
)

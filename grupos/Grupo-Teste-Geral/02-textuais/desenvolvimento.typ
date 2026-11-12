#import "../tcc.typ": citacao-longa, figura, tabela, nota

= Desenvolvimento

== Texto, parágrafos e citações

A composição de documentos técnicos exige consistência entre estrutura, conteúdo e apresentação. O uso de ferramentas automatizadas pode reduzir tarefas repetitivas, desde que as regras estejam centralizadas e sejam verificadas em situações reais. Segundo @exemplo2025, a organização do documento é parte importante do processo de produção editorial. Este é um exemplo de citação indireta gerada a partir de uma entrada bibliográfica.

A citação seguinte serve para verificar a apresentação de um trecho destacado. O texto é fictício e foi criado exclusivamente para este teste, não sendo transcrição de uma publicação real:

#citacao-longa[Este trecho demonstrativo foi inserido para verificar o recuo à esquerda, o tamanho de fonte reduzido e o espaçamento simples de uma citação longa. A finalidade é observar se o bloco permanece visualmente separado do texto principal e se a composição respeita a largura útil da página. Como se trata de conteúdo sintético, ele não deve ser utilizado como citação em um trabalho acadêmico real.]

A referência de artigo também será chamada no texto para verificar a apresentação de múltiplos autores: @teste2024. A saída bibliográfica deverá ser conferida quanto à pontuação, aos elementos exibidos e à aderência à NBR 6023:2025.

== Figura e legenda

A figura a seguir verifica a inclusão de um arquivo externo em formato SVG, a largura da imagem, a legenda numerada e a indicação de fonte.

#figura("imagens/grafico-teste.svg", [Valores demonstrativos por categoria], fonte: [Elaborado para este teste.], largura: 85%)

== Tabela e quadro

#tabela(
  table(
    columns: 3,
    align: (left, center, center),
    [*Recurso*], [*Situação esperada*], [*Verificação*],
    [Capa], [Gerada], [Visual],
    [Sumário], [Automático], [Numeração],
    [Figura], [Com legenda], [Imagem],
    [Referências], [Automáticas], [Ordem e estilo],
  ),
  [Recursos incluídos no teste geral],
  fonte: [Elaborado para este teste.],
)

#tabela(
  table(
    columns: 2,
    [*Item*], [*Descrição*],
    [Ambiente], [Windows e compilador Typst],
    [Entrada], [Arquivo principal e módulos],
    [Saída], [Documento PDF versionado],
  ),
  [Elementos do procedimento experimental],
  fonte: [Elaborado para este teste.],
  tipo: [Quadro],
)

== Lista, nota e expressão matemática

A avaliação do PDF deverá observar os seguintes pontos:

1. Se os elementos aparecem na ordem correta.
2. Se os títulos e subtítulos mantêm hierarquia visual.
3. Se as legendas e fontes acompanham seus elementos.
4. Se as referências aparecem ao final do documento.

Este parágrafo contém uma nota de rodapé para verificar sua posição e apresentação. #nota[Nota fictícia utilizada apenas para verificar o recurso de notas de rodapé.]

Uma expressão matemática simples também foi incluída: $ A = (b times h) / 2 $, para observar a composição de símbolos e frações.

=== Texto adicional para testar paginação

A geração de documentos com várias páginas permite verificar aspectos que não aparecem em um arquivo mínimo. É importante observar se os títulos ficam separados do conteúdo, se as figuras não ultrapassam as margens, se tabelas podem ser lidas e se as quebras de página não deixam grandes espaços vazios. Também é necessário conferir se a numeração das páginas começa no ponto previsto pelo manual institucional e se permanece contínua até o final do trabalho.

A repetição deste parágrafo é intencional: ela aumenta o volume de texto e permite observar a distribuição dos blocos em páginas consecutivas. Em um trabalho real, o conteúdo deverá ser substituído por texto autoral, fundamentado em fontes verificáveis e acompanhado das citações correspondentes.

A composição automatizada não elimina a necessidade de revisão. Mesmo quando o arquivo compila sem erros, podem existir problemas de alinhamento, hifenização, posicionamento de legendas, paginação, referências ou compatibilidade com as exigências institucionais. Por isso, o resultado deste teste deverá ser comparado visualmente com o Manual de Normalização de Trabalhos Acadêmicos do SENAI-SP, edição de setembro de 2025.

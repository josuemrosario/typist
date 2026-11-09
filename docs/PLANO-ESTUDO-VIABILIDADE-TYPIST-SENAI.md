# Estudo de Viabilidade do Typst para Trabalhos Acadêmicos do SENAI-SP

**Documento mestre do projeto**  
**Versão:** 1.0  
**Data de criação:** 15/10/2026  
**Status:** Planejamento — testes ainda não executados

---

## 1. Finalidade deste projeto

Este projeto será utilizado exclusivamente para estudar a viabilidade de adotar o **Typst** na produção de trabalhos acadêmicos conforme o *Manual de Normalização de Trabalhos Acadêmicos — Ensino Superior SENAI-SP, setembro de 2025*.

O estudo não pressupõe que o Typst será adotado. A decisão será tomada somente depois de testes documentados e comparação dos resultados com os requisitos do manual e com as necessidades práticas dos grupos.

O foco é construir um protótipo pequeno, reproduzível e verificável, evitando desenvolver antecipadamente uma infraestrutura completa.

## 2. Objetivo geral

Verificar se o Typst pode ser utilizado como sistema de composição e geração de PDF para trabalhos acadêmicos do SENAI-SP, com uma estrutura compartilhada e portátil, arquivos de conteúdo separados por grupo e uma estratégia aceitável para produzir documentos Word editáveis.

## 3. Contexto e necessidades

O projeto pretende avaliar uma solução que possa atender a oito grupos de trabalho, com:

- Um compilador Typst compartilhado, quando tecnicamente viável.
- Um template institucional comum.
- Arquivos de conteúdo separados por capítulo e por grupo.
- Imagens e referências bibliográficas organizadas por trabalho.
- Scripts de compilação que evitem caminhos absolutos e instalações globais sempre que possível.
- Geração de PDF local e, como hipótese a testar, geração automatizada no GitHub.
- Uma estratégia prática para produzir DOCX editável, sem presumir que a conversão de PDF para Word preservará a formatação.

O Typst é a tecnologia sob avaliação, não uma decisão definitiva de arquitetura.

## 4. Fonte normativa principal

A referência institucional principal é:

**SENAI-SP. Manual de Normalização de Trabalhos Acadêmicos. Ensino Superior SENAI-SP. Setembro de 2025. Terceira edição.**

As normas ABNT disponibilizadas para consulta no projeto são fontes complementares:

- ABNT NBR 14724:2024 — Trabalhos acadêmicos — Apresentação.
- ABNT NBR 6023:2025 — Referências — Elaboração.
- ABNT NBR 10520:2023 — Citações em documentos — Apresentação.
- ABNT NBR 6024:2012 — Numeração progressiva das seções de um documento.
- ABNT NBR 6027:2012 — Sumário — Apresentação.
- ABNT NBR 6028 — Resumo, resenha e recensão — Apresentação.
- ABNT NBR 6034:2004 — Índice — Apresentação.
- ABNT NBR 15287:2025 — Projeto de pesquisa — Apresentação.

**Regra:** quando uma exigência institucional estiver descrita no manual SENAI-SP, ela deve ser avaliada conforme esse manual. Não presumir que um template genérico chamado “ABNT” seja automaticamente compatível.

### 4.1 Requisitos de formatação a conferir

O manual SENAI-SP inclui, entre outros requisitos, os seguintes parâmetros para trabalhos acadêmicos:

- Papel A4.
- Fonte Arial tamanho 12 no texto geral.
- Fonte Arial tamanho 10 para elementos específicos indicados no manual, como citações longas, notas, paginação, legendas e fontes de ilustrações e tabelas.
- Margens superior e esquerda de 3 cm; inferior e direita de 2 cm, para a configuração de página descrita no manual.
- Texto justificado.
- Recuo de primeira linha e espaçamento conforme a seção aplicável do manual.
- Regras próprias para capa, folha de rosto, folha de aprovação, elementos pré-textuais, títulos, sumário, paginação, citações, ilustrações, tabelas e referências.

Esta lista é um roteiro inicial, não uma transcrição completa do manual. Antes de declarar conformidade, consultar as seções e modelos pertinentes do documento oficial.

## 5. Perguntas que o estudo precisa responder

1. O compilador Typst para Windows funciona sem instalação global?
2. Quais são o tamanho do download e do executável extraído, e quais arquivos adicionais são necessários?
3. É possível compilar por um script `.bat` com caminhos relativos, inclusive quando a pasta do projeto é movida?
4. É possível reproduzir as exigências do manual SENAI-SP com precisão aceitável?
5. É possível dividir o documento em arquivos, mantendo configuração e template separados do conteúdo?
6. Um único compilador e um único template podem servir aos oito grupos sem misturar arquivos?
7. Como o Typst gerencia citações e referências? Há um estilo bibliográfico compatível com as normas e com o manual, ou será preciso adaptá-lo?
8. Como ficam as citações autor-data, citações diretas curtas e longas e os diferentes tipos de referências?
9. Qual é a melhor estratégia para obter um DOCX editável?
10. É possível compilar o trabalho no GitHub Actions? Quais são as limitações de custo, permissões, fontes e recursos?
11. Qual é o esforço de manutenção do template depois de criado?
12. Comparado ao fluxo Pandoc + Eisvogel, qual solução oferece o melhor equilíbrio entre portabilidade, fidelidade visual, referências, Word e manutenção?

## 6. Escopo

### Incluído

- Teste do compilador Typst em Windows.
- Protótipo de template para PDF conforme o manual SENAI-SP.
- Configuração de páginas, fontes, títulos e paginação.
- Capa, folha de rosto e folha de aprovação.
- Sumário e estrutura de capítulos.
- Figuras, tabelas e caminhos relativos.
- Citações e referências bibliográficas.
- Organização em arquivos separados.
- Teste com duas pastas de grupos independentes.
- Script de compilação local.
- Investigação da compilação no GitHub Actions.
- Teste comparativo de DOCX, incluindo conversão PDF → Word e uma rota alternativa baseada em fonte intermediária.
- Registro de limitações, esforço e resultados.

### Fora do escopo inicial

- Produzir imediatamente um template institucional completo e definitivo.
- Migrar os trabalhos reais dos oito grupos.
- Declarar conformidade normativa sem verificação.
- Presumir que conversão de PDF para Word produzirá um documento perfeitamente editável.
- Configurar uma infraestrutura de produção antes de terminar os testes.
- Abandonar Pandoc + Eisvogel antes de comparar resultados.

## 7. Plano de trabalho

### Etapa 1 — Compilação mínima e portabilidade

**Objetivo:** confirmar que o Typst compila um documento mínimo e avaliar se pode ser distribuído junto ao projeto.

**Atividades**
1. Identificar a versão estável adequada para Windows.
2. Baixar o pacote oficial e registrar a origem.
3. Medir o tamanho do arquivo baixado e do executável extraído.
4. Criar um arquivo `teste.typ` com título e parágrafo.
5. Compilar o PDF pela linha de comando.
6. Criar um `.bat` que localize o executável a partir da pasta do projeto.
7. Mover uma cópia da pasta de teste para outro caminho e repetir a compilação.
8. Registrar fontes, cache ou outros recursos que sejam necessários.

**Critérios de aprovação**
- PDF criado corretamente.
- Compilação sem instalar MiKTeX ou TeX Live.
- Caminhos relativos funcionando após mover a pasta, ou limitações claramente documentadas.

**Evidências:** comandos utilizados, versão, tamanhos medidos, logs e PDF de teste.

### Etapa 2 — Protótipo visual SENAI-SP

**Objetivo:** descobrir se o Typst consegue representar os requisitos centrais do manual.

**Atividades**
1. Consultar as seções pertinentes do manual e seus modelos.
2. Configurar A4, margens, fonte, tamanhos, alinhamento, recuo e espaçamento.
3. Criar capa, folha de rosto e folha de aprovação.
4. Configurar títulos numerados e hierarquia de seções.
5. Testar sumário e paginação.
6. Incluir uma figura, uma tabela e suas legendas/fontes.
7. Comparar visualmente o PDF com os modelos do manual.
8. Registrar cada desvio e o esforço necessário para corrigi-lo.

**Critérios de aprovação**
- Elementos essenciais correspondem às regras verificadas do manual.
- Diferenças identificadas são corrigíveis sem hacks frágeis ou manutenção excessiva.
- As regras de formatação estão centralizadas no template.

**Evidências:** PDF, lista de verificação e capturas/comentários sobre diferenças.

### Etapa 3 — Organização modular e múltiplos grupos

**Objetivo:** testar se o documento pode ser dividido em arquivos e se a infraestrutura pode ser compartilhada.

**Estrutura experimental sugerida**

```text
ESTUDO-TYPIST/
├── ferramentas/
│   └── typst.exe
├── template/
│   ├── senai.typ
│   └── configuracao.typ
├── scripts/
│   └── compilar-grupo.bat
├── grupos/
│   ├── grupo-01/
│   │   ├── trabalho.typ
│   │   ├── capitulos/
│   │   ├── imagens/
│   │   ├── referencias.bib
│   │   └── saida/
│   └── grupo-02/
│       ├── trabalho.typ
│       ├── capitulos/
│       ├── imagens/
│       ├── referencias.bib
│       └── saida/
└── README.md
```

A estrutura é uma proposta de teste e pode mudar conforme os resultados.

**Atividades**
1. Separar o documento principal, configurações e capítulos.
2. Verificar a diferença entre importar definições e incluir conteúdo.
3. Testar imagens e bibliografia com caminhos relativos.
4. Compilar dois grupos com o mesmo executável e template.
5. Confirmar que a saída de cada grupo fica em sua própria pasta.
6. Testar a compilação de todos os grupos por um script, se isso for útil.

**Critérios de aprovação**
- Os grupos são independentes.
- A configuração compartilhada não exige cópias duplicadas do compilador.
- Os caminhos funcionam de forma previsível.
- Alterar o template não exige editar manualmente todos os capítulos.

### Etapa 4 — Citações e referências

**Objetivo:** verificar a adequação bibliográfica às normas aplicáveis.

**Amostra mínima de fontes**
- Livro com um autor.
- Livro com múltiplos autores.
- Artigo científico com DOI.
- Página ou documento eletrônico.
- Norma técnica.
- Outras fontes relevantes ao manual.

**Amostra mínima de citações**
- Citação indireta.
- Citação direta curta.
- Citação direta longa.
- Citação de obra com múltiplos autores.
- Citação com os dados necessários para localizar a referência.

**Atividades**
1. Testar arquivo `.bib` e, se pertinente, o formato bibliográfico nativo do Typst.
2. Investigar estilos CSL compatíveis.
3. Comparar citações com a ABNT NBR 10520:2023 e os exemplos do manual.
4. Comparar referências com a ABNT NBR 6023:2025 e os exemplos do manual.
5. Verificar ordem, pontuação, destaque tipográfico, dados obrigatórios e apresentação de fontes eletrônicas.
6. Registrar incompatibilidades e adaptações necessárias.

**Critérios de aprovação**
- Os casos da amostra são formatados corretamente.
- O estilo pode ser aplicado de forma consistente.
- Problemas não exigem correções manuais repetitivas em cada trabalho.

**Observação:** não presumir que um estilo identificado como ABNT esteja atualizado ou cumpra todas as exigências do SENAI-SP. Validar cada caso.

### Etapa 5 — Word editável

**Objetivo:** encontrar uma estratégia aceitável para produzir DOCX.

**Alternativas a comparar**
1. Typst → PDF → conversor PDF para Word.
2. Manter uma fonte intermediária, como Markdown, e gerar DOCX com Pandoc.
3. Outras alternativas tecnicamente viáveis identificadas durante a pesquisa.

**Conteúdo do teste**
- Títulos e níveis de seção.
- Sumário.
- Parágrafos e recuos.
- Tabelas e imagens.
- Citações e referências.
- Quebras de página e numeração.

**Critérios de aprovação**
- O arquivo abre e é editável no Word.
- O esforço de correção após conversão é medido.
- A solução não é declarada adequada apenas porque o texto foi recuperado.
- O impacto sobre o fluxo de trabalho é documentado.

### Etapa 6 — GitHub e compilação automatizada

**Objetivo:** verificar se o Typst pode ser executado em um fluxo de integração contínua.

**Atividades**
1. Criar um repositório de teste, sem dados confidenciais.
2. Configurar o Typst no GitHub Actions.
3. Compilar o documento a cada alteração relevante.
4. Disponibilizar o PDF como artefato da execução.
5. Testar fontes, recursos e caminhos no ambiente de CI.
6. Investigar limites gratuitos, permissões e política de acesso.
7. Registrar se o template compartilhado pode ser consumido de forma confiável.

**Critérios de aprovação**
- A compilação termina sem intervenção manual.
- O PDF fica disponível para revisão.
- O fluxo respeita permissões e limites aplicáveis.

## 8. Comparação com Pandoc + Eisvogel

Ao concluir os testes, comparar as duas abordagens usando o mesmo conteúdo de amostra.

| Critério | Peso sugerido |
|---|---:|
| Fidelidade ao manual SENAI-SP | 25% |
| Citações e referências | 20% |
| Geração de Word editável | 15% |
| Portabilidade e dependências | 15% |
| Modularidade e uso por oito grupos | 15% |
| Automação e manutenção | 10% |
| **Total** | **100%** |

Atribuir uma nota de 0 a 5 para cada critério, com evidências registradas. Calcular a pontuação ponderada somente após os testes.

A nota total é um auxílio à decisão. Não compensa falhas críticas de conformidade: formatação institucional e referências precisam atender aos requisitos aplicáveis.

## 9. Registro de testes

Para cada teste, registrar:

- Identificador e data.
- Versão do Typst e sistema operacional.
- Objetivo e procedimento.
- Comando executado.
- Resultado esperado.
- Resultado observado.
- Arquivos produzidos.
- Problemas e limitações.
- Situação: **Aprovado**, **Aprovado com ressalvas**, **Reprovado** ou **Pendente**.

### Modelo de registro

```text
ID:
Data:
Etapa:
Versão:
Objetivo:
Procedimento:
Resultado esperado:
Resultado observado:
Evidências:
Problemas:
Conclusão:
Status:
```

## 10. Riscos a observar

- **Fidelidade tipográfica:** uma fonte ausente pode alterar quebras de linha e paginação.
- **Referências:** um estilo existente pode não cumprir todas as regras atuais.
- **Word:** PDF convertido pode perder estrutura e editabilidade.
- **Portabilidade:** fontes e recursos externos podem criar dependências adicionais.
- **Manutenção:** um template muito personalizado pode ser difícil de atualizar.
- **GitHub:** permissões, limites e privacidade precisam ser avaliados.
- **Normas:** não confundir aparência visual correta com conformidade integral.

## 11. Marcos de decisão

**Marco A — Compilador:** só avançar após gerar o PDF mínimo e registrar a portabilidade.

**Marco B — Layout:** só avançar para o template ampliado depois de confirmar que os elementos básicos do SENAI são reproduzíveis.

**Marco C — Bibliografia:** identificar se as regras de citação e referência podem ser aplicadas de forma consistente.

**Marco D — Word:** decidir se o DOCX é viável por conversão ou se será necessária uma fonte intermediária.

**Marco E — Decisão final:** comparar os resultados com Pandoc + Eisvogel e registrar a decisão e suas justificativas.

## 12. Resultado final esperado

O estudo deverá produzir:

1. Um protótipo mínimo Typst que compila em Windows.
2. Um template experimental com os elementos principais do SENAI-SP.
3. Um exemplo dividido em arquivos.
4. Um teste com pelo menos dois grupos independentes.
5. Uma amostra validada de citações e referências.
6. Um relatório de DOCX, incluindo limitações de conversão.
7. Um exemplo de compilação automatizada no GitHub, caso aprovada nos testes.
8. Uma matriz comparativa com Pandoc + Eisvogel.
9. Uma decisão fundamentada: adotar Typst, usá-lo apenas para PDF ou manter a solução anterior.

## 13. Próxima ação

Começar exclusivamente pela **Etapa 1 — Compilação mínima e portabilidade**. Não construir o template completo nem alterar a arquitetura do projeto original antes de confirmar que o compilador funciona conforme esperado.

O estudo deve avançar em pequenos testes, documentando os resultados e mantendo as decisões em aberto até haver evidências suficientes.

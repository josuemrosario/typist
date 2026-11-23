# Registro de testes — Projeto Typist

**Criado em:** 23/11/2026
**Objetivo:** registrar, de forma verificável, os testes já executados no ambiente do TCC, com o que foi testado, como, o resultado esperado e o observado.
**Base:** `AGENTS.md`, seções 6 e 8; decisão D-21 de `docs/DECISOES.md`.

---

## 1. Como ler

- Cada teste tem identificador (`T-nn`), data, objetivo, ambiente, entradas, comando, resultado esperado, resultado observado, evidência, limitações e status.
- **Status possíveis:** Aprovado, Aprovado com ressalva, Reprovado, Pendente.
- Este arquivo **não substitui a evidência**: o PDF, a captura, o hash ou o log é que comprovam o resultado. Quando a evidência não está no repositório, isso é dito no próprio teste.
- Teste sem artefato verificável fica **Pendente**, mesmo que a execução pareça ter dado certo (`AGENTS.md`, seção 8).
- Este registro não declara conformidade do template com o manual. A comparação visual com as figuras do manual avançou para as figuras pré-textuais (P-01, T-08); as figuras 2 e 4 permanecem pendentes.

## 2. Ambiente de referência

| Item | Valor |
|---|---|
| Sistema operacional | Windows 11 (Microsoft Windows NT 10.0.22621.0) |
| Compilador | `ferramentas\typst.exe` — typst 0.15.1 (9dfd3a08) |
| Fontes | `ferramentas/fontes/` (arial.ttf, arialbd.ttf, ariali.ttf, arialbi.ttf), usadas com `--font-path` e `--ignore-system-fonts` |
| Template de referência | `ferramentas/template/tcc-v001.typ` |
| Último commit antes dos testes de 23/11/2026 | `847f1c6` |

## 3. Índice dos testes

| ID | Data | Assunto | Status |
|---|---|---|---|
| T-01 | 16/11/2026 | Menu de versões do `gerar-pdf.bat` | Aprovado com ressalva |
| T-02 | 16/11/2026 | Criação de grupo por `administracao/criar-grupo.bat` | Aprovado |
| T-03 | 16/11/2026 | Diagnóstico `administracao/verificar-ambiente.bat` | Aprovado |
| T-04 | 16/11/2026 | Equivalência de layout: PDF v004 (template anterior) × v005 (template v001) | Aprovado com ressalva |
| T-05 | 23/11/2026 | Pasta-modelo com os includes opcionais comentados não altera o PDF | Aprovado |
| T-06 | 23/11/2026 | Pasta-modelo com todos os elementos opcionais ativos | Aprovado com ressalva |
| T-07 | 23/11/2026 | Dois grupos independentes, sem vazamento de conteúdo (P-16) | Aprovado com ressalva |
| T-08 | 23/11/2026 | Comparação visual com as figuras do manual (P-01) | Aprovado com ressalva |
| T-09 | 23/11/2026 | Referências: tipos usados pelos alunos (P-06) | Aprovado com ressalva |
| T-10 | 23/11/2026 | Folha de aprovação e publicação da v002 (P-03, P-19) | Aprovado com ressalva |

---

## 4. Testes

### T-01 — Menu de versões do `gerar-pdf.bat`

- **Data:** 16/11/2026.
- **Objetivo:** conferir que o aluno consegue escolher a versão do template na compilação e que o script trata entradas inválidas sem compilar errado.
- **Ambiente:** Windows 11; typst 0.15.1; área isolada com duas versões do template (`tcc-v001.typ` e uma `tcc-v002.typ` de teste que só mudava o cabeçalho).
- **Entradas:** chamadas ao `gerar-pdf.bat` com número da lista, código `v002`, Enter e entradas inválidas.
- **Resultado esperado:** escolha aplicada; Enter mantém a versão anterior; padrão na versão de número mais alto na primeira compilação; entrada inválida repete a pergunta até 5 vezes e aborta com código 1; pasta `template` ausente e bloqueio existente abortam.
- **Resultado observado:** os 12 cenários previstos se comportaram como esperado, incluindo o aborto com código 1 depois de cinco tentativas e o aviso quando a versão escolhida foi removida.
- **Evidência:** descrição dos cenários em D-15 (`docs/DECISOES.md`). O log da execução não foi anexado ao repositório.
- **Limitações:** teste em área isolada, com uma versão de teste; o ciclo com uma correção real de formatação continua pendente (P-19).
- **Status:** Aprovado com ressalva.

### T-02 — Criação de grupo por `administracao/criar-grupo.bat`

- **Data:** 16/11/2026.
- **Objetivo:** conferir que o professor cria a pasta do grupo a partir da pasta-modelo, com nome validado, sem `tcc.typ` e sem conteúdo de outro grupo.
- **Ambiente:** Windows 11; typst 0.15.1; `modelo/` do commit `847f1c6`.
- **Entradas:** nome `Grupo-Teste-01`; depois um nome inválido e um nome já existente.
- **Resultado esperado:** a pasta `grupos/Grupo-Teste-01` é criada com `main.typ`, `gerar-pdf.bat`, `dados.typ`, `referencias.bib` e as subpastas, sem `tcc.typ`; nome inválido e pasta existente são recusados.
- **Resultado observado:** a pasta foi criada como esperado; a compilação no grupo gerou `saida/TCC-Grupo-Teste-01-v001.pdf`, com `template-usado.txt` e `saida/historico.txt`; os casos inválidos foram recusados pelo próprio script.
- **Evidência:** D-16 (`docs/DECISOES.md`); `grupos/Grupo-Teste-01/` no repositório.
- **Limitações:** executado pela equipe técnica, que conhece o mecanismo; o professor ainda não repetiu o fluxo seguindo só o `LEIA-ME` (P-15).
- **Status:** Aprovado.

### T-03 — Diagnóstico `administracao/verificar-ambiente.bat`

- **Data:** 16/11/2026.
- **Objetivo:** conferir que o diagnóstico encontra os itens do ambiente atual e acusa falta de arquivos essenciais.
- **Ambiente:** Windows 11; typst 0.15.1.
- **Comando:** `administracao\verificar-ambiente.bat`.
- **Resultado esperado:** código 0 com `[OK]` em todos os itens no ambiente completo; código 1 com `[FALHA]` quando falta arquivo essencial.
- **Resultado observado:** no ambiente atual, todos os itens com `[OK]` e código 0; no teste negativo, com um grupo vazio, código 1 com `[FALHA] main.typ ausente` e `[FALHA] gerar-pdf.bat ausente`.
- **Evidência:** P-12 (`docs/PENDENCIAS.md`). A saída dos dois testes não foi anexada ao repositório.
- **Limitações:** o teste negativo usou um grupo vazio criado para isso; não cobre rede/UNC (P-11).
- **Status:** Aprovado.

### T-04 — Equivalência de layout: PDF v004 (template anterior) × v005 (template v001)

- **Data:** 16/11/2026.
- **Objetivo:** conferir que a troca do template único pelo template versionado não alterou o layout do trabalho de teste.
- **Ambiente:** Windows 11; typst 0.15.1; PDFs do grupo de teste anterior (recuperáveis no commit `5e746e2`).
- **Entradas:** `TCC-Grupo-Teste-Geral-v004.pdf` (template anterior) e `v005` (template v001), com o mesmo conteúdo.
- **Resultado esperado:** mesmo número de páginas, mesmo tamanho de página e mesmas fontes incorporadas.
- **Resultado observado:** 12 páginas nos dois; A4 de 595,2756 × 841,8898 pt; mesmas fontes incorporadas.
- **Evidência:** D-15 (`docs/DECISOES.md`). Os PDFs continuam recuperáveis no commit `5e746e2`.
- **Limitações:** comparação de propriedades, não visual; a comparação com as figuras do manual continua pendente (P-01).
- **Status:** Aprovado com ressalva.

### T-05 — Pasta-modelo com os includes opcionais comentados não altera o PDF

- **Data:** 23/11/2026.
- **Objetivo:** garantir que a inclusão dos arquivos opcionais em `modelo/` (D-18), com os `#include` comentados, não muda o PDF de quem não usa nenhum elemento opcional.
- **Ambiente:** Windows 11; typst 0.15.1; `ferramentas/template/tcc-v001.typ` copiado para `tcc.typ` dentro da cópia.
- **Entradas:** duas cópias de `modelo/` em área temporária, uma com o `main.typ` do commit `847f1c6` e outra com o `main.typ` novo; o restante idêntico.
- **Comando (por cópia):**

  ```
  ferramentas\typst.exe compile <copia>\main.typ <copia>\pg-{0p}.png --root <copia> --font-path ferramentas\fontes --ignore-system-fonts --input "versao-template=v001" --ppi 70
  ```

- **Resultado esperado:** mesmo número de páginas e páginas renderizadas idênticas.
- **Resultado observado:** 10 páginas nas duas cópias, sem avisos; as 10 imagens PNG com SHA-256 iguais (`Compare-Object` sem diferenças).
- **Evidência:** execução de 23/11/2026 nesta máquina; as imagens ficam em `%TEMP%\opencode\p02-padrao` (cópia nova) e `%TEMP%\opencode\p02-head` (cópia com o `main.typ` do commit `847f1c6`). O comando acima regenera as duas.
- **Limitações:** as imagens são temporárias e não estão no repositório; o teste compara renderização, não propriedades do PDF.
- **Status:** Aprovado.

### T-06 — Pasta-modelo com todos os elementos opcionais ativos

- **Data:** 23/11/2026.
- **Objetivo:** conferir que os 12 arquivos opcionais compilam juntos, na ordem do manual, com os títulos formatados e o sumário coerente.
- **Ambiente:** Windows 11; typst 0.15.1; `tcc-v001.typ` copiado para `tcc.typ` na cópia temporária.
- **Entradas:** cópia de `modelo/` com todos os `#include` opcionais descomentados (errata; dedicatória, agradecimentos, epígrafe; listas de ilustrações, tabelas, abreviaturas e siglas, símbolos; glossário, apêndice, anexo, índice).
- **Comando:**

  ```
  ferramentas\typst.exe compile <copia>\main.typ <copia>\pg-{0p}.png --root <copia> --font-path ferramentas\fontes --ignore-system-fonts --input "versao-template=v001" --ppi 70
  ```

- **Resultado esperado:** compilação sem avisos; um elemento por página, na ordem do manual; elementos pré-textuais sem número de página e fora do sumário; elementos pós-textuais numerados e listados no sumário.
- **Resultado observado:** compilação sem avisos, código 0, 22 páginas. Conferência visual das páginas renderizadas:
  - ERRATA: título centralizado, sem número de página (pré-textual);
  - DEDICATÓRIA e EPÍGRAFE: sem título, texto na parte inferior, começando no meio da mancha gráfica e indo até a margem direita;
  - LISTA DE ILUSTRAÇÕES e demais listas: título centralizado em maiúsculas e negrito, sem número de página;
  - SUMÁRIO: lista REFERÊNCIAS, GLOSSÁRIO, APÊNDICE A — TÍTULO DO APÊNDICE, ANEXO A — TÍTULO DO ANEXO e ÍNDICE, com os números de página 17 a 21;
  - APÊNDICE e ÍNDICE: título centralizado, com número de página no canto superior direito (pós-textual).
- **Evidência:** execução de 23/11/2026; imagens em `%TEMP%\opencode\p02` (pg-01 a pg-22). SHA-256 de duas páginas conferidas: `pg-05.png` (dedicatória) `65BEEE492703048AD42A1FE1C889191EED491B84DEE0D65381479426BC73151F` e `pg-14.png` (sumário) `021090B7E29E244C50CAE63BE179950A98B9ACEC48B797463435E011E2663190`. O comando acima regenera as imagens.
- **Limitações:** (1) as imagens são temporárias e não estão no repositório; (2) não havia figuras, tabelas nem quadros no documento de teste, então as listas de ilustrações e de tabelas saíram só com o título — o preenchimento automático dessas listas não foi testado; (3) as ressalvas de formatação registradas em D-18 (travessão nas listas, recuo do glossário, tabela da errata) continuam valendo.
- **Status:** Aprovado com ressalva.

---

### T-07 — Dois grupos independentes, sem vazamento de conteúdo (P-16)

- **Data:** 23/11/2026.
- **Objetivo:** verificar que grupos criados a partir da pasta-modelo não compartilham conteúdo, versão do template ou PDF, e que o compilador não vaza dados entre grupos.
- **Ambiente:** Windows 11; typst 0.15.1; cópia isolada do projeto em `%TEMP%\opencode\p16` (sem `.git`).
- **Entradas:** dois grupos criados por `administracao/criar-grupo.bat` (`Grupo-Alfa` e `Grupo-Beta`), com `dados.typ` distintos e marcadores exclusivos no `02-textuais/introducao.typ` (`ALFA-9F3K` e `BETA-7Q2M`).
- **Comando:**
  ```
  echo Grupo-Alfa | administracao\criar-grupo.bat
  echo Grupo-Beta  | administracao\criar-grupo.bat
  echo. | grupos\Grupo-Alfa\gerar-pdf.bat
  echo. | grupos\Grupo-Beta\gerar-pdf.bat
  ```
- **Resultado esperado:** dois PDFs distintos, sem texto de um grupo no outro; `template-usado.txt` e `saida/historico.txt` corretos por grupo.
- **Resultado observado:** compilação sem avisos, código 0, nos dois grupos. Extração de texto dos PDFs (via `pdftext-any.py`) confirmou ausência total de vazamento: nenhum dos 11 marcadores do Grupo Alfa aparece no PDF do Grupo Beta e vice-versa. PDFs com hashes distintos (`55F70CA9858354421218652B5E185E2324DF7391C9C14F2C947D91369817344A` e `58AA74DC32F4F41D417B31251ACB62F5D42180A35B98E1329842C260A7D48EB4`).
- **Evidência:** `%TEMP%\opencode\p16\alfa.txt` e `%TEMP%\opencode\p16\beta.txt` (textos extraídos); `saida/TCC-Grupo-Alfa-v001.pdf` e `saida/TCC-Grupo-Beta-v001.pdf` na área isolada.
- **Limitações:** teste executado pela equipe técnica, em área isolada, com v001 apenas; não cobre troca de versão entre grupos (P-19).
- **Status:** Aprovado com ressalva.

---

### T-08 — Comparação visual com as figuras do manual (P-01)

- **Data:** 23/11/2026.
- **Objetivo:** comparar o PDF gerado pelo modelo com as figuras 1, 3, 5 e 6 do manual, registrando divergências.
- **Ambiente:** Windows 11; typst 0.15.1; renderização do manual via `%TEMP%\opencode\render-manual.ps1` (API `Windows.Data.Pdf`).
- **Entradas:** PDF do modelo (`%TEMP%\opencode\cmp-modelo\out.pdf`, 10 páginas) e páginas 39, 42, 44, 46, 47 e 50 do manual.
- **Resultado esperado:** identificar divergências entre o template e as figuras, fundamentando cada uma no texto normativo.
- **Resultado observado:** quatro divergências, todas nas figuras do manual (não no template): (1) capa, segunda linha em itálico na figura × maiúsculas/negrito exigidas pela seção 5.2.1; (2) folha de rosto com ponto final em Orientador/Coorientador na figura × seção 5.2.3 sem exigência; (3) folha de aprovação sem "Aprovado em:" na figura × seção 5.2.5 com data de aprovação; (4) sumário com níveis secundários em maiúsculas sem negrito e entradas pós-textuais na coluna dos indicativos × seções 2.4 e 5.2.15. Uma divergência real do template (fonte centralizada em vez de acompanhar as margens da ilustração, seção 2.11) foi corrigida na v002 (D-24).
- **Evidência:** `%TEMP%\opencode\manual-png\pag-39.png`, `pag-42.png`, `pag-44.png`, `pag-46.png`, `pag-47.png`, `pag-50.png` e `%TEMP%\opencode\cmp-modelo\png\pag-01..pag-10.png`.
- **Limitações:** figuras 2 (diagrama estrutural) e 4 (lombada) não comparadas; a figura 4 está fora de escopo por D-19.
- **Status:** Aprovado com ressalva.

---

### T-09 — Referências: tipos usados pelos alunos (P-06)

- **Data:** 23/11/2026.
- **Objetivo:** testar os tipos de referência mais usados e comparar com os exemplos da seção 4 do manual.
- **Ambiente:** Windows 11; typst 0.15.1; CSL `associacao-brasileira-de-normas-tecnicas`.
- **Entradas:** três arquivos `.bib` em `%TEMP%\opencode\p06\` (refs.bib, refs2.bib, refs3.bib) com livro, capítulo, artigo, tese, anais, patente, site e legislação; PDFs compilados (`out.pdf`, `out2.pdf`, `out3.pdf`).
- **Resultado esperado:** cada tipo sai conforme o exemplo correspondente do manual.
- **Resultado observado:** livro conforme (4.1); artigo conforme, exceto local e "ano" (4.3); capítulo conforme, com ressalva de capitalização de "(org.)" (4.2); tese só com `publisher` (4.4); site só com `url`/`urldate`, com URL entre < > (4.5); anais sem o título do anais (4.6); patente sem número e com pontuação sobrando (4.7); legislação plausível (4.9).
- **Evidência:** `%TEMP%\opencode\p06\png\pag-02.png` (três compilações).
- **Limitações:** receitas documentadas em `modelo/LEIA-ME.txt`; anais e patente não suportados pelo CSL (limitação registrada).
- **Status:** Aprovado com ressalva.

---

### T-10 — Folha de aprovação e publicação da v002 (P-03, P-19)

- **Data:** 23/11/2026.
- **Objetivo:** validar a v002 do template (correções de P-01 e P-03) e a folha de aprovação.
- **Ambiente:** Windows 11; typst 0.15.1; `%TEMP%\opencode\cmp-v002\` com `tcc-v002.typ` copiado como `tcc.typ`.
- **Entradas:** `modelo/` completo compilado com a v002; `dados.typ` padrão.
- **Comando:**
  ```
  ferramentas\typst.exe compile <copia>\main.typ <copia>\out.pdf --root <copia> --font-path ferramentas\fontes --ignore-system-fonts --input "versao-template=v002"
  ```
- **Resultado esperado:** compilação sem avisos; folha de aprovação com título antes do nome e instituição em linha própria; legendas e fontes de ilustrações/tabelas alinhadas e com rótulo em negrito.
- **Resultado observado:** compilação sem avisos, código 0, 10 páginas. Renderização de `pag-03.png` confirmou a ordem título, nome, instituição. A v002 foi publicada em `ferramentas/template/tcc-v002.typ` sem alterar a v001.
- **Evidência:** `%TEMP%\opencode\cmp-v002\out.pdf` e `%TEMP%\opencode\cmp-v002\png\`.
- **Limitações:** validação visual completa em máquina de aluno pendente (P-10).
- **Status:** Aprovado com ressalva.

---

## 5. Testes que faltam (não são testes aprovados)

- Compilação em máquina de aluno (P-10) e em rede/UNC (P-11).
- Listas de ilustrações e de tabelas com figuras, tabelas e quadros no documento (ver limitação de T-06).

## 6. Histórico deste documento

| Data | Alteração |
|---|---|
| 23/11/2026 | Criação, com T-01 a T-06 |
| 23/11/2026 | Inclusão de T-07 a T-10 (dois grupos independentes, comparação visual com as figuras, referências por tipo, folha de aprovação e v002) | Sessão de trabalho autorizada pelo professor |

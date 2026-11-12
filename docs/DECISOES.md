# Registro de decisões — Projeto Typist

**Criado em:** 12/11/2026
**Criado por:** autorização do professor, registrada na conversa de 12/11/2026
**Objetivo:** registrar, de forma verificável, as decisões já tomadas sobre o ambiente Typst do TCC, com a base normativa, a evidência disponível e o status de cada uma.

---

## 1. Como usar este documento

- Este registro **não é fonte normativa**. A hierarquia continua sendo: Manual SENAI-SP 2025 > normas ABNT de `docs/` > `AGENTS.md` e este registro > código e artefatos (`AGENTS.md`, seção 2).
- Cada decisão tem um identificador (`D-nn`), a data, o conteúdo da decisão, a base normativa (documento, seção e página), a evidência que a sustenta e o status.
- **Status possíveis:**
  - **Vigente** — decisão em uso, com evidência suficiente para o que foi verificado.
  - **Vigente com ressalva** — em uso, mas com limitação conhecida registrada.
  - **Pendente de confirmação** — adotada no projeto, mas depende de validação (visual, institucional ou em outra máquina).
  - **Substituída** — não vale mais; a decisão que a substituiu é indicada.
- Alterar ou remover uma decisão exige autorização do professor (`AGENTS.md`, seção 9). Decisão nova entra no fim, com data; decisão antiga não é apagada, é marcada como substituída.
- O que **ainda falta fazer** não fica aqui: está em `docs/PENDENCIAS.md`.
- A existência deste registro não autoriza declarar conformidade. Sem evidência, o status é **Pendente** (`AGENTS.md`, seção 8).

---

## 2. Quadro-resumo

| ID | Data | Assunto | Status |
|---|---|---|---|
| D-01 | 09/11/2026 | Escopo: TCC pelo capítulo 5; artigo fora de escopo | Vigente |
| D-02 | 09/11/2026 | Formatação centralizada no template; conteúdo só com texto | Vigente |
| D-03 | 09/11/2026 | Página, margens, fonte, alinhamento e espaçamento | Vigente com ressalva |
| D-04 | 09/11/2026 | Títulos: numeração progressiva em 5 níveis | Vigente |
| D-05 | 09/11/2026 | Paginação: contagem na folha de rosto, número a partir do texto | Vigente |
| D-06 | 09/11/2026 | Nome do grupo fixo em 3 linhas do `gerar-pdf.bat` | Vigente |
| D-07 | 12/11/2026 | Citação longa e notas de rodapé | Vigente |
| D-08 | 12/11/2026 | Sumário espelha o destaque do texto nos 5 níveis | Vigente com ressalva |
| D-09 | 12/11/2026 | Divergência do manual: prevalece a seção 2.4 sobre a figura da p. 45 | Pendente de confirmação |
| D-10 | 12/11/2026 | Referências pelo CSL ABNT | Vigente |
| D-11 | 12/11/2026 | Fonte Arial embarcada em `ferramentas/fontes/` | Vigente |
| D-12 | 12/11/2026 | Licença dos arquivos de fonte é responsabilidade do professor | Vigente |
| D-13 | 12/11/2026 | NBR 6022 e NBR 12225 incorporadas ao acervo de `docs/` | Vigente |
| D-14 | 12/11/2026 | Criação deste registro e de `docs/PENDENCIAS.md` | Vigente |

---

## 3. Decisões

### D-01 — Escopo: TCC pelo capítulo 5, artigo fora de escopo

- **Data:** 09/11/2026
- **Decisão:** o ambiente atende ao Trabalho de Conclusão de Curso na forma de monografia/TCC, conforme o capítulo 5 do manual. O capítulo 6 (artigo científico) não é aplicado. Mudar para artigo exige decisão formal registrada antes de alterar o template, porque mudam fonte, espaçamento, estrutura, paginação e sumário.
- **Base normativa:** Manual SENAI-SP 2025, capítulo 5 (pp. 31-49); Apêndice A, comparação monografia × artigo (pp. 60-62); capítulo 6 (pp. 50-55) consultado apenas para comparação.
- **Evidência:** cabeçalho de `modelo/tcc.typ` (linhas 1-2); `AGENTS.md`, seção 1.
- **Status:** Vigente.

### D-02 — Formatação centralizada no template, conteúdo só com texto

- **Data:** 09/11/2026
- **Decisão:** toda regra de formatação (página, margens, fonte, espaçamento, títulos, paginação, sumário, citações, referências, figuras e tabelas) fica em `modelo/tcc.typ`. Os arquivos de conteúdo dos grupos recebem apenas texto e marcação simples de seção, sem `#set`/`#show`.
- **Base normativa:** Manual, seções 2.1 a 2.12 (pp. 3-10).
- **Evidência:** `modelo/tcc.typ` (linhas 1-78, função `configurar`); `modelo/main.typ` (ordem dos `#include`); `AGENTS.md`, seção 4.3.
- **Status:** Vigente.

### D-03 — Página, margens, fonte, alinhamento e espaçamento

- **Data:** 09/11/2026
- **Decisão:** A4 (21 × 29,7 cm); margens superior e esquerda 3 cm, inferior e direita 2 cm; Arial 12 no corpo e 10 nas exceções (citação longa, notas, paginação, legendas e fontes de ilustrações/tabelas); texto justificado; entrelinha de 1,5; recuo de primeira linha 1,25 cm.
- **Base normativa:** Manual, 2.1 (p. 3), 2.2 (pp. 3-4), 2.3 (p. 4).
- **Evidência:** `modelo/tcc.typ` (linhas 18-32); medições no PDF `grupos/Grupo-Teste-Geral/saida/TCC-Grupo-Teste-Geral-v004.pdf`: A4 de 595,28 × 841,89 pt; margem esquerda 2,98 cm e direita 2,00 cm; entrelinha do corpo entre 20,4 e 20,6 pt.
- **Ressalva:** a margem esquerda medida (2,98 cm) é a posição do primeiro traço do glifo, ligeiramente à direita do limite de 3 cm por causa do desenho da fonte; não é violação da margem.
- **Status:** Vigente com ressalva.

### D-04 — Títulos: numeração progressiva em 5 níveis

- **Data:** 09/11/2026
- **Decisão:** numeração progressiva até o quinto nível (`1.1.1.1.1`); seções primárias sempre em nova página; nível 1 em maiúsculas e negrito; nível 2 em negrito; nível 3 em negrito e itálico; nível 4 em itálico; nível 5 sublinhado. Títulos de elemento sem indicativo numérico (RESUMO, ABSTRACT, SUMÁRIO, REFERÊNCIAS) vão centralizados, em maiúsculas e negrito.
- **Base normativa:** Manual, 2.4 (pp. 4-5) e 2.5; NBR 6024:2012, 4.1 j) (hierarquia tipográfica obrigatória, recursos de destaque livres); NBR 14724:2024.
- **Evidência:** `modelo/tcc.typ` (linhas 10-15 e 43-75); conferência no PDF v004 de que o nível 2.4.1 aparece em negrito e itálico no texto e no sumário.
- **Status:** Vigente.

### D-05 — Paginação: contagem na folha de rosto, número a partir do texto

- **Data:** 09/11/2026
- **Decisão:** a capa não é contada. A contagem começa na folha de rosto (`counter(page).update(1)` depois da capa). O número aparece somente a partir do primeiro elemento textual (introdução), no canto superior direito, em fonte 10, a 2 cm da borda superior. O sumário não exibe número.
- **Base normativa:** Manual, 2.8 (p. 7).
- **Evidência:** `modelo/main.typ` (linhas 9-13); `modelo/tcc.typ` (linhas 6-8 e 21-28); `modelo/01-pre-textuais/sumario.typ` (linha 6); no PDF v004 o número está a 1,998 cm do topo e 2,02 cm da direita, o sumário não tem número e a introdução é a página 6.
- **Status:** Vigente.

### D-06 — Nome do grupo fixo em 3 linhas do `gerar-pdf.bat`

- **Data:** 09/11/2026
- **Decisão:** o nome do grupo não é derivado do nome da pasta nem automatizado. Ele aparece em 3 linhas marcadas com “EDITAR” no `gerar-pdf.bat` (`title`, `PREFIXO` e a mensagem de `echo`), que o professor altera ao copiar a pasta-modelo. Automatizar a derivação exige nova decisão.
- **Base normativa:** decisão operacional do projeto, não normativa; consta em `AGENTS.md`, seção 5.2.
- **Evidência:** `modelo/gerar-pdf.bat` (linhas marcadas com “EDITAR”); `modelo/LEIA-ME.txt`, seção 2; diferença entre `modelo/gerar-pdf.bat` e `grupos/Grupo-Teste-Geral/gerar-pdf.bat` restrita a essas 3 linhas.
- **Status:** Vigente.

### D-07 — Citação longa e notas de rodapé

- **Data:** 12/11/2026
- **Decisão:** citação direta com mais de três linhas usa `#citacao-longa[...]`: recuo de 4 cm, fonte 10, espaçamento simples e texto justificado. Notas de rodapé usam `#nota[...]`, em fonte 10 e espaço simples, no lugar do `#footnote` cru.
- **Base normativa:** Manual, 3.1 a 3.5 (pp. 12-20); 2.1 (p. 3), exceção de fonte 10; 2.3 (p. 4), espaço simples nas exceções; NBR 10520:2023.
- **Evidência:** `modelo/tcc.typ` (linhas 39-41, 246-263); commit `b3776fa` (“Corrige citacao longa e notas de rodape no template”); conferência no PDF v004 (citação com recuo de 4 cm em fonte 10; nota em fonte 10 com espaço simples).
- **Status:** Vigente.

### D-08 — Sumário espelha o destaque do texto nos 5 níveis

- **Data:** 12/11/2026
- **Decisão:** o sumário repete a apresentação tipográfica do texto em todos os níveis: 1 em maiúsculas e negrito, 2 em negrito, 3 em negrito e itálico, 4 em itálico, 5 sublinhado. Usa `outline(depth: 5)`, coluna fixa de 4 em para o indicativo, pontilhado até a página e número alinhado à direita. Elementos pré-textuais não entram no sumário.
- **Base normativa:** Manual, 2.4 (p. 5) e 5.2.15 (pp. 44-45); NBR 6027:2012, 5.2 (títulos alinhados pelo indicativo mais extenso), 6.1 (SUMÁRIO centralizado como seção primária), 6.2 (mesma apresentação tipográfica do texto) e 6.3 (pré-textuais fora do sumário).
- **Evidência:** `modelo/tcc.typ` (linhas 205-237); commit `0f29875` (“Alinha destaque do sumario ao texto nos cinco niveis”); conferência no PDF v004.
- **Ressalva:** com cinco níveis, o indicativo mais extenso (`1.1.1.1.1`) ocupa quase toda a coluna de 4 em. Com 10 ou mais seções primárias, o indicativo pode encostar no título.
- **Status:** Vigente com ressalva.

### D-09 — Divergência do manual: prevalece a seção 2.4 sobre a figura da p. 45

- **Data:** 12/11/2026
- **Decisão:** o manual descreve na seção 2.4 (p. 5) que o sumário repete o destaque do texto; a figura de exemplo do sumário (p. 45) mostra os níveis 3, 4 e 5 sem esse espelhamento. O projeto segue a **seção 2.4** e trata a figura como inconsistência interna do próprio manual. Não há, no material disponível, errata ou outra passagem que resolva a contradição.
- **Base normativa:** Manual, 2.4 (p. 5) e 5.2.15 (pp. 44-45); NBR 6027:2012, 6.2.
- **Evidência:** commit `0f29875`; comparação registrada na conversa de 12/11/2026.
- **Status:** Pendente de confirmação — depende de validação da coordenação do curso, já que o manual se contradiz. Enquanto não houver confirmação, vale a seção 2.4.

### D-10 — Referências pelo CSL ABNT

- **Data:** 12/11/2026 (consolidação do que já estava no template desde 09/11/2026)
- **Decisão:** as referências são geradas por `#bibliography` com o estilo `associacao-brasileira-de-normas-tecnicas`, a partir de `referencias.bib`. Lista em ordem alfabética, alinhada à esquerda, em espaço simples, sem recuo, com o destaque em negrito definido pelo estilo. O título REFERÊNCIAS é elemento pós-textual sem número.
- **Base normativa:** Manual, seção 4 (pp. 21-30) e 5.4.1 (p. 47); NBR 6023:2025.
- **Evidência:** `modelo/tcc.typ` (linhas 239-244); `modelo/03-pos-textuais/referencias.typ`; PDF v004 com duas referências formatadas.
- **Status:** Vigente.

### D-11 — Fonte Arial embarcada em `ferramentas/fontes/`

- **Data:** 12/11/2026
- **Decisão:** os quatro arquivos de Arial (`arial.ttf`, `arialbd.ttf`, `ariali.ttf`, `arialbi.ttf`) ficam em `ferramentas/fontes/`, pasta compartilhada fora de `modelo/`, e entram no Git. A compilação usa `--font-path ferramentas/fontes --ignore-system-fonts`. O `gerar-pdf.bat` verifica a fonte em dois passos (existência do arquivo e leitura pelo Typst) e aborta com código 1 se ela faltar ou estiver inválida.
- **Base normativa:** Manual, 2.1 (p. 3) — Arial 12. A decisão de embarcar a fonte é operacional: garante o mesmo arquivo de fonte em qualquer computador.
- **Evidência:** commit `ab92fff`; `modelo/gerar-pdf.bat`; PDF v004 com ArialMT, Arial-BoldMT e Arial-BoldItalicMT incorporadas; testes negativos de 12/11/2026 (sem a pasta e com `arial.ttf` inválido: código 1, nenhum PDF criado).
- **Ressalva:** o campo `fsType` dos quatro arquivos é `0x0008`, o que permite embutir subconjunto no PDF. Isso não equivale a autorização para redistribuir o arquivo de fonte (ver D-12).
- **Status:** Vigente.

### D-12 — Licença dos arquivos de fonte é responsabilidade do professor

- **Data:** 12/11/2026
- **Decisão:** o professor assumiu a responsabilidade pelo licenciamento dos arquivos de Arial mantidos em `ferramentas/fontes/`, inclusive se o repositório vier a ser publicado. O projeto registra a responsabilidade e não a valida.
- **Base normativa:** não normativa; questão de licenciamento de fonte proprietária.
- **Evidência:** autorização do professor em 12/11/2026 (“a licença eu resolvo”), registrada em `AGENTS.md`, seção 5.3.
- **Status:** Vigente.

### D-13 — NBR 6022 e NBR 12225 incorporadas ao acervo de `docs/`

- **Data:** 12/11/2026
- **Decisão:** incluir no Git e no acervo de consulta:
  - `docs/ABNT Norma 6022 Informacao e documentacao.pdf` — ABNT NBR 6022:2018, 2ª edição de 16.05.2018, 8 páginas conforme a capa, “Informação e documentação — Artigo em publicação periódica técnica e/ou científica — Apresentação”. Uso restrito a uma eventual mudança de escopo para artigo (D-01); não se aplica ao TCC.
  - `docs/ABNT 12225 - Informação e documentação - Lombada - Apresentacao.pdf` — ABNT NBR 12225:2023, 3ª edição de 28.04.2023, 5 páginas conforme a capa, “Informação e documentação — Lombada — Apresentação”. Serve de base caso o projeto venha a oferecer lombada; o template atual não gera lombada.
- **Base normativa:** metadados das páginas de rosto das próprias normas; `AGENTS.md`, seção 2.
- **Evidência:** arquivos presentes em `docs/`, versionados no commit desta decisão; páginas de rosto conferidas em 12/11/2026. O exemplar da NBR 12225 traz marca d'água de uso exclusivo do Conselho Federal de Biblioteconomia (impressão de 03/06/2025), o que restringe a redistribuição.
- **Status:** Vigente.

### D-14 — Criação deste registro e da lista de pendências

- **Data:** 12/11/2026
- **Decisão:** manter dois documentos em `docs/`: este registro de decisões (`docs/DECISOES.md`) e o resumo do que falta fazer (`docs/PENDENCIAS.md`). Eles substituem a prática anterior, em que as decisões existiam apenas na conversa, e não recriam o “documento mestre” nem o “plano de estudo” removidos em 09/11/2026.
- **Base normativa:** não normativa; organização do projeto (`AGENTS.md`, seções 2 e 9).
- **Evidência:** este arquivo e `docs/PENDENCIAS.md`, no commit desta decisão; `AGENTS.md` atualizado na seção 2.
- **Status:** Vigente.

---

## 4. Divergências e interpretações registradas

| # | Origem | Divergência | Interpretação adotada | Status |
|---|---|---|---|---|
| 1 | Manual, 2.4 (p. 5) × figura da p. 45 | A seção manda o sumário repetir o destaque do texto; a figura mostra níveis 3 a 5 sem espelhamento | Vale a seção 2.4 (D-09) | Pendente de confirmação |
| 2 | Manual, 2.8 (p. 7) × prática comum em Word | Contagem começa na folha de rosto, não na capa | Vale o manual (D-05) | Vigente |
| 3 | NBR 6024:2012, 4.1 j) | A norma exige hierarquia tipográfica, mas deixa livres os recursos de destaque | Adotados maiúsculas, negrito, itálico e sublinhado (D-04) | Vigente |
| 4 | NBR 6027:2012, 5.2 | Títulos do sumário alinhados pelo indicativo mais extenso | Coluna fixa de 4 em; ressalva com 10+ seções primárias (D-08) | Vigente com ressalva |

---

## 5. Lacunas que este registro não resolve

Não são decisões: são assuntos abertos, detalhados em `docs/PENDENCIAS.md`.

- Normas IBGE de apresentação tabular não estão em `docs/`; a formatação de tabelas segue o manual e a prática já adotada, sem base normativa própria.
- Lombada (NBR 12225:2023) não é gerada pelo template, e não há decisão de oferecê-la.
- O template não foi comparado visualmente com todas as figuras do manual.
- O ambiente só foi testado nesta máquina.

---

## 6. Histórico deste documento

| Data | Alteração | Responsável |
|---|---|---|
| 12/11/2026 | Criação, com D-01 a D-14 | Sessão de trabalho autorizada pelo professor |

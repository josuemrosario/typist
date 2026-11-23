# Registro de decisões — Projeto Typist

**Criado em:** 12/11/2026
**Atualizado em:** 23/11/2026
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
| D-06 | 09/11/2026 | Nome do grupo fixo em 3 linhas do `gerar-pdf.bat` | Substituída por D-16 |
| D-07 | 12/11/2026 | Citação longa e notas de rodapé | Vigente |
| D-08 | 12/11/2026 | Sumário espelha o destaque do texto nos 5 níveis | Vigente com ressalva |
| D-09 | 12/11/2026 | Divergência do manual: prevalece a seção 2.4 sobre a figura da p. 45 | Vigente |
| D-10 | 12/11/2026 | Referências pelo CSL ABNT | Vigente |
| D-11 | 12/11/2026 | Fonte Arial embarcada em `ferramentas/fontes/` | Vigente |
| D-12 | 12/11/2026 | Licença dos arquivos de fonte é responsabilidade do professor | Vigente |
| D-13 | 12/11/2026 | NBR 6022 e NBR 12225 incorporadas ao acervo de `docs/` | Vigente |
| D-14 | 12/11/2026 | Criação deste registro e de `docs/PENDENCIAS.md` | Vigente |
| D-15 | 16/11/2026 | Template versionado em `ferramentas/template/`, versão escolhida na compilação e registrada no PDF | Vigente |
| D-16 | 16/11/2026 | Criação de grupo por `administracao/criar-grupo.bat`; nome do grupo vem da pasta | Vigente |
| D-17 | 16/11/2026 | O `tcc.typ` gerado no grupo é versionado no Git | Vigente |
| D-18 | 23/11/2026 | Arquivos dos elementos opcionais na pasta-modelo, com include comentado | Vigente com ressalva |
| D-19 | 23/11/2026 | Lombada não é oferecida pelo template | Vigente |
| D-20 | 23/11/2026 | `typst.exe` e fontes Arial continuam versionados no Git | Vigente |
| D-21 | 23/11/2026 | Registro formal de testes em `docs/TESTES.md` | Vigente |
| D-22 | 23/11/2026 | Não há registro escrito da licença das fontes por enquanto | Vigente |
| D-23 | 23/11/2026 | Comparação visual com as figuras do manual (P-01) concluída para as figuras pré-textuais | Vigente com ressalva |
| D-24 | 23/11/2026 | Publicação do template v002 (correções de P-01 e P-03) | Vigente com ressalva |

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
- **Base normativa:** decisão operacional do projeto, não normativa; constava em `AGENTS.md`, seção 5.2.
- **Evidência:** `modelo/gerar-pdf.bat` (linhas marcadas com “EDITAR”); `modelo/LEIA-ME.txt`, seção 2; diferença entre `modelo/gerar-pdf.bat` e `grupos/Grupo-Teste-Geral/gerar-pdf.bat` restrita a essas 3 linhas.
- **Status:** Substituída por D-16 em 16/11/2026. O nome do grupo passou a vir do nome da pasta, e as 3 linhas “EDITAR” foram removidas do BAT.

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
- **Status:** Vigente — confirmado pelo professor em 23/11/2026, que decidiu manter o que diz a NBR 6027 (o espelhamento do destaque no sumário). A figura da p. 45 continua registrada como inconsistência interna do manual.

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

### D-15 — Template versionado em `ferramentas/template/`, versão escolhida na compilação e registrada no PDF

- **Data:** 16/11/2026
- **Decisão:** o template deixa de ser um único arquivo copiado para cada grupo e passa a existir em versões imutáveis em `ferramentas/template/tcc-vNNN.typ`. Ao compilar, o aluno vê o menu de versões e escolhe qual usar; Enter mantém a versão da compilação anterior e, na primeira compilação, o padrão é a versão de número mais alto. O `gerar-pdf.bat` copia a versão escolhida para `tcc.typ` dentro do grupo, porque o Typst resolve caminhos a partir da pasta do `main.typ` e recusa importar de fora sem `--root`. A versão usada fica registrada em três lugares: `template-usado.txt` (no grupo), `saida/historico.txt` (data, PDF, template e Typst) e nos metadados do PDF, pela palavra-chave `template-vNNN`; ela não é impressa na página.
- **Base normativa:** decisão operacional do projeto, não normativa; registrada em `AGENTS.md`, seções 4.3 e 5.4. Não altera exigência do manual.
- **Evidência:** `ferramentas/template/tcc-v001.typ` (cabeçalho `// v001 | 12/11/2026 | ...` e `set document(keywords: ("template-" + versao-template, "typist"))`); `ferramentas/template/LEIA-ME.txt`; `modelo/gerar-pdf.bat`; teste de 16/11/2026 no `grupo` de teste, em que o PDF saiu com `Keywords(template-v001, typist)`, `template-usado.txt` com `v001` e `historico.txt` com a linha da compilação. Testes de menu em área isolada com duas versões: escolha por número, Enter mantendo a anterior, troca de versão, entrada inválida repetindo a pergunta, código `v002` aceito, limite de 5 tentativas, versão removida avisando, pasta `template` ausente abortando e bloqueio existente abortando.
- **Ressalva:** a equivalência de layout foi conferida no grupo de teste antigo comparando o PDF v004 (template anterior) com o v005 (template v001): 12 páginas, A4 de 595,2756 × 841,8898 pt e as mesmas fontes incorporadas nos dois. A comparação visual com as figuras do manual continua pendente (P-01), e o teste em outra máquina também (P-10).
- **Observação sobre registros anteriores:** as referências a `modelo/tcc.typ` e ao PDF v004 nas decisões D-02, D-03, D-05, D-07, D-08 e D-10 descrevem o layout anterior a esta decisão. O arquivo corresponde hoje a `ferramentas/template/tcc-v001.typ`, e o v004 permanece recuperável no commit `5e746e2`.
- **Status:** Vigente.

### D-16 — Criação de grupo por `administracao/criar-grupo.bat`; nome do grupo vem da pasta

- **Data:** 16/11/2026
- **Decisão:** o grupo é criado por `administracao/criar-grupo.bat`, que pede o nome, valida (sem espaço, acento, ponto ou hífen inicial; até 40 caracteres; apenas letras, números, hífen e sublinhado; recusa nomes reservados do Windows) e copia `modelo/` para `grupos/<nome>`. O nome digitado é o nome da pasta, o título da janela de compilação e o prefixo dos PDFs (`TCC-<nome>-vNNN.pdf`). As 3 linhas “EDITAR” do `gerar-pdf.bat` foram removidas: o script deriva o nome da própria pasta. Esta decisão substitui D-06.
- **Base normativa:** decisão operacional do projeto, não normativa; `AGENTS.md`, seções 4.2, 4.4 e 5.2.
- **Evidência:** `administracao/criar-grupo.bat`; teste de 16/11/2026 com o nome `Grupo-Teste-01`, que criou a pasta com `main.typ`, `gerar-pdf.bat`, `dados.typ`, `referencias.bib` e as subpastas, sem `tcc.typ`; compilação no grupo gerou `saida/TCC-Grupo-Teste-01-v001.pdf`. Teste com nome inválido e com pasta existente recusado pelo próprio script. O `gerar-pdf.bat` usa `for %%A in ("%GRUPO_DIR:~0,-1%") do set "NOME_GRUPO=%%~nxA"`.
- **Ressalva:** renomear a pasta depois de compilar muda o prefixo das versões seguintes; para trocar o nome, criar outro grupo. Não há teste em rede/UNC (P-11).
- **Status:** Vigente.

### D-17 — O `tcc.typ` gerado no grupo é versionado no Git

- **Data:** 16/11/2026
- **Decisão:** o `tcc.typ` gerado pelo `gerar-pdf.bat` dentro do grupo entra no Git, em vez de ser ignorado por `.gitignore`. A escolha foi do professor em 16/11/2026. Consequência aceita: ao trocar de versão do template, o arquivo aparece como modificado e deve ser commitado junto com `template-usado.txt`, para o repositório refletir a versão usada pelo grupo.
- **Base normativa:** decisão operacional do projeto, não normativa; `AGENTS.md`, seção 5.2.
- **Evidência:** resposta do professor em 16/11/2026 (“Versionar o tcc.typ”); `grupos/Grupo-Teste-01/tcc.typ` com a primeira linha `// GERADO pelo gerar-pdf.bat a partir de tcc-v001.typ - nao edite`.
- **Ressalva:** o arquivo continua sendo sobrescrito a cada compilação; editá-lo não altera o PDF da próxima vez. O Git guarda o histórico das versões geradas, não substitui `ferramentas/template/` como fonte da verdade.
- **Status:** Vigente.

### D-18 — Arquivos dos elementos opcionais na pasta-modelo, com include comentado

- **Data:** 23/11/2026
- **Decisão:** a pasta-modelo passa a trazer um arquivo `.typ` para cada elemento opcional previsto no manual, em vez de deixar o aluno criar o arquivo e escolher a formatação:
  - pré-textuais: `errata.typ`, `dedicatoria.typ`, `agradecimentos.typ`, `epigrafe.typ`, `lista-de-ilustracoes.typ`, `lista-de-tabelas.typ`, `lista-de-abreviaturas-e-siglas.typ`, `lista-de-simbolos.typ`;
  - pós-textuais: `glossario.typ`, `apendice.typ`, `anexo.typ`, `indice.typ`.
  Os arquivos já vêm com o título (ou com a estrutura do elemento) e instruções em comentário, e o `main.typ` traz o `#include` de cada um comentado, na posição correta. Para usar um elemento, o grupo apaga o `//` do início da linha — não é preciso criar arquivo nem mexer em formatação. Cada arquivo opcional começa com `#pagebreak()`, porque todo elemento começa em página nova, de modo que ativar um include é uma alteração de uma linha só. Elementos pré-textuais usam `titulo-sem-numero` e não entram no sumário; os pós-textuais usam `heading` de nível 1 sem numeração, porque o manual manda alinhar também os elementos pós-textuais no sumário.
- **Base normativa:** Manual, 2.5 (p. 6) — títulos sem indicativo numérico centralizados e com a formatação das seções primárias; 2.6 (p. 6) — elementos sem título (dedicatória e epígrafe), com o texto do meio da mancha gráfica à margem direita, na parte inferior; 5.2.4 (p. 38), 5.2.6 a 5.2.8 (pp. 40-41), 5.2.11 a 5.2.14 (pp. 42-44), 5.2.15 (p. 44), 5.4 e lista dos elementos pós-textuais (p. 46), 5.4.2 a 5.4.4 (pp. 47-48); NBR 6034:2004 para o índice.
- **Evidência:** os 12 arquivos em `modelo/01-pre-textuais` e `modelo/03-pos-textuais`; `modelo/main.typ` com os includes comentados; testes T-05 e T-06 de `docs/TESTES.md` (23/11/2026): a pasta-modelo sem os opcionais ativos gera o mesmo PDF de antes (10 páginas, imagens idênticas às do commit `847f1c6`) e, com todos os opcionais ativos, compila sem avisos em 22 páginas, com os títulos centralizados, dedicatória e epígrafe na parte inferior e os elementos pós-textuais listados no sumário.
- **Ressalvas:** (1) a lista de ilustrações e a de tabelas saem sem o travessão entre o número e a legenda (o manual pede "Figura 1 – Título"); (2) o glossário sai com o recuo de primeira linha do corpo do texto, e o manual pede sem recuo; (3) a tabela da errata não tem função própria no template; (4) a posição da dedicatória e da epígrafe está resolvida dentro do arquivo de conteúdo, e não no template. Os quatro pontos dependem de funções novas no template e estão registrados em P-20.
- **Status:** Vigente com ressalva.

### D-19 — Lombada não é oferecida pelo template

- **Data:** 23/11/2026
- **Decisão:** o projeto não oferece lombada. O template não gera arquivo de lombada, e a NBR 12225:2023 continua no acervo de `docs/` apenas como referência. Se a instituição passar a exigir encadernação com lombada, a decisão precisa ser revista antes de qualquer implementação, porque a lombada não faz parte do PDF do trabalho (ela pertence à capa dura) e depende de dados que o template não tem, como a espessura do papel.
- **Base normativa:** Manual, 5.2.2 (p. 35) — lombada condicionada à necessidade de encadernação; NBR 12225:2023.
- **Evidência:** resposta do professor em 23/11/2026 ("P-09 Não oferecer"); `ferramentas/template/tcc-v001.typ` sem qualquer função de lombada.
- **Status:** Vigente.

### D-20 — `typst.exe` e fontes Arial continuam versionados no Git

- **Data:** 23/11/2026
- **Decisão:** o repositório continua com o binário `ferramentas/typst.exe` (52 MB) e com os quatro arquivos de Arial em `ferramentas/fontes/` (3,3 MB). O tamanho do repositório e a licença das fontes são aceitos como consequência, para que o aluno não precise instalar compilador nem fonte. A responsabilidade pela licença continua sendo do professor (D-12).
- **Base normativa:** decisão operacional do projeto, não normativa; `AGENTS.md`, seções 5.1, 5.3 e 11.
- **Evidência:** resposta do professor em 23/11/2026 ("P-13 manter tudo"); os arquivos estão versionados desde os commits de 12/11/2026.
- **Status:** Vigente.

### D-21 — Registro formal de testes em `docs/TESTES.md`

- **Data:** 23/11/2026
- **Decisão:** os testes passam a ser registrados em `docs/TESTES.md`, um bloco por teste, com identificador, data, objetivo, ambiente, comando, resultado esperado e observado, evidência e status. O registro complementa `docs/DECISOES.md` e `docs/PENDENCIAS.md`; não substitui o PDF, o log ou a captura que comprovam o resultado. Teste sem artefato verificável fica com status Pendente.
- **Base normativa:** `AGENTS.md`, seções 6 e 8.
- **Evidência:** `docs/TESTES.md`, criado nesta data com T-01 a T-06.
- **Status:** Vigente.

### D-22 — Não há registro escrito da licença das fontes por enquanto

- **Data:** 23/11/2026
- **Decisão:** o projeto não vai guardar, por enquanto, documento escrito sobre a base de uso dos arquivos de Arial em `ferramentas/fontes/`. A responsabilidade pela licença continua sendo do professor (D-12), e o projeto continua sem validar essa licença. Se o repositório for compartilhado fora da instituição ou publicado, a decisão precisa ser revista antes, porque Arial é fonte proprietária.
- **Base normativa:** não normativa; licenciamento de fonte proprietária.
- **Evidência:** resposta do professor em 23/11/2026 ("P-18 não haverá licença das fontes por escrito por enquanto").
- **Status:** Vigente.

---

### D-23 — Comparação visual com as figuras do manual (P-01) concluída para as figuras pré-textuais

- **Data:** 23/11/2026
- **Decisão:** as figuras 3 (capa), 5 (folha de rosto), 6 (folha de aprovação) e 1 (ilustração) do manual foram comparadas visualmente com o PDF gerado pelo modelo (v001). O template segue o texto normativo em todos os pontos verificados; as divergências estão nas próprias figuras do manual, que contradizem a seção 2.4 e o item 2.11. Quatro divergências documentadas:
  1. Capa (fig. 3): a figura mostra a segunda linha (campus/unidade) em negrito e itálico com maiúsculas mistas; o texto da seção 5.2.1 exige que "todas as informações" sejam em maiúsculas, negrito e centralizadas. Vale a seção 5.2.1 (template mantido).
  2. Folha de rosto (fig. 5): a figura termina as linhas "Orientador:" e "Coorientador:" com ponto final; a seção 5.2.3 não exige o ponto. Vale a seção 5.2.3 (template mantido, sem ponto).
  3. Folha de aprovação (fig. 6): a figura omite o campo "Aprovado em:"; a seção 5.2.5 exige a data de aprovação. Vale a seção 5.2.5 (template mantido, com a data).
  4. Sumário (fig. da p. 45): a figura mostra os níveis secundários em maiúsculas sem negrito e as entradas pós-textuais na coluna dos indicativos; a seção 2.4 exige nível secundário em negrito com iniciais maiúsculas, e a seção 5.2.15 exige os títulos alinhados pela margem do título do indicativo mais extenso, inclusive os pós-textuais. Vale a seção 2.4 / 5.2.15 (template mantido; D-09 reafirmada).
  Além disso, a seção 2.11 exige que legenda, fonte e notas "acompanhem as margens da ilustração"; o template (v001) centralizava a fonte, divergindo. Corrigido na v002.
- **Base normativa:** Manual SENAI-SP 2025, 2.4 (p. 5), 2.11 (pp. 8-9), 5.2.1 (pp. 32-34), 5.2.3 (pp. 36-37), 5.2.5 (pp. 38-39), 5.2.15 (pp. 44-45).
- **Evidência:** renderizações em `%TEMP%\opencode\cmp-modelo\png\` (pag-01 a pag-10) e `%TEMP%\opencode\manual-png\` (pag-39, pag-42, pag-44, pag-46, pag-47, pag-50); comparação visual registrada nesta sessão.
- **Status:** Vigente com ressalva (figuras 2 e 4 do manual não comparadas: figura 2 é diagrama estrutural e figura 4 é exemplo de lombada, fora de escopo por D-19).

---

### D-24 — Publicação do template v002 (correções de P-01 e P-03)

- **Data:** 23/11/2026
- **Decisão:** criada a versão `ferramentas/template/tcc-v002.typ`, sem editar a v001, com três correções validadas em `%TEMP%\opencode\cmp-v002\out.pdf`:
  1. Legenda e fonte de ilustrações e tabelas: alinhadas à esquerda, acompanhando as margens da ilustração (manual, 2.11 e 2.12), com o rótulo ("Figura n", "Tabela n", "Quadro n") e a palavra "Fonte:" em negrito.
  2. A fonte da ilustração passa a ser impressa em negrito ("Fonte:") e alinhada à esquerda, dentro do bloco da ilustração (manual, 2.11).
  3. Folha de aprovação: o nome do examinador passa a ser precedido do título (Prof. Dr., Profa. Me.) e a instituição passa a ser impressa em linha própria, em ordem título, nome, instituição (manual, 5.2.5 f).
  A v001 permanece imutável e disponível no menu do `gerar-pdf.bat`.
- **Base normativa:** Manual SENAI-SP 2025, 2.11 (pp. 8-9), 2.12 (pp. 9-10), 5.2.5 (pp. 38-39).
- **Evidência:** compilação de `%TEMP%\opencode\cmp-v002\out.pdf` (10 páginas, sem avisos) e renderização de `pag-03.png` (folha de aprovação) e `pag-02.png` (figura).
- **Status:** Vigente com ressalva (validação visual completa da v002 em máquina de aluno pendente, P-10).

---

## 4. Divergências e interpretações registradas

| # | Origem | Divergência | Interpretação adotada | Status |
|---|---|---|---|---|
| 1 | Manual, 2.4 (p. 5) × figura da p. 45 | A seção manda o sumário repetir o destaque do texto; a figura mostra níveis 3 a 5 sem espelhamento | Vale a seção 2.4 (D-09) | Vigente |
| 2 | Manual, 2.8 (p. 7) × prática comum em Word | Contagem começa na folha de rosto, não na capa | Vale o manual (D-05) | Vigente |
| 3 | NBR 6024:2012, 4.1 j) | A norma exige hierarquia tipográfica, mas deixa livres os recursos de destaque | Adotados maiúsculas, negrito, itálico e sublinhado (D-04) | Vigente |
| 4 | NBR 6027:2012, 5.2 | Títulos do sumário alinhados pelo indicativo mais extenso | Coluna fixa de 4 em; ressalva com 10+ seções primárias (D-08) | Vigente com ressalva |
| 5 | Manual, 2.11 (pp. 8-9) × template v001 | A fonte e a legenda de ilustrações/tabelas devem acompanhar as margens da ilustração; a v001 centralizava a fonte | Corrigido na v002 (D-24) | Vigente |
| 6 | Manual, 5.2.5 (pp. 38-39) × figura 6 | A figura omite a data de aprovação, que o texto exige | Vale o texto; template mantém "Aprovado em:" | Vigente |
| 7 | Manual, 2.4 (p. 5) × figura da p. 45 | Reafirmação de D-09 para as figuras pré-textuais: prevalece a seção 2.4 sobre a figura | Vale a seção 2.4 (D-09, D-23) | Vigente |

---

## 5. Lacunas que este registro não resolve

Não são decisões: são assuntos abertos, detalhados em `docs/PENDENCIAS.md`.

- Normas IBGE de apresentação tabular não estão em `docs/`; a formatação de tabelas segue o manual e a prática já adotada, sem base normativa própria.
- O template não tem funções próprias para os elementos opcionais: errata, glossário e as listas de ilustrações e de tabelas ainda têm ressalvas de formatação (D-18 e P-20).
- O template não foi comparado visualmente com todas as figuras do manual (figuras 2 e 4 ainda pendentes; figuras 1, 3, 5 e 6 comparadas em D-23).
- O ambiente só foi testado nesta máquina.

---

## 6. Histórico deste documento

| Data | Alteração | Responsável |
|---|---|---|
| 12/11/2026 | Criação, com D-01 a D-14 | Sessão de trabalho autorizada pelo professor |
| 16/11/2026 | D-06 marcada como substituída; inclusão de D-15 a D-17 (template versionado, criação de grupo por BAT, `tcc.typ` versionado) | Sessão de trabalho autorizada pelo professor |
| 23/11/2026 | D-09 confirmada como Vigente; inclusão de D-18 a D-21 (elementos opcionais na pasta-modelo, lombada não oferecida, binário e fontes no Git, registro de testes) | Sessão de trabalho autorizada pelo professor |
| 23/11/2026 | Inclusão de D-22 (sem registro escrito da licença das fontes por enquanto) | Sessão de trabalho autorizada pelo professor |
| 23/11/2026 | Inclusão de D-23 (P-01 concluído para figuras pré-textuais) e D-24 (publicação da v002); atualização de PENDENCIAS.md e TESTES.md | Sessão de trabalho autorizada pelo professor |

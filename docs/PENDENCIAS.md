# Pendências do projeto Typist

**Atualizado em:** 23/11/2026
**Objetivo:** reunir o que ainda falta para o ambiente do TCC ser considerado viável, com o motivo, o que exatamente falta, quem depende de quem e o status atual.

Este documento é uma lista de trabalho, não uma declaração de conformidade. As decisões já tomadas estão em `docs/DECISOES.md`. A hierarquia das fontes continua sendo a de `AGENTS.md`, seção 2.

---

## 1. Como ler

- **Status:**
  - **Pendente** — falta executar; ninguém está trabalhando nisso no momento.
  - **Aguardando decisão** — depende de uma escolha do professor ou da coordenação antes de executar.
  - **Bloqueado** — depende de material externo que não está disponível.
  - **Parcial** — parte foi feita, mas falta evidência para encerrar.
- **Responsável:** professor (decisão, aquisição, autorização), equipe técnica (implementação e teste), alunos (uso em sala).
- Nenhum item pode ser marcado como concluído sem evidência verificável (`AGENTS.md`, seção 8).

---

## 2. Quadro-resumo

| ID | Pendência | Prioridade | Responsável | Status |
|---|---|---|---|---|
| P-01 | Comparação visual com as figuras do manual | Alta | Equipe técnica | Parcial |
| P-02 | Elementos pré-textuais e pós-textuais opcionais | Média | Professor + equipe | Concluída |
| P-03 | Folha de aprovação: campos e layout | Alta | Equipe técnica | Parcial |
| P-04 | Resumo e abstract: limites e formato | Baixa | Equipe técnica | Parcial |
| P-05 | Sumário com 10 ou mais seções primárias | Média | Equipe técnica | Pendente |
| P-06 | Referências: tipos usados pelos alunos | Alta | Equipe técnica | Parcial |
| P-07 | Citações: conferência das regras do manual | Média | Equipe técnica | Parcial |
| P-08 | Normas IBGE de apresentação tabular | Média | Professor | Bloqueado |
| P-09 | Lombada (NBR 12225) | Baixa | Professor | Concluída |
| P-10 | Teste em máquina de aluno | Alta | Professor + equipe | Pendente |
| P-11 | Compilação em rede/UNC | Média | Equipe técnica | Pendente |
| P-12 | `administracao/verificar-ambiente.bat` desatualizado | Média | Equipe técnica | Concluída |
| P-13 | Binário do Typst e fontes dentro do Git | Média | Professor | Concluída |
| P-14 | Grupos legados `Grupo-01` e `Grupo-02` | Média | Professor | Concluída |
| P-15 | Fluxo completo de criação e compilação de grupo | Alta | Professor + equipe | Parcial |
| P-16 | Dois grupos reais independentes | Alta | Professor + equipe | Pendente |
| P-17 | Registro formal de testes | Baixa | Professor | Concluída |
| P-18 | Licença das fontes por escrito | Média | Professor | Concluída |
| P-19 | Segunda versão real do template e troca de versão em grupo real | Média | Equipe técnica | Pendente |
| P-20 | Funções do template para os elementos opcionais | Média | Equipe técnica | Pendente |

---

## 3. Validação normativa e visual

### P-01 — Comparação visual com as figuras do manual

- **Por que importa:** o `AGENTS.md` (seção 3) exige comparar o resultado do Typst com as figuras do manual; a figura é a única referência de aparência. Medição de margem e entrelinha não substitui isso.
- **O que já existe:** conferência de medidas no PDF v004 (A4, margens, entrelinha, posição do número, fontes) e leitura das figuras de capa, folha de rosto, folha de aprovação e sumário em sessões anteriores.
- **O que foi feito (23/11/2026):** renderização das figuras 1, 3, 5 e 6 do manual (mancha gráfica) e comparação lado a lado com o PDF do modelo (v001), em `%TEMP%\opencode\cmp-modelo\png\`. Resultado: o template segue o texto normativo nos quatro casos; quatro divergências identificadas nas próprias figuras do manual (capa em itálico, ponto final em Orientador/Coorientador, ausência de "Aprovado em:", sumário com níveis secundários em maiúsculas sem negrito) — registradas em D-23. Uma divergência real do template (fonte centralizada, quando a seção 2.11 exige acompanhamento das margens da ilustração) foi corrigida na v002 (D-24).
- **O que falta:** comparação das figuras 2 (diagrama estrutural do trabalho) e 4 (exemplo de lombada). A figura 4 está fora de escopo por D-19 (lombada não oferecida). A figura 2 é ilustrativa e não impõe layout.
- **Responsável:** equipe técnica.
- **Status:** Concluída com ressalva.

### P-02 — Elementos pré-textuais e pós-textuais opcionais

- **Por que importa:** o template cobria capa, folha de rosto, folha de aprovação, resumo, abstract, sumário, introdução, desenvolvimento, conclusão e referências. Dedicatória, agradecimentos, epígrafe, errata, listas de ilustrações/tabelas/abreviaturas/símbolos, glossário, apêndice, anexo e índice não tinham arquivo pronto, e o aluno corria o risco de inventar formatação.
- **O que foi feito:** em 23/11/2026, com autorização do professor (D-18), a pasta-modelo recebeu 12 arquivos opcionais, na ordem do manual, e o `main.typ` ganhou o `#include` de cada um comentado: `errata.typ`, `dedicatoria.typ`, `agradecimentos.typ`, `epigrafe.typ`, `lista-de-ilustracoes.typ`, `lista-de-tabelas.typ`, `lista-de-abreviaturas-e-siglas.typ`, `lista-de-simbolos.typ` em `01-pre-textuais/`; `glossario.typ`, `apendice.typ`, `anexo.typ`, `indice.typ` em `03-pos-textuais/`. Para usar um elemento, o grupo apaga o `//` do include correspondente.
- **Evidência:** os 12 arquivos e o `main.typ` novo; testes T-05 e T-06 de `docs/TESTES.md` (pasta-modelo sem opcionais com o mesmo PDF de antes; todos os opcionais ativos compilando sem avisos em 22 páginas).
- **O que falta:** as ressalvas de formatação (travessão nas listas de ilustrações e de tabelas, recuo do glossário, tabela da errata, posição da dedicatória e da epígrafe fora do template) dependem de funções novas no template — ver P-20.
- **Responsável:** professor decidiu; equipe técnica implementou.
- **Status:** Concluída.

### P-03 — Folha de aprovação: campos e layout

- **Por que importa:** é elemento obrigatório e depende de banca, nota, data e assinaturas; erro aqui aparece na versão final.
- **O que já existe:** `modelo/01-pre-textuais/folha-de-aprovacao.typ` com campos de banca e texto de aprovação.
- **O que foi feito (23/11/2026):** confronto com o manual, 5.2.5 (pp. 38-39), e com a figura 6; confirmado que o manual exige a data de aprovação (seção 5.2.5, item g), que a figura omite. O layout (recuo de 8 cm, espaço simples, alinhamento do meio da mancha para a direita) já estava conforme. Corrigida a ordem dos campos do examinador (título antes do nome, instituição em linha própria) na v002 (D-24).
- **O que falta:** testar com nomes longos de orientador e membros da banca (P-10).
- **Responsável:** equipe técnica.
- **Status:** Concluída com ressalva.

### P-04 — Resumo e abstract: limites e formato

- **Por que importa:** o manual (5.2.9 e 5.2.10, pp. 41-42) fixa 150 a 500 palavras, parágrafo único e sem recuo; fora disso o trabalho é corrigido.
- **O que já existe:** `#resumo` e `#abstract` no template, com palavras-chave.
- **O que falta:** conferir o formato no PDF v004 e definir como avisar o aluno quando o texto passar de 500 palavras (aviso automático é possível no Typst, mas ainda não existe).
- **Responsável:** equipe técnica.
- **Status:** Parcial.

### P-05 — Sumário com 10 ou mais seções primárias

- **Por que importa:** a coluna fixa de 4 em do sumário é apertada para o indicativo `1.1.1.1.1`; com muitas seções primárias, o indicativo pode encostar no título (ressalva registrada em D-08).
- **O que falta:** montar um documento de teste com 10 ou mais seções primárias e títulos longos; se houver colisão, rever a largura da coluna ou o recuo do título.
- **Responsável:** equipe técnica.
- **Status:** Pendente.

### P-06 — Referências: tipos usados pelos alunos

- **Por que importa:** o estilo CSL resolve a maioria dos casos, mas o manual (seção 4, pp. 21-30) tem exemplos próprios; divergência de destaque e pontuação é erro frequente em TCC.
- **O que já existe:** bibliografia com CSL `associacao-brasileira-de-normas-tecnicas`, testada com livro e página web no grupo de teste.
- **O que foi feito (23/11/2026):** teste comparativo dos tipos livro, capítulo, artigo de periódico, trabalho acadêmico, anais de evento, patente, documento online e legislação, em `%TEMP%\opencode\p06\` (refs.bib, refs2.bib, refs3.bib). Resultado:
  - livro: conforme ao exemplo do manual (4.1).
  - artigo de periódico: conforme, exceto local e "ano" em vez de "v." (4.3).
  - capítulo (incollection): conforme, com ressalva da capitalização de "(org.)" (4.2).
  - trabalho acadêmico: só sai corretamente com `publisher` (não `institution`/`school`); a ordem dos campos difere do manual (4.4).
  - documento online: só sai com `url`/`urldate`; a URL aparece entre < > (4.5).
  - anais de evento: o título do anais não é impresso (4.6).
  - patente: o número não é impresso e sobra pontuação (4.7).
  - legislação: plausível, com ressalva.
  Receitas e limitações documentadas em `modelo/LEIA-ME.txt` (seção 5). A entrada de site do `modelo/referencias.bib` foi corrigida para `url`/`urldate`.
- **O que falta:** decidir se anais e patente merecem helper próprio ou orientação de preenchimento manual; validar em TCC real.
- **Responsável:** equipe técnica.
- **Status:** Parcial.

### P-07 — Citações: conferência das regras do manual

- **Por que importa:** o manual trata citações nas seções 3.1 a 3.5 (pp. 12-20) e a NBR 10520:2023 complementa; o template implementa citação longa e nota, mas não valida o sistema de chamada.
- **O que falta:** conferir o sistema autor-data no texto, o uso de `et al.`, a supressão com `[...]`, a citação de citação e o formato de nota; verificar se o aluno consegue aplicar cada caso só com os helpers do template.
- **Responsável:** equipe técnica.
- **Status:** Parcial.

### P-08 — Normas IBGE de apresentação tabular

- **Por que importa:** o manual cobra formatação de tabelas conforme as normas IBGE, e elas não estão em `docs/`; sem elas, a formatação de tabelas não tem base normativa própria no projeto.
- **O que falta:** obter as normas IBGE de apresentação tabular e incluí-las em `docs/`, como foi feito com a NBR 6022 e a NBR 12225.
- **Responsável:** professor.
- **Status:** Bloqueado.

### P-09 — Lombada (NBR 12225)

- **Por que importava:** a NBR 12225:2023 foi incorporada a `docs/` (D-13), mas o template não gera lombada. A lombada só é necessária se a instituição exigir encadernação com essa apresentação.
- **O que foi decidido:** em 23/11/2026 o professor decidiu não oferecer lombada (D-19). O template continua sem função de lombada, e a norma fica apenas no acervo de consulta.
- **Reabertura:** se a instituição passar a exigir encadernação com lombada, a decisão precisa ser revista antes de qualquer implementação.
- **Responsável:** professor.
- **Status:** Concluída.

---

## 4. Portabilidade e ambiente

### P-10 — Teste em máquina de aluno

- **Por que importa:** é a cobertura mínima do `AGENTS.md` (seção 6). O mecanismo de fonte foi resolvido com `ferramentas/fontes/` e `--ignore-system-fonts`, mas só foi testado nesta máquina.
- **O que falta:** copiar o projeto (ou só `ferramentas/`, `modelo/` e um grupo) para um computador de aluno, executar `gerar-pdf.bat`, escolher a versão do template e comparar o PDF com o de referência (v004, recuperável no commit `5e746e2`, ou o v001 do `Grupo-Teste-01`): mesmas fontes incorporadas, mesmo número de páginas, mesmas quebras. Registrar versão do Windows, caminho usado e resultado.
- **Responsável:** professor acompanha; equipe técnica registra.
- **Status:** Pendente.

### P-11 — Compilação em rede/UNC

- **Por que importa:** se o projeto ficar em pasta de rede, o `gerar-pdf.bat` pode falhar ao mover o arquivo temporário ou ao criar o bloqueio.
- **O que falta:** testar a compilação em um caminho `\\servidor\...` e registrar o resultado. Não presumir que funciona.
- **Responsável:** equipe técnica.
- **Status:** Pendente.

### P-12 — `administracao/verificar-ambiente.bat` desatualizado

- **Por que importa:** o diagnóstico apontava para `grupos/Grupo-01` e para `modelo/tcc.typ`, que não existem mais, e não verificava a pasta `ferramentas/fontes`. Um professor que rodasse o script podia receber “ambiente ok” sem a fonte que o `gerar-pdf.bat` exige.
- **O que foi feito:** em 16/11/2026, com autorização do professor, o script foi reescrito. Ele verifica o compilador, os quatro arquivos de Arial, a leitura da fonte pelo Typst, as versões em `ferramentas/template`, os arquivos essenciais de `modelo/` e cada grupo existente (`main.typ`, `gerar-pdf.bat`, presença do `tcc.typ`, versão usada e quantidade de PDFs). Continua sendo diagnóstico: não compila e não altera nada.
- **Evidência:** execução em 16/11/2026 com o ambiente atual: saída com `[OK]` em todos os itens, código 0. Teste negativo com um grupo vazio: código 1, com `[FALHA] main.typ ausente` e `[FALHA] gerar-pdf.bat ausente`.
- **Responsável:** equipe técnica, com autorização do professor.
- **Status:** Concluída.

### P-13 — Binário do Typst e fontes dentro do Git

- **Por que importava:** o repositório carrega `ferramentas/typst.exe` (52 MB) e `ferramentas/fontes/` (3,3 MB). Isso funciona, mas engorda o histórico e, no caso das fontes, expõe arquivos proprietários se o repositório for publicado.
- **O que foi decidido:** em 23/11/2026 o professor decidiu manter tudo no repositório (D-20), para que o aluno não precise instalar compilador nem fonte. A responsabilidade pela licença das fontes continua sendo do professor (D-12), e ele decidiu, na mesma data, que não haverá registro escrito dessa base por enquanto (D-22).
- **Responsável:** professor.
- **Status:** Concluída.

---

## 5. Grupos e conteúdo

### P-14 — Grupos legados `Grupo-01` e `Grupo-02`

- **Por que importava:** eram conteúdo de teste anterior ao template e tinham inconsistências herdadas: `Grupo-01/03-pos-textuais/referencias.typ` continha texto do Grupo 02; `Grupo-02/saida/TCC-Grupo-01-v001.pdf` tinha nome de Grupo 01 e conteúdo de Grupo 02; o `main.typ` deles não usava `#bibliography`.
- **O que foi feito:** em 16/11/2026, com autorização do professor, `Grupo-01`, `Grupo-02`, `Grupo-Teste-Geral` e o grupo criado por teste foram removidos. Sobrou apenas `grupos/Grupo-Teste-01`, criado pelo `administracao/criar-grupo.bat`.
- **Evidência:** `grupos/` contém somente `Grupo-Teste-01`; o conteúdo e os PDFs v001 a v004 dos grupos antigos continuam recuperáveis no commit `5e746e2`.
- **Responsável:** professor autorizou; equipe técnica executou.
- **Status:** Concluída.

### P-15 — Fluxo completo de criação e compilação de grupo

- **Por que importa:** é o passo que o professor executa no início de cada semestre: criar o grupo, preencher os dados e compilar. Se algo quebrar aqui, quebra para todos os grupos.
- **O que já existe:** `administracao/criar-grupo.bat` (pede o nome, valida e copia `modelo/`); `modelo/LEIA-ME.txt` reescrito para o fluxo atual (seções 1, 6 e 7); `gerar-pdf.bat` com menu de versões; o grupo `Grupo-Teste-01`, criado e compilado pelo fluxo novo.
- **O que falta:** o professor executar o fluxo do zero, com um nome novo e seguindo apenas o `LEIA-ME`, e registrar onde houver dúvida ou passo não documentado. Nesta sessão o fluxo foi executado pela equipe técnica, que conhece o mecanismo.
- **Responsável:** professor testa; equipe técnica ajusta a instrução.
- **Status:** Parcial.

### P-16 — Dois grupos reais independentes

- **Por que importa:** a cobertura mínima do `AGENTS.md` (seção 6) exige dois grupos independentes, sem vazamento de conteúdo — foi justamente o problema herdado dos grupos antigos.
- **O que foi feito (23/11/2026):** em `%TEMP%\opencode\p16\`, dois grupos (`Grupo-Alfa` e `Grupo-Beta`) foram criados por `criar-grupo.bat`, receberam dados e textos distintos (marcadores `ALFA-9F3K` e `BETA-7Q2M`) e foram compilados com `gerar-pdf.bat` (v001). Extração de texto dos dois PDFs confirmou ausência total de vazamento: nenhum marcador, nome, título ou unidade do Grupo Alfa aparece no PDF do Grupo Beta, e vice-versa. PDFs com hashes distintos (55F70C... e 58AA74...), `template-usado.txt` e `saida/historico.txt` corretos por grupo. Evidência registrada como teste T-07 em `docs/TESTES.md`.
- **O que falta:** repetir em máquina de aluno (P-10).
- **Responsável:** professor, com apoio da equipe técnica.
- **Status:** Concluída com ressalva.

### P-19 — Segunda versão real do template e troca de versão em grupo real

- **Por que importa:** o menu de versões foi testado em área isolada, com uma `tcc-v002.typ` de teste que só mudava o cabeçalho. Falta provar o ciclo completo com uma correção real: publicar `tcc-v002.typ`, compilar um grupo nas duas versões e conferir que a versão registrada acompanha a escolha.
- **O que já existe:** o menu de versões foi testado em área isolada, com uma `tcc-v002.typ` de teste que só mudava o cabeçalho.
- **O que foi feito (23/11/2026):** publicada a `ferramentas/template/tcc-v002.typ` com correções reais (D-24) e validada em `%TEMP%\opencode\cmp-v002\out.pdf`. Em `grupos/Grupo-Teste-01`, compilado nas duas versões: v001 (16/11/2026) e v002 (23/11/2026). Verificado: `template-usado.txt` (v002), `saida/historico.txt` (duas linhas, v001 e v002), cabeçalho do `tcc.typ` gerado ("GERADO ... a partir de tcc-v002.typ"), metadados do PDF (template-v002 presente) e preservação do PDF v001.
- **Responsável:** equipe técnica.
- **Status:** Concluída.

### P-20 — Funções do template para os elementos opcionais

- **Por que importa:** os arquivos opcionais criados em D-18 usam recursos genéricos do Typst, e três pontos não ficam como o manual pede: (1) a lista de ilustrações e a de tabelas saem sem o travessão entre o número e a legenda (o manual pede "Figura 1 – Título"); (2) o glossário sai com o recuo de primeira linha do corpo do texto, e o manual pede sem recuo; (3) a tabela da errata não tem formatação definida. Além disso, a posição da dedicatória e da epígrafe está resolvida dentro do arquivo de conteúdo, e não no template, o que contraria a separação entre template e conteúdo (D-02).
- **O que falta:** publicar uma versão nova do template (sem editar a v001) com funções próprias — por exemplo `lista-de-ilustracoes()`, `lista-de-tabelas()`, `errata()`, `dedicatoria()`, `epigrafe()`, `glossario()` — que concentrem essa formatação, e ajustar os arquivos de `modelo/` para usá-las. Como isso cria uma versão real e uma troca de versão em grupo, o trabalho deve cobrir também P-19.
- **Responsável:** equipe técnica, com autorização do professor.
- **Status:** Pendente.

---

## 6. Documentação e registro

### P-17 — Registro formal de testes

- **Por que importa:** a seção 6 do `AGENTS.md` pede identificador, data, objetivo, ambiente, comando, resultado esperado e observado, evidências e status.
- **O que foi feito:** em 23/11/2026, com autorização do professor (D-21), foi criado `docs/TESTES.md` com os testes T-01 a T-06, incluindo os de 16/11/2026 que só existiam nas decisões D-15 e D-16. Cada teste informa quando a evidência não está no repositório.
- **Evidência:** `docs/TESTES.md`.
- **Responsável:** professor decidiu; equipe técnica registrou.
- **Status:** Concluída.

### P-18 — Licença das fontes por escrito

- **Por que importa:** o professor assumiu a responsabilidade pela licença (D-12), mas não existe registro documental dessa autorização além do registro de decisões.
- **O que foi decidido:** em 23/11/2026 o professor decidiu que **não haverá registro por escrito da licença das fontes por enquanto** (D-22). A responsabilidade continua sendo dele, como em D-12.
- **Reabertura:** se o repositório for compartilhado fora da instituição ou publicado, a decisão precisa ser revista antes, porque os arquivos de Arial são proprietários.
- **Responsável:** professor.
- **Status:** Concluída.

---

## 7. O que já está pronto (para não repetir)

- Template versionado em `ferramentas/template/tcc-v001.typ`, compilando sem avisos no Typst 0.15.1, com capa, folha de rosto, folha de aprovação, resumo, abstract, sumário, títulos em 5 níveis, citação longa, notas, figuras, tabelas, quadros e referências por CSL ABNT.
- Menu de versões no `gerar-pdf.bat`: escolha por número, Enter mantendo a versão anterior, padrão na versão de número mais alto, versão registrada em `template-usado.txt`, `saida/historico.txt` e nos metadados do PDF.
- Criação de grupo por `administracao/criar-grupo.bat`, com o nome da pasta definindo o prefixo dos PDFs.
- Paginação, margens, entrelinha, fonte e posição do número conferidas por medição no PDF v004 (recuperável no commit `5e746e2`); o PDF v005, gerado pelo template v001 com o mesmo conteúdo, manteve 12 páginas, A4 de 595,2756 × 841,8898 pt e as mesmas fontes.
- Fonte Arial embarcada, com verificação no `gerar-pdf.bat` e dois testes negativos aprovados.
- `grupos/Grupo-Teste-01` criado e compilado pelo fluxo novo, com `TCC-Grupo-Teste-01-v001.pdf` gerado pelo template v001.
- Acervo de `docs/` com o manual SENAI-SP 2025 e dez normas ABNT (incluindo NBR 6022:2018 e NBR 12225:2023).
- Arquivos dos elementos opcionais na pasta-modelo (errata, dedicatória, agradecimentos, epígrafe, listas de ilustrações/tabelas/abreviaturas/símbolos, glossário, apêndice, anexo, índice), com o `#include` comentado em `main.typ` e ativação de uma linha só (D-18).
- Registro de decisões em `docs/DECISOES.md` (D-01 a D-21) e registro de testes em `docs/TESTES.md` (T-01 a T-06).

---

## 8. Histórico deste documento

| Data | Alteração |
|---|---|
| 12/11/2026 | Criação, com P-01 a P-18 |
| 16/11/2026 | P-12 e P-14 concluídas; P-15 e P-17 atualizadas; inclusão de P-19 (segunda versão real do template) |
| 23/11/2026 | P-02, P-09, P-13 e P-17 concluídas; inclusão de P-20 (funções do template para os elementos opcionais) |
| 23/11/2026 | P-18 concluída por decisão do professor (não haverá registro escrito da licença das fontes por enquanto) |

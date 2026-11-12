# Pendências do projeto Typist

**Atualizado em:** 12/11/2026
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
| P-02 | Elementos pré-textuais e pós-textuais opcionais | Média | Professor + equipe | Aguardando decisão |
| P-03 | Folha de aprovação: campos e layout | Alta | Equipe técnica | Parcial |
| P-04 | Resumo e abstract: limites e formato | Baixa | Equipe técnica | Parcial |
| P-05 | Sumário com 10 ou mais seções primárias | Média | Equipe técnica | Pendente |
| P-06 | Referências: tipos usados pelos alunos | Alta | Equipe técnica | Parcial |
| P-07 | Citações: conferência das regras do manual | Média | Equipe técnica | Parcial |
| P-08 | Normas IBGE de apresentação tabular | Média | Professor | Bloqueado |
| P-09 | Lombada (NBR 12225) | Baixa | Professor | Aguardando decisão |
| P-10 | Teste em máquina de aluno | Alta | Professor + equipe | Pendente |
| P-11 | Compilação em rede/UNC | Média | Equipe técnica | Pendente |
| P-12 | `administracao/verificar-ambiente.bat` desatualizado | Média | Equipe técnica | Aguardando autorização |
| P-13 | Binário do Typst e fontes dentro do Git | Média | Professor | Aguardando decisão |
| P-14 | Grupos legados `Grupo-01` e `Grupo-02` | Média | Professor | Aguardando decisão |
| P-15 | Fluxo completo de cópia da pasta-modelo | Alta | Professor + equipe | Parcial |
| P-16 | Dois grupos reais independentes | Alta | Professor + equipe | Pendente |
| P-17 | Registro formal de testes | Baixa | Professor | Aguardando decisão |
| P-18 | Licença das fontes por escrito | Média | Professor | Aguardando decisão |

---

## 3. Validação normativa e visual

### P-01 — Comparação visual com as figuras do manual

- **Por que importa:** o `AGENTS.md` (seção 3) exige comparar o resultado do Typst com as figuras do manual; a figura é a única referência de aparência. Medição de margem e entrelinha não substitui isso.
- **O que já existe:** conferência de medidas no PDF v004 (A4, margens, entrelinha, posição do número, fontes) e leitura das figuras de capa, folha de rosto, folha de aprovação e sumário em sessões anteriores.
- **O que falta:** comparação lado a lado documentada, figura por figura, com o PDF gerado, registrando divergências e o que foi ajustado. As figuras são imagens dentro do PDF do manual e precisam ser renderizadas para leitura.
- **Responsável:** equipe técnica.
- **Status:** Parcial.

### P-02 — Elementos pré-textuais e pós-textuais opcionais

- **Por que importa:** o template cobre capa, folha de rosto, folha de aprovação, resumo, abstract, sumário, introdução, desenvolvimento, conclusão e referências. Dedicatória, agradecimentos, epígrafe, errata, listas de ilustrações/tabelas/abreviaturas, glossário, apêndice, anexo e índice não têm arquivo pronto.
- **O que falta:** confirmar no manual (capítulo 5, seções 5.2 e 5.3) quais desses elementos são previstos para o TCC do SENAI-SP, quais são obrigatórios e como devem ser formatados; depois decidir se a pasta-modelo traz arquivos prontos (mesmo que vazios) ou apenas instrução no `LEIA-ME`.
- **Responsável:** professor decide; equipe implementa.
- **Status:** Aguardando decisão.

### P-03 — Folha de aprovação: campos e layout

- **Por que importa:** é elemento obrigatório e depende de banca, nota, data e assinaturas; erro aqui aparece na versão final.
- **O que já existe:** `modelo/01-pre-textuais/folha-de-aprovacao.typ` com campos de banca e texto de aprovação.
- **O que falta:** conferir contra o manual, 5.2.5 (pp. 37-39) e a figura correspondente; verificar se o espaço para assinaturas e a ordem dos campos coincidem; testar com nomes longos de orientador e de membros.
- **Responsável:** equipe técnica.
- **Status:** Parcial.

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
- **O que falta:** testar os tipos que os alunos realmente usam (livro, capítulo, artigo de periódico, trabalho acadêmico, norma técnica, site, vídeo) e comparar cada um com o exemplo correspondente do manual; se o CSL divergir, registrar a divergência e decidir entre ajuste local ou correção manual orientada.
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

- **Por que importa:** a NBR 12225:2023 foi incorporada a `docs/` (D-13), mas o template não gera lombada, e não há decisão de oferecê-la. A lombada só é necessária se a instituição exigir encadernação com essa apresentação.
- **O que falta:** decidir se o TCC do SENAI-SP precisa de lombada; se precisar, criar um arquivo separado (a lombada não faz parte do PDF do trabalho, e sim da capa dura).
- **Responsável:** professor.
- **Status:** Aguardando decisão.

---

## 4. Portabilidade e ambiente

### P-10 — Teste em máquina de aluno

- **Por que importa:** é a cobertura mínima do `AGENTS.md` (seção 6). O mecanismo de fonte foi resolvido com `ferramentas/fontes/` e `--ignore-system-fonts`, mas só foi testado nesta máquina.
- **O que falta:** copiar o projeto (ou só `ferramentas/`, `modelo/` e um grupo) para um computador de aluno, executar `gerar-pdf.bat` e comparar o PDF com o v004: mesmas fontes incorporadas, mesmo número de páginas, mesmas quebras. Registrar versão do Windows, caminho usado e resultado.
- **Responsável:** professor acompanha; equipe técnica registra.
- **Status:** Pendente.

### P-11 — Compilação em rede/UNC

- **Por que importa:** se o projeto ficar em pasta de rede, o `gerar-pdf.bat` pode falhar ao mover o arquivo temporário ou ao criar o bloqueio.
- **O que falta:** testar a compilação em um caminho `\\servidor\...` e registrar o resultado. Não presumir que funciona.
- **Responsável:** equipe técnica.
- **Status:** Pendente.

### P-12 — `administracao/verificar-ambiente.bat` desatualizado

- **Por que importa:** o diagnóstico ainda aponta para `grupos/Grupo-01` e não verifica a pasta `ferramentas/fontes`. Um professor que rode o script pode receber “ambiente ok” sem a fonte que o `gerar-pdf.bat` exige.
- **O que falta:** atualizar o script para verificar o compilador, a pasta de fontes, o template e um grupo existente; manter o formato de diagnóstico que não compila. Alterar script exige autorização (`AGENTS.md`, seção 9).
- **Responsável:** equipe técnica, com autorização do professor.
- **Status:** Aguardando decisão (autorização para alterar o script).

### P-13 — Binário do Typst e fontes dentro do Git

- **Por que importa:** o repositório carrega `ferramentas/typst.exe` (52 MB) e `ferramentas/fontes/` (3,3 MB). Isso funciona, mas engorda o histórico e, no caso das fontes, expõe arquivos proprietários se o repositório for publicado.
- **O que falta:** decidir se o binário continua versionado (é o que garante que o aluno não precise instalar nada) e se as fontes continuam no Git ou passam a ser distribuídas por outro meio.
- **Responsável:** professor.
- **Status:** Aguardando decisão.

---

## 5. Grupos e conteúdo

### P-14 — Grupos legados `Grupo-01` e `Grupo-02`

- **Por que importa:** são conteúdo de teste anterior ao template e têm inconsistências herdadas: `Grupo-01/03-pos-textuais/referencias.typ` contém texto do Grupo 02; `Grupo-02/saida/TCC-Grupo-01-v001.pdf` tem nome de Grupo 01 e conteúdo de Grupo 02; o `main.typ` deles não usa `#bibliography`.
- **O que falta:** decidir se esses grupos são migrados para o template atual, arquivados fora do repositório ou removidos. Nada será apagado sem autorização (`AGENTS.md`, seção 7).
- **Responsável:** professor.
- **Status:** Aguardando decisão.

### P-15 — Fluxo completo de cópia da pasta-modelo

- **Por que importa:** é o passo que o professor executa no início de cada semestre: copiar `modelo/`, renomear, editar as 3 linhas do `gerar-pdf.bat` e compilar. Se algo quebrar aqui, quebra para todos os grupos.
- **O que já existe:** instrução no `modelo/LEIA-ME.txt` (seções 1 e 2) e o `Grupo-Teste-Geral`, que é uma cópia funcional.
- **O que falta:** executar o fluxo do zero, com um nome novo, seguindo apenas o `LEIA-ME`, e registrar onde houver dúvida ou passo não documentado.
- **Responsável:** professor testa; equipe técnica ajusta a instrução.
- **Status:** Parcial.

### P-16 — Dois grupos reais independentes

- **Por que importa:** a cobertura mínima do `AGENTS.md` (seção 6) exige dois grupos independentes, sem vazamento de conteúdo — foi justamente o problema herdado dos grupos antigos.
- **O que falta:** criar dois grupos a partir do modelo com conteúdo diferente, compilar os dois e conferir que nenhum arquivo, imagem ou referência de um aparece no PDF do outro.
- **Responsável:** professor, com apoio da equipe técnica.
- **Status:** Pendente.

---

## 6. Documentação e registro

### P-17 — Registro formal de testes

- **Por que importa:** a seção 6 do `AGENTS.md` pede identificador, data, objetivo, ambiente, comando, resultado esperado e observado, evidências e status. Hoje o registro existe em texto corrido dentro de `grupos/Grupo-Teste-Geral/LEIA-ME-TESTE-GERAL.txt`.
- **O que falta:** decidir se vale criar um `docs/TESTES.md` com um bloco por teste, ou se o `LEIA-ME` do grupo continua sendo o registro aceito. Enquanto não houver decisão, os testes continuam registrados no `LEIA-ME` do grupo.
- **Responsável:** professor.
- **Status:** Aguardando decisão.

### P-18 — Licença das fontes por escrito

- **Por que importa:** o professor assumiu a responsabilidade pela licença (D-12), mas não há registro documental dessa autorização além do registro de decisões.
- **O que falta:** se o repositório for compartilhado ou publicado, guardar por escrito a base do uso dos arquivos de Arial (licença institucional, contrato ou termo). O projeto não valida essa licença.
- **Responsável:** professor.
- **Status:** Aguardando decisão.

---

## 7. O que já está pronto (para não repetir)

- Template em `modelo/`, compilando sem avisos no Typst 0.15.1, com capa, folha de rosto, folha de aprovação, resumo, abstract, sumário, títulos em 5 níveis, citação longa, notas, figuras, tabelas, quadros e referências por CSL ABNT.
- Paginação, margens, entrelinha, fonte e posição do número conferidas por medição no PDF v004.
- Fonte Arial embarcada, com verificação no `gerar-pdf.bat` e dois testes negativos aprovados.
- `Grupo-Teste-Geral` versionado com PDFs v001 a v004, sem sobrescrita.
- Acervo de `docs/` com o manual SENAI-SP 2025 e dez normas ABNT (incluindo NBR 6022:2018 e NBR 12225:2023).
- Registro de decisões em `docs/DECISOES.md` (D-01 a D-14).

---

## 8. Histórico deste documento

| Data | Alteração |
|---|---|
| 12/11/2026 | Criação, com P-01 a P-18 |

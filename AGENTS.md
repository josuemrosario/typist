# AGENTS.md — Instruções permanentes do projeto Typist

**Projeto:** ambiente de compilação em Typst para TCCs do ensino médio técnico do SENAI-SP
**Público:** alunos do ensino médio técnico, organizados em grupos
**Atualizado em:** 09/11/2026
**Natureza:** instruções permanentes para agentes e futuras sessões

> Este arquivo não substitui o Manual SENAI-SP nem as normas ABNT. Ele define como os agentes devem consultar a documentação, trabalhar na estrutura do projeto, compilar, testar, registrar e se comunicar. Em caso de divergência entre este arquivo e o manual, prevalece o manual.

---

## 1. Objetivo e escopo

O projeto cria um ambiente para que alunos do ensino médio técnico do SENAI-SP produzam o Trabalho de Conclusão de Curso (TCC) em Typst e gerem o PDF por conta própria, substituindo o uso atual do Word.

O ambiente deve oferecer:

- uma **pasta-modelo** com o template do TCC, copiada pelo professor no início do semestre e renomeada com o nome único do grupo;
- uma **pasta por grupo**, contendo todo o conteúdo daquele grupo;
- arquivos `.typ` separados por parte do trabalho;
- pasta de imagens por grupo;
- um `main.typ` como ponto de entrada;
- um `gerar-pdf.bat` que compila e grava o PDF versionado na pasta `saida`;
- um template institucional fiel ao Manual SENAI-SP 2025.

**Escopo vigente:** TCC, tratado conforme o capítulo 5 do Manual SENAI-SP 2025 (trabalhos acadêmicos: TCC/monografia), com apoio do Apêndice A para as regras de formatação. O capítulo 6 (artigo científico) não deve ser aplicado por padrão. Se a coordenação do curso determinar que o TCC deve seguir o formato de artigo, isso precisa ser registrado como nova decisão antes de alterar o template, porque as regras mudam (fonte, espaçamento, estrutura, paginação e sumário).

**O template institucional ainda não existe.** A pasta `modelo/` está vazia. Nenhum PDF, protótipo ou arquivo de teste existente deve ser tratado como template aprovado.

**Fora de escopo neste momento:**

- converter os trabalhos já feitos em Word;
- prometer que PDF → Word preservará formatação;
- publicar os trabalhos em site ou repositório público;
- criar automação de produção (CI, servidor, banco de dados) antes de validar o template;
- migrar todos os grupos antes de o template ser validado.

**Meta operacional:** o professor cria um grupo por vez a partir da pasta-modelo. O repositório atual contém apenas `Grupo-01` e `Grupo-02`, ambos com conteúdo de teste; não presumir que representam grupos reais nem que a estrutura está validada.

---

## 2. Hierarquia das fontes documentais

Ao avaliar requisitos, resolver dúvidas ou tomar decisões, usar esta prioridade:

1. **Manual de Normalização de Trabalhos Acadêmicos — Ensino Superior SENAI-SP, 3ª edição, setembro de 2025**
   Arquivo: `docs/Manual de Normalização de Trabalho Academico - Senai 2025.pdf`
   Fonte institucional principal. Prevalece sobre regras genéricas da ABNT e sobre qualquer modelo chamado “ABNT”.

2. **Normas ABNT disponíveis em `docs/`**
   Complementam o manual, mas não substituem as exigências institucionais:
   - NBR 14724:2024 — Trabalhos acadêmicos;
   - NBR 6023:2025 — Referências;
   - NBR 10520:2023 — Citações;
   - NBR 6024:2012 — Numeração progressiva das seções;
   - NBR 6028:2021 — Resumo, resenha e recensão;
   - NBR 6034:2004 — Índice;
   - NBR 15287:2025 — Projeto de pesquisa.

3. **Este `AGENTS.md` e as decisões registradas no projeto**
   Definem o modo de trabalho. Não podem contrariar o manual nem a ABNT.

4. **Código, scripts, PDFs e demais artefatos**
   Mostram o estado real do projeto, mas não provam conformidade normativa.

**Situação documental atual:** não existe documento mestre nem plano de estudo. Eles foram removidos na reinicialização do projeto em 09/11/2026. Até que um registro de decisões seja criado com autorização, as decisões devem ser descritas na resposta ao professor e mantidas como pendência explícita. Não recriar documentos mestres por conta própria.

**Regra obrigatória:** não substituir exigências do SENAI-SP por regras genéricas da ABNT. Um modelo chamado “ABNT” não é prova de conformidade institucional.

---

## 3. Consulta obrigatória à documentação

Antes de criar, alterar ou validar qualquer parte do template, consultar o manual e a norma aplicável.

| Assunto | Onde consultar |
|---|---|
| Formato, margens, espaçamento, numeração progressiva, paginação, ilustrações, tabelas e quadros | Manual, seções 2.1 a 2.12 (pp. 3-10) |
| Citações | Manual, seções 3.1 a 3.5 (pp. 12-20); NBR 10520:2023 |
| Referências | Manual, seção 4 (pp. 21-30) e 5.4.1 (p. 47); NBR 6023:2025 |
| Estrutura do TCC | Manual, seções 5.1 a 5.4 (pp. 31-49); NBR 14724:2024 |
| Capa, folha de rosto e folha de aprovação | Manual, seções 5.2.1, 5.2.3 e 5.2.5 (pp. 32-39) |
| Resumo e abstract | Manual, seções 5.2.9 e 5.2.10 (pp. 41-42); NBR 6028:2021 |
| Sumário | Manual, seção 5.2.15 (pp. 44-45); NBR 6027 (ausente em `docs/`) |
| Comparação monografia × artigo | Manual, Apêndice A (pp. 60-62) |
| Artigo científico (somente se houver mudança formal de escopo) | Manual, capítulo 6 (pp. 50-55); NBR 6022 (ausente em `docs/`) |

Regras de consulta:

- Citar documento, seção e página ao fundamentar uma conclusão normativa.
- Não inventar regra para preencher lacuna. Registrar como pendência.
- Se um documento não puder ser lido, informar a limitação e o impacto.
- `docs/` é fonte de consulta: não alterar, mover nem renomear sem autorização.
- Figuras do manual (capa, folha de rosto, folha de aprovação, sumário, abertura de artigo) são imagens. A comparação visual com o resultado do Typst é obrigatória e ainda está pendente.
- Documentos ausentes conhecidos: NBR 6027, NBR 6022, NBR 12225 e normas IBGE de apresentação tabular. Não substituí-los por suposições.

### 3.1 Resumo de consulta (não substitui o manual)

Parâmetros do TCC segundo o manual, a serem confirmados no template:

| Item | Exigência | Referência |
|---|---|---|
| Papel | A4 (21 × 29,7 cm) | 2.1, p. 3 |
| Fonte | Arial 12 no texto; Arial 10 nas exceções (citações longas, notas, paginação, legendas e fontes de ilustrações/tabelas) | 2.1, p. 3 |
| Margens | Superior e esquerda 3 cm; inferior e direita 2 cm | 2.2, pp. 3-4 |
| Alinhamento | Texto justificado | 2.2, pp. 3-4 |
| Espaçamento | 1,5 entre linhas; recuo de parágrafo 1,25 cm | 2.3, p. 4 |
| Numeração de seções | NBR 6024; seções primárias em nova página | 2.4, pp. 4-5 |
| Paginação | Contagem a partir da folha de rosto; número visível a partir do primeiro elemento textual, no canto superior direito | 2.8, p. 7 |
| Pré-textuais | Capa, folha de rosto, folha de aprovação, resumo, abstract, sumário | 5.2, pp. 32-45 |
| Resumo | 150 a 500 palavras, parágrafo único, sem recuo | 5.2.9, pp. 41-42 |
| Referências | Ordem alfabética, alinhadas à esquerda, espaço simples, sem recuo, destaque em negrito | 4, pp. 21-30; 5.4.1, p. 47 |

Se qualquer item desta tabela divergir do manual, o manual prevalece. A tabela serve para orientar a implementação, não para dispensar a leitura.

---

## 4. Estrutura do projeto e fluxo de trabalho

### 4.1 Estrutura atual

```
typist/
├── administracao/     verificar-ambiente.bat (diagnóstico; não compila)
├── docs/              manual SENAI-SP e normas ABNT (somente consulta)
├── ferramentas/       typst.exe (compilador compartilhado)
├── modelo/            pasta-modelo do TCC (VAZIA — template ainda não criado)
├── grupos/
│   ├── Grupo-01/      grupo de teste
│   │   ├── main.typ
│   │   ├── gerar-pdf.bat
│   │   ├── referencias.bib
│   │   ├── 01-pre-textuais/
│   │   ├── 02-textuais/
│   │   ├── 03-pos-textuais/
│   │   ├── imagens/
│   │   ├── dados/
│   │   └── saida/     PDFs gerados
│   └── Grupo-02/      grupo de teste
└── AGENTS.md
```

### 4.2 Regras de organização

- Todo arquivo de entrada de um grupo fica **dentro da pasta daquele grupo**. Não criar dependências entre grupos.
- O `main.typ` é o único ponto de entrada. A ordem dos `#include` define a ordem do PDF.
- Ao criar um novo arquivo de conteúdo, criá-lo na subpasta adequada e adicionar o `#include` correspondente em `main.typ`, na posição desejada.
- O `main.typ` pode crescer conforme o grupo adiciona arquivos. Ele deve permanecer legível: um `#include` por linha, na ordem do trabalho.
- Imagens do trabalho ficam em `imagens/` do próprio grupo; dados auxiliares em `dados/`; PDFs gerados em `saida/`.
- Usar caminhos relativos. Não usar caminhos absolutos em `.typ`, `.bat` ou configurações.
- Não duplicar o compilador nem a pasta `ferramentas/` dentro de grupos.
- O nome da pasta do grupo deve ser único, sem espaços e sem acentos (exemplo: `grupo01`). A pasta é criada pelo professor a partir de uma cópia de `modelo/`.

### 4.3 Separação entre template e conteúdo

- Regras de formatação pertencem ao template (capa, margens, fonte, espaçamento, títulos, paginação, sumário, citações, referências, figuras e tabelas).
- Arquivos de conteúdo devem conter apenas texto do trabalho e marcação simples de seções.
- Não espalhar `#set` / `#show` de formatação pelos arquivos dos grupos.
- Enquanto o template não existir, não inventar um “padrão” por grupo e não declarar que um grupo está formatado corretamente.

### 4.4 Fluxo do semestre

1. O professor copia `modelo/` para `grupos/<nome-do-grupo>`.
2. O professor edita as 3 linhas do `gerar-pdf.bat` que contêm o nome do grupo (`title`, `PREFIXO` e a mensagem de `echo`).
3. O professor ajusta os dados de identificação do grupo (quando o template permitir).
4. Os alunos preenchem os arquivos `.typ` de cada parte.
5. Os alunos executam `gerar-pdf.bat` dentro da pasta do grupo.
6. O PDF é gravado em `saida/`, com número de versão sequencial.
7. O grupo revisa o PDF e corrige o conteúdo, repetindo a compilação.

---

## 5. Compilação com Typst no Windows

### 5.1 Compilador

- Usar `ferramentas\typst.exe`. Versão verificada em 09/11/2026: **typst 0.15.1 (9dfd3a08)**.
- O Typst **não está no `PATH`**. Não assumir o comando `typst`.
- Não instalar o Typst globalmente, não alterar `PATH` nem configurações do sistema sem autorização.
- Verificar a versão antes de testar: `ferramentas\typst.exe --version`.

### 5.2 `gerar-pdf.bat`

Comportamento atual, verificado no arquivo do `Grupo-01`:

- Localiza a raiz do projeto a partir da própria pasta (`%~dp0..\..`) e usa `ferramentas\typst.exe`.
- Verifica a existência do compilador e de `main.typ`; aborta com mensagem clara se faltarem.
- Cria `saida\` se não existir.
- Usa bloqueio por diretório `saida\.gerar-pdf.lock`; se o bloqueio existir, aborta.
- Calcula a próxima versão a partir dos PDFs existentes: `TCC-Grupo-0X-vNNN.pdf`, com três dígitos, limite de 999.
- Compila para um arquivo temporário e só então move para o nome final; falha de compilação não consome versão.
- Remove o bloqueio ao final, com sucesso ou erro.

Regras:

- A compilação oficial de um grupo deve usar o `gerar-pdf.bat` daquele grupo.
- Não sobrescrever PDFs históricos. Para testes manuais, compilar para um caminho novo e versionado.
- Não remover `.gerar-pdf.lock` sem verificar se há compilação em andamento ou lock antigo.
- Não compilar durante tarefas de auditoria ou leitura sem autorização.
- Não presumir que a compilação em rede/UNC funciona. Testar em local e registrar limitações.
- **Nome do grupo no BAT (decisão de 09/11/2026):** o nome está fixo em 3 linhas (`title`, `PREFIXO` e a mensagem de `echo`). Ao copiar a pasta, **o professor edita essas 3 linhas** com o nome do novo grupo. A pasta-modelo deve trazer instrução explícita para essa edição. Não automatizar a derivação do nome sem nova decisão do professor.

### 5.3 Fontes

- O manual exige Arial no TCC. A máquina atual possui Arial instalada (verificado com `typst fonts`), mas isso não garante disponibilidade em outras máquinas.
- Arial é fonte proprietária: não redistribuir arquivos de fonte sem verificar licenciamento.
- A portabilidade de fontes para os computadores dos alunos é pendência e precisa ser testada antes de declarar o ambiente viável.

### 5.4 Template (a criar)

O template em `modelo/` deve centralizar, no mínimo:

- configuração de página, margens, fonte, tamanhos, espaçamento, alinhamento e recuo;
- títulos numerados conforme NBR 6024 e seções primárias em nova página;
- paginação conforme o manual;
- capa, folha de rosto, folha de aprovação, resumo, abstract e sumário;
- citações (curtas e longas) e lista de referências;
- legendas e fontes de ilustrações e tabelas;
- campos de identificação que o grupo preenche sem tocar em formatação.

O template só pode ser considerado pronto após validação documentada contra o manual e comparação visual com suas figuras. Não criar “template definitivo” sem essa validação.

---

## 6. Testes e validação

Todo teste deve ser reproduzível e registrado com:

- identificador e data;
- objetivo;
- versão do Typst e sistema operacional;
- arquivos de entrada e saída;
- comando executado;
- resultado esperado e resultado observado;
- logs, PDFs, capturas ou hashes;
- problemas, limitações e pendências;
- status.

**Status permitidos:** Aprovado, Aprovado com ressalvas, Reprovado, Pendente.

Regras:

- Não declarar teste aprovado sem evidência verificável.
- A existência de um PDF não comprova conteúdo, layout ou conformidade.
- Não inferir aprovação de mensagem de sucesso do BAT, de arquivo antigo ou de sessão anterior.
- Evidência incompleta, contraditória ou não reproduzível ⇒ status **Pendente**.
- Validar visualmente contra as figuras do manual, além de conferir texto e propriedades do PDF.
- Separar claramente: proposta, hipótese, teste executado, resultado observado e conclusão.
- Registrar cada desvio normativo e o esforço para corrigi-lo.
- Não apagar evidências de teste que falhou.

Cobertura mínima antes de declarar o ambiente viável:

- compilação em máquina local e em máquina de aluno;
- cópia da pasta-modelo e renomeação do grupo;
- capa, folha de rosto, folha de aprovação;
- resumo e abstract;
- sumário e numeração progressiva;
- paginação;
- figuras e tabelas com legendas e fontes;
- citações e referências;
- dois grupos independentes, sem vazamento de conteúdo;
- geração de PDF versionado sem sobrescrita.

---

## 7. Segurança e preservação dos arquivos

- O modo padrão é **somente leitura**. Criar, editar, mover, renomear ou excluir apenas quando a tarefa autorizar.
- Não alterar `docs/`, o template central, os scripts ou a estrutura de pastas sem autorização.
- Não excluir PDFs de `saida/`, arquivos de alunos, evidências ou temporários sem autorização. Propor a limpeza e aguardar confirmação.
- Não usar `git reset --hard`, `git clean`, `git checkout` destrutivo, force push ou qualquer operação que reescreva histórico.
- Não executar script desconhecido ou não revisado. Ler o `.bat` antes de executar.
- Não alterar permissões, políticas de segurança, configurações de rede ou do sistema.
- **Dados de alunos:** nomes, matrículas, notas e textos dos trabalhos são dados pessoais. Não expô-los em logs, exemplos, commits ou respostas além do necessário.
- Preservar acentuação e codificação; usar UTF-8.
- Antes de qualquer alteração autorizada, verificar `git status` e registrar o estado inicial.
- Em caso de dúvida sobre impacto, parar e perguntar.

---

## 8. Proibição de declarar aprovação sem evidência

É proibido afirmar que um teste passou, que uma norma foi atendida ou que o template está conforme sem evidência documentada.

Não são evidências suficientes:

- “o arquivo existe”;
- “o BAT disse SUCESSO”;
- “o PDF abre”;
- “a aparência parece correta”;
- “a sessão anterior disse que passou”;
- “o documento registra o teste” sem o artefato correspondente.

São evidências aceitáveis, conforme o caso:

- comando e saída do terminal;
- versão do Typst e do sistema operacional;
- PDF de saída e metadados;
- hash do arquivo;
- captura de tela ou inspeção visual registrada;
- comparação com figura/seção do manual;
- logs de erro e de aviso;
- listagem da pasta antes e depois.

Sem evidência, o status é **Pendente**. Havendo contradição, registrar e manter **Pendente** até esclarecimento.

---

## 9. Autorização antes de alterações sensíveis

Pedir autorização explícita ao professor antes de:

- criar ou alterar o template em `modelo/`;
- alterar `gerar-pdf.bat`, `verificar-ambiente.bat` ou qualquer script;
- alterar a estrutura de pastas ou o esquema de nomes;
- excluir, mover ou renomear arquivos;
- limpar `saida/` ou remover PDFs;
- alterar `docs/`;
- alterar permissões, configurações ou histórico do Git;
- criar documento de registro de decisões.

Ao pedir autorização, explicar:

1. o que será alterado;
2. por quê;
3. quais arquivos serão afetados;
4. como o histórico e as evidências serão preservados;
5. qual é o risco de não fazer a alteração.

Não executar antes da confirmação.

---

## 10. Comunicação

- Comunicar em **português brasileiro**, com linguagem clara e objetiva.
- Informar caminhos de arquivos de forma inequívoca.
- Citar documento, seção e página ao apresentar conclusão normativa.
- Separar fato, evidência, hipótese e pendência.
- Não inventar informação. Quando houver lacuna, escrever “pendente” ou “não documentado”.
- Ao relatar teste, informar status e evidência correspondente.
- Ao encontrar inconsistência, descrevê-la sem corrigir silenciosamente.
- Se um documento não puder ser lido, informar a limitação e o impacto.
- Lembrar que o usuário é professor e os usuários finais são alunos: explicar o impacto de decisões técnicas no uso em sala.

---

## 11. Estado atual conhecido (verificar antes de agir)

Levantamento de 09/11/2026, após a reinicialização do projeto:

- **Definições anteriores removidas:** documento mestre, plano de estudo, pasta `analises/` e o `AGENTS.md` anterior.
- **Documentação disponível:** manual SENAI-SP 2025 e sete normas ABNT em `docs/`.
- **Compilador:** `ferramentas/typst.exe`, versão 0.15.1, funcional e fora do `PATH`.
- **Template:** `modelo/` vazio; `administracao/verificar-ambiente.bat` espera `modelo\tcc.typ`.
- **Grupos:** `Grupo-01` e `Grupo-02`, com conteúdo de teste.
- **PDFs:** artefatos de teste em `grupos/*/saida/`; não são referência normativa.
- **Inconsistências herdadas:**
  - `Grupo-01/03-pos-textuais/referencias.typ` contém texto do Grupo 02;
  - `Grupo-02/saida/TCC-Grupo-01-v001.pdf` tem nome de Grupo 01 e conteúdo de Grupo 02;
  - `main.typ` não usa `#bibliography`, então `referencias.bib` não é processado;
  - `gerar-pdf.bat` tem nome de grupo fixo.
- **Não testado:** template, formatação normativa, fontes em outras máquinas, dois grupos reais, referências automatizadas.
- **Pendências críticas:** criar o template; escrever a instrução de cópia da pasta-modelo (inclui a edição manual das 3 linhas do `gerar-pdf.bat`); validar Arial nos computadores dos alunos; comparar visualmente com as figuras do manual.

---

## 12. Checklist antes de concluir uma tarefa

- [ ] Consultei o manual e a norma aplicável à parte afetada?
- [ ] Respeitei a hierarquia das fontes (SENAI-SP > ABNT > AGENTS.md > artefatos)?
- [ ] Alterei apenas o que foi autorizado?
- [ ] Preservei `docs/`, o template, os PDFs e o conteúdo dos grupos?
- [ ] Testei de forma reproduzível e registrei a evidência?
- [ ] Usei o status correto (Aprovado, Aprovado com ressalvas, Reprovado ou Pendente)?
- [ ] Registrei problemas, limitações e pendências?
- [ ] Comuniquei em português brasileiro, com caminhos e referências normativas?
- [ ] Evitei declarar conformidade sem evidência?

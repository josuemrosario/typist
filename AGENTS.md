# AGENTS.md — Instruções permanentes do projeto Typist

**Projeto:** ambiente de compilação em Typst para TCCs do ensino médio técnico do SENAI-SP
**Público:** alunos do ensino médio técnico, organizados em grupos
**Atualizado em:** 12/11/2026
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

**O template institucional existe em `modelo/`, mas não está validado.** Ele compila sem avisos e passou por medições no PDF v004, porém a comparação visual com todas as figuras do manual e o teste em outra máquina continuam pendentes (ver `docs/PENDENCIAS.md`). Nenhum PDF, protótipo ou arquivo de teste deve ser tratado como template aprovado enquanto essas pendências existirem.

**Fora de escopo neste momento:**

- converter os trabalhos já feitos em Word;
- prometer que PDF → Word preservará formatação;
- publicar os trabalhos em site ou repositório público;
- criar automação de produção (CI, servidor, banco de dados) antes de validar o template;
- migrar todos os grupos antes de o template ser validado.

**Meta operacional:** o professor cria um grupo por vez a partir da pasta-modelo. O repositório atual tem `Grupo-Teste-Geral` (cópia atual do modelo) e `Grupo-01`/`Grupo-02` (grupos de teste anteriores ao template, com inconsistências herdadas). Nenhum deles representa grupo real; não presumir que a estrutura está validada.

---

## 2. Hierarquia das fontes documentais

Ao avaliar requisitos, resolver dúvidas ou tomar decisões, usar esta prioridade:

1. **Manual de Normalização de Trabalhos Acadêmicos — Ensino Superior SENAI-SP, 3ª edição, setembro de 2025**
   Arquivo: `docs/Manual de Normalização de Trabalho Academico - Senai 2025.pdf`
   Fonte institucional principal. Prevalece sobre regras genéricas da ABNT e sobre qualquer modelo chamado “ABNT”.

2. **Normas ABNT disponíveis em `docs/`**
   Complementam o manual, mas não substituem as exigências institucionais:
   - NBR 14724:2024 — Trabalhos acadêmicos;
   - NBR 6022:2018 — Artigo em publicação periódica técnica e/ou científica (só para eventual mudança de escopo; ver seção 1);
   - NBR 6023:2025 — Referências;
   - NBR 10520:2023 — Citações;
   - NBR 6024:2012 — Numeração progressiva das seções;
   - NBR 6027:2012 — Sumário;
   - NBR 6028:2021 — Resumo, resenha e recensão;
   - NBR 6034:2004 — Índice;
   - NBR 12225:2023 — Lombada (só se a instituição exigir encadernação com lombada);
   - NBR 15287:2025 — Projeto de pesquisa.

3. **Este `AGENTS.md` e as decisões registradas no projeto**
   Definem o modo de trabalho. Não podem contrariar o manual nem a ABNT.

4. **Código, scripts, PDFs e demais artefatos**
   Mostram o estado real do projeto, mas não provam conformidade normativa.

**Situação documental atual:** o documento mestre e o plano de estudo foram removidos na reinicialização de 09/11/2026 e não devem ser recriados. Em 12/11/2026, por autorização do professor, foram criados dois registros:

- `docs/DECISOES.md` — decisões do projeto, com data, base normativa (documento, seção e página), evidência e status;
- `docs/PENDENCIAS.md` — o que ainda falta fazer, com prioridade, responsável e status.

Em 23/11/2026, também por autorização do professor, foi criado `docs/TESTES.md` — registro de testes, um bloco por teste, com ambiente, comando, resultado esperado e observado, evidência e status.

Esses três arquivos são o registro oficial do projeto. Consultá-los antes de propor mudanças. Alterá-los exige autorização (seção 9).

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
| Sumário | Manual, seção 5.2.15 (pp. 44-45); NBR 6027:2012 |
| Comparação monografia × artigo | Manual, Apêndice A (pp. 60-62) |
| Artigo científico (somente se houver mudança formal de escopo) | Manual, capítulo 6 (pp. 50-55); NBR 6022:2018 |
| Lombada (somente se a instituição exigir encadernação com lombada) | NBR 12225:2023 |

Regras de consulta:

- Citar documento, seção e página ao fundamentar uma conclusão normativa.
- Não inventar regra para preencher lacuna. Registrar como pendência.
- Se um documento não puder ser lido, informar a limitação e o impacto.
- `docs/` é fonte de consulta: não alterar, mover nem renomear sem autorização. Os PDFs são as fontes normativas; `docs/DECISOES.md` e `docs/PENDENCIAS.md` são registros do projeto, não fontes normativas.
- Figuras do manual (capa, folha de rosto, folha de aprovação, sumário, abertura de artigo) são imagens. A comparação visual com o resultado do Typst é obrigatória e ainda está pendente.
- Documentos ausentes conhecidos: apenas as normas IBGE de apresentação tabular. Não substituí-las por suposições.

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
├── administracao/     criar-grupo.bat e verificar-ambiente.bat (não compilam)
├── docs/              manual SENAI-SP, normas ABNT e registros do projeto
│   ├── DECISOES.md    registro de decisões (D-01 a D-21)
│   ├── PENDENCIAS.md  o que ainda falta fazer (P-01 a P-20)
│   └── TESTES.md      registro de testes (T-01 a T-06)
├── ferramentas/       typst.exe, fontes/ (Arial) e template/ (versões)
│   └── template/      tcc-v001.typ, tcc-v002.typ, ... (versões imutáveis)
├── modelo/            pasta-modelo do TCC (não contém tcc.typ)
│   ├── main.typ       ponto de entrada
│   ├── dados.typ      identificação do grupo
│   ├── gerar-pdf.bat  escolhe a versão, compila e versiona o PDF
│   ├── referencias.bib
│   ├── 01-pre-textuais/
│   ├── 02-textuais/
│   ├── 03-pos-textuais/
│   ├── dados/
│   ├── imagens/
│   └── saida/
├── grupos/
│   └── Grupo-Teste-01/  único grupo de teste, criado por criar-grupo.bat
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
- O nome da pasta do grupo deve ser único, sem espaços, sem acentos, com até 40 caracteres e apenas letras, números, hífen e sublinhado (exemplo: `Grupo-01`). A pasta é criada por `administracao\criar-grupo.bat`, nunca por cópia manual.
- O nome da pasta define o nome do grupo no título da janela e o prefixo dos PDFs (`TCC-<nome>-vNNN.pdf`). Renomear a pasta depois de compilar muda o prefixo; para trocar o nome, criar outro grupo.
- O `tcc.typ` do grupo é gerado pelo `gerar-pdf.bat` a partir de `ferramentas/template/`. Ele não é fonte: não editar e não tratar como parte do conteúdo.

### 4.3 Separação entre template e conteúdo

- Regras de formatação pertencem ao template (capa, margens, fonte, espaçamento, títulos, paginação, sumário, citações, referências, figuras e tabelas).
- Arquivos de conteúdo devem conter apenas texto do trabalho e marcação simples de seções.
- Não espalhar `#set` / `#show` de formatação pelos arquivos dos grupos.
- O template existe em `ferramentas/template/tcc-vNNN.typ`; não criar variações de formatação por grupo. Ajuste de formatação se faz publicando uma versão nova e recompilando o grupo, não por edição local.
- Versão publicada do template é imutável: correção gera `tcc-v002.typ`, `tcc-v003.typ` etc., sem editar a anterior.
- O `gerar-pdf.bat` copia a versão escolhida para dentro do grupo como `tcc.typ`, porque o Typst resolve caminhos a partir da pasta do `main.typ` e não aceita importar de fora sem `--root`. Essa cópia é gerada; a fonte da verdade é `ferramentas/template/`.
- O grupo registra a escolha em `template-usado.txt` e em `saida/historico.txt`; a versão também vai nos metadados do PDF (`template-vNNN`), sem aparecer impressa na página.

### 4.4 Fluxo do semestre

1. O professor executa `administracao\criar-grupo.bat` e digita o nome do grupo. O script cria `grupos/<nome-do-grupo>` com uma cópia de `modelo/`.
2. O professor ajusta os dados de identificação do grupo em `dados.typ`.
3. Os alunos preenchem os arquivos `.typ` de cada parte. Os elementos opcionais (dedicatória, agradecimentos, epígrafe, errata, listas, glossário, apêndice, anexo, índice) já existem na pasta do grupo: para usar um deles, o aluno apaga o `//` do `#include` correspondente em `main.typ` e preenche o arquivo.
4. Os alunos executam `gerar-pdf.bat` dentro da pasta do grupo.
5. Na primeira compilação, o script pede a versão do template; nas seguintes, Enter mantém a versão usada antes e um número troca.
6. O PDF é gravado em `saida/`, com número de versão sequencial, e a versão do template fica registrada em `template-usado.txt`, `saida/historico.txt` e nos metadados do PDF.
7. O grupo revisa o PDF e corrige o conteúdo, repetindo a compilação.

---

## 5. Compilação com Typst no Windows

### 5.1 Compilador

- Usar `ferramentas\typst.exe`. Versão verificada em 09/11/2026: **typst 0.15.1 (9dfd3a08)**.
- O Typst **não está no `PATH`**. Não assumir o comando `typst`.
- Não instalar o Typst globalmente, não alterar `PATH` nem configurações do sistema sem autorização.
- Verificar a versão antes de testar: `ferramentas\typst.exe --version`.

### 5.2 `gerar-pdf.bat`

Comportamento atual, verificado no grupo de teste em 16/11/2026:

- Localiza a raiz do projeto a partir da própria pasta (`%~dp0..\..`) e usa `ferramentas\typst.exe`.
- Deriva o nome do grupo do nome da pasta e usa `TCC-<nome>-vNNN.pdf`; não há linhas para editar.
- Verifica a existência do compilador, de `main.typ` e da fonte Arial; aborta com mensagem clara se faltarem.
- Cria `saida\` se não existir.
- Lê as versões de `ferramentas\template\tcc-v*.typ`, mostra o menu com a primeira linha de cada arquivo e pede a escolha.
- `template-usado.txt` guarda a escolha do grupo. Enter (ou entrada vazia) mantém essa versão; digitar o número da lista troca. Na primeira compilação, o padrão é a versão de número mais alto.
- Aceita o número da lista (`2`), o código (`v002`), `002` ou `2`; entrada inválida repete a pergunta até 5 vezes e depois aborta com código 1.
- Adquire o bloqueio `saida\.gerar-pdf.lock` antes de gerar o `tcc.typ`; se o bloqueio existir, aborta.
- Gera `tcc.typ` em arquivo temporário, confirma que o conteúdo do template está presente e só então substitui o arquivo do grupo; uma falha de cópia não deixa `tcc.typ` incompleto.
- Compila com `--font-path`, `--ignore-system-fonts` e `--input "versao-template=vNNN"`, que grava a versão nos metadados do PDF.
- Calcula a próxima versão a partir dos PDFs existentes: `TCC-<nome>-vNNN.pdf`, com três dígitos, limite de 999.
- Compila para um arquivo temporário e só então move para o nome final; falha de compilação não consome versão.
- Registra data, PDF, versão do template e versão do Typst em `saida/historico.txt`; remove o bloqueio ao final, com sucesso ou erro.

Regras:

- A compilação oficial de um grupo deve usar o `gerar-pdf.bat` daquele grupo.
- Não sobrescrever PDFs históricos. Para testes manuais, compilar para um caminho novo e versionado.
- Não remover `.gerar-pdf.lock` sem verificar se há compilação em andamento ou lock antigo.
- Não compilar durante tarefas de auditoria ou leitura sem autorização.
- Não presumir que a compilação em rede/UNC funciona. Testar em local e registrar limitações.
- **Nome do grupo (decisão de 16/11/2026, D-16):** vem do nome da pasta e substitui a antiga edição manual de 3 linhas. Não adicionar de volta linhas “EDITAR” no BAT.
- **`tcc.typ` do grupo:** é gerado, sobrescrito a cada compilação e mesmo assim versionado no Git (D-17). Não editá-lo; ao trocar de versão, commitar o `tcc.typ` junto com `template-usado.txt` para o repositório refletir a versão usada.

### 5.3 Fontes

- O manual exige Arial no TCC. Os arquivos de fonte ficam em `ferramentas/fontes/` (`arial.ttf`, `arialbd.ttf`, `ariali.ttf` e `arialbi.ttf`) e são usados via `--font-path` com `--ignore-system-fonts`.
- Com isso o PDF sai com a mesma fonte em qualquer computador, sem depender da Arial instalada no sistema. Verificado em 12/11/2026: compilação sem fontes do sistema gerou PDF com ArialMT, Arial-BoldMT e Arial-BoldItalicMT.
- O `gerar-pdf.bat` verifica a fonte antes de compilar e aborta quando ela não é encontrada; sem essa verificação o Typst gerava o PDF em Libertinus Serif e ainda informava sucesso.
- Arial é fonte proprietária: embutir subconjunto no PDF é permitido pelo próprio arquivo (`fsType` 0x0008), mas a redistribuição dos arquivos de fonte depende de licenciamento. O professor assumiu a responsabilidade pela licença em 12/11/2026 e decidiu, em 23/11/2026, que não haverá registro escrito dessa base por enquanto (D-12 e D-22).
- Não mover nem renomear `ferramentas/fontes/`; os grupos dependem dessa pasta compartilhada.

### 5.4 Template

O template fica em `ferramentas/template/`, em versões imutáveis (`tcc-v001.typ`, `tcc-v002.typ`, ...), e centraliza:

- configuração de página, margens, fonte, tamanhos, espaçamento, alinhamento e recuo;
- títulos numerados conforme NBR 6024 e seções primárias em nova página;
- paginação conforme o manual;
- capa, folha de rosto, folha de aprovação, resumo, abstract e sumário;
- citações (curtas e longas) e lista de referências;
- legendas e fontes de ilustrações e tabelas;
- campos de identificação que o grupo preenche sem tocar em formatação.

Regras do versionamento:

- A primeira linha de cada `tcc-vNNN.typ` é lida pelo `gerar-pdf.bat` e aparece no menu, no formato `// vNNN | data | descricao`. Manter essa linha em ASCII, sem acentos.
- Versão publicada não é editada. Corrigir formatação significa criar `tcc-vNNN+1.typ`; editar uma versão já usada quebra a rastreabilidade de quem compilou com ela.
- `ferramentas/template/LEIA-ME.txt` descreve a política de versões.
- A versão escolhida fica em `template-usado.txt`, em `saida/historico.txt` e nos metadados do PDF (`template-vNNN`); ela não é impressa na página.
- O grupo não aponta para `ferramentas/template/` em tempo de compilação: o `gerar-pdf.bat` copia a versão escolhida para `tcc.typ` dentro do grupo, porque o Typst não importa de fora da pasta do `main.typ` sem `--root`, e o teste com `--root` mostrou que `image()` e `referencias.bib` passariam a ser resolvidos a partir do arquivo do template.

O template ainda não pode ser considerado pronto: falta validação documentada contra o manual e comparação visual com suas figuras (P-01) e teste em outra máquina (P-10). Não criar “template definitivo” sem essa validação.

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
- alterar `docs/DECISOES.md` (registro de decisões) ou `docs/PENDENCIAS.md` (lista de pendências), inclusive para marcar um item como concluído.

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

Levantamento de 23/11/2026, que substitui o de 16/11/2026. Conferir `docs/PENDENCIAS.md` antes de agir.

- **Definições anteriores removidas:** documento mestre, plano de estudo, pasta `analises/` e o `AGENTS.md` anterior. Não recriar.
- **Registros do projeto:** `docs/DECISOES.md` (D-01 a D-21), `docs/PENDENCIAS.md` (P-01 a P-20) e `docs/TESTES.md` (T-01 a T-06), atualizados em 23/11/2026.
- **Documentação disponível:** manual SENAI-SP 2025 e as onze normas ABNT em `docs/` — NBR 14724:2024, NBR 6022:2018, NBR 6023:2025, NBR 10520:2023, NBR 6024:2012, NBR 6027:2012, NBR 6028:2021, NBR 6034:2004, NBR 12225:2023, NBR 15287:2025 e as normas IBGE de apresentação tabular (`docs/IBGE Normas de apresentacao tabular.pdf`). Ausentes: nenhuma.
- **Compilador:** `ferramentas/typst.exe`, versão 0.15.1, funcional e fora do `PATH`.
- **Fontes:** `ferramentas/fontes/` com `arial.ttf`, `arialbd.ttf`, `ariali.ttf` e `arialbi.ttf` (3.494.124 bytes no total). O `gerar-pdf.bat` compila com `--font-path` e `--ignore-system-fonts` e aborta se a fonte faltar ou estiver inválida.
- **Template versionado:** `ferramentas/template/tcc-v001.typ` (versão inicial), `tcc-v002.typ` (correções de P-01 e P-03) e `tcc-v003.typ` (helpers `anais`, `patente`, `referencia-manual` para P-06), publicados em 23/11/2026; `ferramentas/template/LEIA-ME.txt` (política de versões). `modelo/` não contém `tcc.typ`: ele é gerado na compilação, a partir da versão escolhida.
- **Pasta-modelo:** `modelo/` completa (pré-textuais, textuais, pós-textuais, `dados.typ`, `gerar-pdf.bat`, `LEIA-ME.txt`), compilando sem avisos.
- **Elementos opcionais:** 12 arquivos prontos em `modelo/01-pre-textuais/` (errata, dedicatória, agradecimentos, epígrafe, listas de ilustrações, de tabelas, de abreviaturas e siglas, de símbolos) e em `modelo/03-pos-textuais/` (glossário, apêndice, anexo, índice), com o `#include` comentado em `main.typ`; ativar é apagar o `//` (D-18). Três ressalvas de formatação continuam abertas em P-20.
- **Grupos:** `grupos/Grupo-Teste-01`, criado por `administracao/criar-grupo.bat` em 16/11/2026, com PDF v001 gerado pelo template v001. `Grupo-01`, `Grupo-02` e `Grupo-Teste-Geral` foram removidos com autorização do professor; o conteúdo e os PDFs v001 a v004 continuam recuperáveis no commit `5e746e2`. `grupos/grupojosue/` é teste pessoal do professor, versionado a pedido dele: **não usar como evidência de teste, nem como grupo de referência do projeto** (ainda sem `tcc.typ` e sem PDF em `saida/`).
- **Criação de grupo:** `administracao/criar-grupo.bat` pede o nome, valida (sem espaço, acento, ponto ou hífen inicial; até 40 caracteres; nomes reservados do Windows), recusa pasta existente e copia `modelo/` com `robocopy`.
- **Diagnóstico:** `administracao/verificar-ambiente.bat` verifica compilador, os quatro arquivos de Arial, `ferramentas/template`, `modelo/` e cada grupo; não compila. Atualizado em 16/11/2026 (P-12).
- **Versão no PDF:** a versão escolhida vai nos metadados (`template-vNNN`), em `template-usado.txt` e em `saida/historico.txt`; não é impressa na página.
- **Não testado:** comparação visual com as figuras 2 e 4 do manual (P-01, parcialmente concluído em D-23); compilação em máquina de aluno (P-10); rede/UNC (P-11); tipos de referência além de livro, capítulo, artigo, tese, site (P-06, parcial); listas de ilustrações e de tabelas com figuras, tabelas e quadros no documento (T-06, limitação registrada).
- **Pendências críticas:** P-10, P-15 e P-20, detalhadas em `docs/PENDENCIAS.md`. P-01, P-03 e P-16 concluídos com ressalva nesta rodada (D-23, D-24).

---

## 12. Checklist antes de concluir uma tarefa

- [ ] Consultei o manual e a norma aplicável à parte afetada?
- [ ] Consultei `docs/DECISOES.md` e `docs/PENDENCIAS.md` antes de propor mudança?
- [ ] Respeitei a hierarquia das fontes (SENAI-SP > ABNT > AGENTS.md > artefatos)?
- [ ] Alterei apenas o que foi autorizado?
- [ ] Preservei `docs/`, o template, os PDFs e o conteúdo dos grupos?
- [ ] Se a mudança foi no template, criei uma versão nova em `ferramentas/template/` em vez de editar uma versão publicada?
- [ ] Testei de forma reproduzível e registrei a evidência?
- [ ] Usei o status correto (Aprovado, Aprovado com ressalvas, Reprovado ou Pendente)?
- [ ] Registrei problemas, limitações e pendências?
- [ ] Comuniquei em português brasileiro, com caminhos e referências normativas?
- [ ] Evitei declarar conformidade sem evidência?

# Documento Mestre — Estudo de Viabilidade do Typst para TCCs do SENAI-SP

**Arquivo:** `DocumentoMestreViabilidadeTypst.md`  
**Versão do documento:** 1.0  
**Data:** 15/10/2026  
**Status:** Planejamento; os testes descritos ainda precisam ser executados.

## 1. Finalidade deste documento

Este documento é a fonte central de contexto do projeto **Estudo de Viabilidade do Typst para Trabalhos Acadêmicos do SENAI-SP**. Ele deve ser consultado no início de cada tutorial solicitado em uma conversa separada, para preservar as decisões de arquitetura, os objetivos, as etapas e os resultados já confirmados.

O objetivo é avaliar, por meio de tutoriais práticos e testes reproduzíveis, se o Typst pode ser utilizado para produzir a documentação de TCC dos alunos, com template institucional compartilhado, pastas independentes por grupo e geração controlada de PDFs.

**Importante:** este documento registra a arquitetura proposta, não uma solução já validada. Não afirmar que o compilador, os BATs, o template ou a normalização já funcionam até que os testes correspondentes tenham sido executados.

## 2. Contexto e objetivo geral

O professor trabalha com vários grupos de alunos que precisam gerar a documentação de TCC. A intenção é fornecer uma estrutura de pastas padrão e um arquivo `.bat` que o aluno execute para compilar o trabalho em PDF.

A solução pretendida deverá:

- Usar um único compilador Typst compartilhado pelos grupos, salvo se testes de rede ou políticas de segurança exigirem uma alternativa local controlada.
- Manter um template institucional central, atualizado e publicado pelo professor.
- Manter os arquivos de conteúdo de cada grupo separados.
- Permitir que cada grupo gere seu PDF sem interferir nos demais.
- Gravar cada compilação bem-sucedida em um novo PDF numerado, sem sobrescrever versões anteriores.
- Seguir o Manual de Normalização de Trabalhos Acadêmicos do Ensino Superior SENAI-SP (setembro de 2025) e as normas ABNT aplicáveis.
- Produzir evidências práticas para decidir se o Typst é viável para esse uso.

## 3. Fontes normativas e arquivos de referência

Os arquivos de referência anexados ao projeto incluem:

- Manual de Normalização de Trabalhos Acadêmicos — Ensino Superior SENAI-SP, setembro de 2025.
- ABNT NBR 14724 — Trabalhos acadêmicos.
- ABNT NBR 6024 — Numeração progressiva das seções de um documento.
- ABNT NBR 6028 — Resumo, resenha e recensão.
- ABNT NBR 15287 — Projeto de pesquisa.
- ABNT NBR 10520 — Citações em documentos.
- ABNT NBR 6023 — Referências.
- ABNT NBR 6034 — Índice.

O manual institucional SENAI-SP é a referência principal para os requisitos institucionais do TCC. As normas ABNT complementam a avaliação. Não presumir que um template genérico chamado “ABNT” atende ao manual do SENAI-SP.

A estrutura proposta abaixo se refere a um TCC/monografia. Caso o curso exija artigo científico, confirmar a modalidade e aplicar a seção pertinente do manual, pois o artigo possui estrutura específica.

## 4. Decisões de arquitetura já tomadas

### 4.1 Localização

As pastas dos grupos ficarão em uma **pasta compartilhada na rede da escola**.

### 4.2 Template

Será mantido um **template central atualizado pelo professor**. Os alunos não devem editar diretamente o template institucional nem o executável do compilador.

Permissões desejadas:
- Alunos: leitura do compilador e do template; gravação na pasta de trabalho e de saída do próprio grupo.
- Professor/administrador: manutenção do compilador, do template e dos scripts de administração.

### 4.3 Compilador

A intenção inicial é compartilhar uma única instalação/versão do Typst pela rede. Isso ainda precisa ser testado em relação a permissões, antivírus, cache, fontes, pacotes, caminhos e compilação simultânea.

Se a execução do programa pela rede não funcionar ou for bloqueada pela política da escola, considerar manter o template central e distribuir o compilador em local controlado em cada computador. Essa alternativa deve ser tratada como contingência, não como decisão já tomada.

### 4.4 Geração e versionamento dos PDFs

Cada execução bem-sucedida de `gerar-pdf.bat` deverá gerar um nome novo, por exemplo:

- `TCC-Grupo-01-v001.pdf`
- `TCC-Grupo-01-v002.pdf`
- `TCC-Grupo-01-v003.pdf`

O BAT deve identificar o maior número existente e escolher o próximo. A numeração só deve ser consumida após uma compilação bem-sucedida. PDFs anteriores não devem ser sobrescritos.

Cada grupo terá uma sequência própria. É necessário considerar a concorrência caso mais de um aluno execute a compilação na pasta do mesmo grupo ao mesmo tempo. A implementação precisa evitar que duas execuções criem o mesmo número.

### 4.5 Estrutura de pastas por grupo

Estrutura conceitual proposta:

```text
\\SERVIDOR\TCC-Typst\
├── ferramentas\
│   └── typst.exe
├── modelo\
│   ├── tcc.typ
│   ├── pre-textuais.typ
│   ├── textuais.typ
│   ├── pos-textuais.typ
│   └── estilos.typ
├── administracao\
│   └── verificar-ambiente.bat
└── grupos\
    ├── Grupo-01\
    │   ├── gerar-pdf.bat
    │   ├── main.typ
    │   ├── 01-pre-textuais\
    │   ├── 02-textuais\
    │   ├── 03-pos-textuais\
    │   ├── imagens\
    │   ├── dados\
    │   └── saida\
    └── Grupo-02\
        └── ... mesma estrutura ...
```

O nome `SERVIDOR` é ilustrativo e deverá ser substituído pelo nome real do servidor/compartilhamento da escola.

### 4.6 Organização dos elementos do TCC

A separação digital é uma convenção de organização de arquivos, não uma exigência literal do manual. O Typst deve montar o PDF na ordem institucional correta.

- **Parte externa:** capa, gerada preferencialmente pelo template central; lombada quando aplicável.
- **Pré-textuais:** folha de rosto, errata quando necessária, folha de aprovação, dedicatória, agradecimentos, epígrafe, resumo em português, resumo em língua estrangeira, listas aplicáveis e sumário.
- **Textuais:** introdução, desenvolvimento/capítulos e considerações finais ou conclusão.
- **Pós-textuais:** referências obrigatórias; glossário, apêndices, anexos e índice quando aplicáveis.

Não tratar todos os elementos opcionais como obrigatórios. A sequência final deverá ser conferida no Manual SENAI-SP de 2025.

### 4.7 Arquivos do trabalho

- `main.typ`: ponto de entrada que reúne as partes na ordem correta.
- Arquivos separados para pré-textuais, capítulos e pós-textuais.
- `imagens\`: figuras, fotos, diagramas e gráficos.
- `dados\`: planilhas/dados de apoio, se necessários.
- `saida\`: PDFs versionados, sem sobrescrita.

A estrutura exata dos nomes de arquivos ainda poderá ser refinada no tutorial de modularização.

### 4.8 Script de diagnóstico

`administracao\verificar-ambiente.bat` será uma ferramenta do professor para:
- verificar se o compilador existe;
- verificar se o template central existe;
- mostrar a versão do Typst;
- futuramente compilar um documento mínimo de teste.

Esse script não substitui o BAT de compilação do aluno e, em sua forma inicial, não comprova a conformidade normativa do template.

## 5. Tutorialização como método de estudo

O estudo será desenvolvido em **tutoriais separados, cada um solicitado em uma conversa diferente**. Este documento mestre deve ser a referência comum entre essas conversas.

Cada tutorial deverá:
1. declarar objetivo e pré-requisitos;
2. fornecer instruções passo a passo para Windows e a pasta compartilhada;
3. apresentar arquivos completos quando houver código;
4. explicar onde salvar cada arquivo;
5. oferecer testes verificáveis e resultados esperados;
6. explicar erros comuns;
7. definir critérios de aceitação;
8. registrar resultados reais, limitações e decisões pendentes.

Não avançar automaticamente sobre uma etapa que ainda não foi testada. Distinguir claramente proposta, hipótese, teste executado e resultado observado.

## 6. Sequência planejada dos tutoriais

### Tutorial 1 — Preparar o ambiente Typst
- Escolher e baixar uma versão apropriada do compilador Windows.
- Criar a estrutura de pastas inicial na rede.
- Verificar execução e versão do compilador.
- Criar e compilar um `teste.typ` mínimo.
- Confirmar se o executável pode ser executado diretamente pela rede.
- Registrar dependências de fontes, cache e pacotes.
- **Resultado esperado:** compilador acessível e primeiro PDF de teste, ainda sem template institucional.

### Tutorial 2 — Criar o BAT de compilação
- Localizar a raiz compartilhada e a pasta do grupo.
- Chamar o compilador com caminhos robustos.
- Tratar erros e códigos de saída.
- Gerar o PDF na pasta `saida`.
- Implementar nomes sequenciais como `TCC-Grupo-01-v001.pdf`.
- Garantir que falha não consuma uma versão.
- Avaliar concorrência na mesma pasta.
- **Resultado esperado:** BAT funcional com PDFs numerados e sem sobrescrita.

### Tutorial 3 — Organizar os arquivos do TCC
- Criar `main.typ`.
- Separar pré-textuais, capítulos e pós-textuais.
- Organizar imagens, referências e dados.
- Definir importações/includes e caminhos.
- Testar dois grupos independentes.
- **Resultado esperado:** estrutura modular reproduzível.

### Tutorial 4 — Criar o template institucional SENAI-SP
- Configurar papel, margens, fontes, espaçamento e alinhamento.
- Implementar capa, folha de rosto e folha de aprovação.
- Implementar títulos, numeração progressiva, sumário e paginação.
- Comparar visualmente com o manual SENAI-SP.
- **Resultado esperado:** protótipo visual experimental; não declarar conformidade antes da revisão.

### Tutorial 5 — Citações, referências, figuras e tabelas
- Testar citações diretas e indiretas.
- Testar livros, artigos, DOI, páginas eletrônicas e normas.
- Avaliar BibLaTeX, Hayagriva e estilos CSL disponíveis.
- Verificar figuras, tabelas, legendas e fontes.
- Comparar com ABNT NBR 10520 e NBR 6023 nas versões pertinentes.
- **Resultado esperado:** amostras avaliadas e lista documentada de lacunas.

### Tutorial 6 — Implantar na rede para vários grupos
- Definir permissões por pasta.
- Testar compilação simultânea.
- Verificar isolamento dos arquivos de cada grupo.
- Testar atualização do template central.
- Verificar comportamento em caso de indisponibilidade da rede.
- **Resultado esperado:** piloto operacional com limitações conhecidas.

### Tutorial 7 — Avaliar DOCX e alternativas
- Testar se há necessidade de DOCX editável.
- Comparar caminhos de conversão disponíveis e qualidade das estruturas.
- Comparar Typst com o fluxo Pandoc + Eisvogel.
- Avaliar automação de compilação, inclusive GitHub Actions se apropriado.
- **Resultado esperado:** comparação baseada em evidências.

### Tutorial 8 — Consolidar o estudo de viabilidade
- Reunir resultados e evidências de todos os testes.
- Avaliar fidelidade ao manual, referências, portabilidade, modularidade, manutenção e DOCX.
- Registrar riscos, custos de manutenção e limitações.
- Recomendar adoção integral, uso apenas para PDF ou manutenção da alternativa atual.
- **Resultado esperado:** relatório final de viabilidade.

## 7. Matriz de avaliação sugerida

Utilizar notas de 0 a 5, acompanhadas de evidências e comentários. Os pesos são uma proposta inicial:

| Critério | Peso |
|---|---:|
| Fidelidade ao manual SENAI-SP | 25% |
| Citações e referências | 20% |
| DOCX editável | 15% |
| Portabilidade e dependências | 15% |
| Modularidade para múltiplos grupos | 15% |
| Automação e manutenção | 10% |
| **Total** | **100%** |

Uma falha crítica — por exemplo, impossibilidade de atender requisito institucional obrigatório — não deve ser compensada apenas pela média ponderada.

## 8. Riscos e pontos ainda não resolvidos

- A execução de programas na rede pode ser bloqueada por permissões ou antivírus.
- Fontes ausentes ou diferentes podem alterar a paginação.
- O cache e os pacotes Typst podem introduzir dependências não previstas.
- O template central pode mudar enquanto um grupo está produzindo seu trabalho.
- Dois alunos podem tentar gerar a mesma versão do PDF simultaneamente.
- Um estilo bibliográfico disponível pode não atender à versão das normas exigida.
- A conversão para DOCX pode perder estrutura e formatação.
- A arquitetura de compilador único pode precisar de uma alternativa local controlada.
- O template não deve ser declarado conforme sem comparação com o manual institucional.

## 9. Próxima ação

Começar pelo **Tutorial 1 — Preparar o ambiente Typst no Windows e na pasta compartilhada**. Não desenvolver o template completo antes de confirmar a compilação mínima e os caminhos.

## 10. Como retomar em uma conversa separada

Ao iniciar uma nova conversa para um tutorial, fornecer este documento e uma instrução como:

> Consulte o `DocumentoMestreViabilidadeTypst.md` como fonte de contexto. Desenvolva o Tutorial N seguindo as decisões registradas, com passo a passo, arquivos completos, testes e critérios de aceitação. Não presuma que etapas anteriores passaram sem evidências. Atualize o registro de decisões e resultados somente com o que for efetivamente confirmado.

Se o documento mestre tiver sido atualizado, utilizar sempre a versão mais recente.


## 11. Alterações

Esta seção é o registro contínuo de alterações, inclusões, decisões e esclarecimentos feitos ao longo do projeto.

**Regra de manutenção:** o conteúdo das seções anteriores é preservado. Novas decisões e alterações devem ser acrescentadas nesta seção, com data e descrição, sem reescrever ou remover silenciosamente o texto já existente. Se uma decisão posterior substituir uma anterior, registrar explicitamente a substituição e indicar qual decisão passa a valer. Os tutoriais devem consultar tanto as seções de referência quanto os registros mais recentes desta seção.

### Registro de alterações

#### 2026-10-15 — Criação da seção de alterações
- Estabelecida a seção 11 como local permanente para registrar novas decisões, alterações e inclusões do projeto.
- Definido que o texto existente nas seções anteriores deve ser preservado; atualizações futuras serão acrescentadas ao final desta seção, salvo pedido explícito em contrário.
- Quando uma nova decisão substituir uma decisão anterior, registrar a mudança e seu efeito, sem apagar o histórico.


#### 2026-10-15 — Regra de acréscimo ao final do documento
- O conteúdo que já existe no documento mestre deve permanecer exatamente como está.
- Novas informações, decisões, inclusões e alterações serão acrescentadas somente ao final do documento, dentro da seção **11. Alterações**, como novos registros.
- Não editar, reorganizar, resumir, corrigir ou substituir trechos anteriores. Se uma decisão antiga deixar de valer, acrescentar um novo registro informando qual decisão passa a valer, mantendo o registro anterior intacto.

####  2026-10-16 — Resultados observados do Tutorial 1 (T1-01)
- Ambiente local: Windows 11 Education, versão 22H2, compilação 22621.5771, conforme captura da janela winver enviada durante o teste.
- Compilador: typst 0.15.1 (9dfd3a08). O arquivo ZIP baixado foi listado com 22.463.684 bytes e o typst.exe extraído com 52.487.680 bytes.
- Fonte de teste: grupos\Grupo-01\teste.typ, listado com 436 bytes.
- Compilação local: o comando typst compile ..\grupos\Grupo-01\teste.typ ..\grupos\Grupo-01\saida\teste.pdf terminou sem mensagem de erro. O PDF foi listado com 13.977 bytes e a captura enviada mostra título, parágrafos e acentuação legíveis.
- Teste pela unidade mapeada: o compilador foi executado a partir de P:\Josue Rosario\TCC-Typst\ferramentas, com os arquivos de entrada e saída relativos na estrutura da unidade P:. O comando terminou sem mensagem de erro; o arquivo P:\Josue Rosario\TCC-Typst\grupos\Grupo-01\saida\teste.pdf foi listado com 13.977 bytes e a captura enviada confirma visualmente o texto e os acentos. O volume foi identificado pelo Windows como DADOS.
- Conclusão confirmada: a compilação local e a compilação a partir da unidade mapeada P: funcionaram neste computador, e o PDF gerado pela unidade mapeada foi conferido visualmente.
- Limitações e pendências: não foi testado outro computador ou outra conta; não foi identificado/registrado o caminho UNC correspondente à unidade P:; não foram avaliadas diferenças de fontes ou cache entre ambientes; não foi comparado o hash dos PDFs; e este teste técnico não demonstra conformidade com as normas acadêmicas do SENAI-SP.
- Decisão de arquitetura: manter como hipótese viável a execução de um compilador compartilhado, ainda sujeita a testes adicionais em outro computador/conta e à verificação de fontes, cache e permissões. Não considerar a arquitetura aprovada para toda a escola com base apenas neste teste.
- Evidências: saídas de terminal e capturas de winver, PDF local e PDF produzido pela unidade P: foram fornecidas na conversa. As evidências mostram os resultados acima; este registro é uma síntese, não substitui os testes pendentes.

#### 2026-10-16 — Resultados observados do Tutorial 2 (T2-08)

- **Teste de arquivo de entrada ausente:** o arquivo `main.typ` foi renomeado temporariamente para `main.ty_`. Ao executar `gerar-pdf.bat`, o script informou `ERRO: arquivo de entrada nao encontrado` e exibiu o caminho esperado de `main.typ`.
- **Verificação da pasta de saída:** após restaurar o nome `main.typ`, a listagem da pasta `saida` mostrou os arquivos `TCC-Grupo-01-v001.pdf`, `TCC-Grupo-01-v002.pdf`, `TCC-Grupo-01-v003.pdf` e `teste.pdf`. Não havia `v004.pdf` nessa listagem, feita antes da nova compilação.
- **Recuperação:** após restaurar `main.typ`, o usuário executou `gerar-pdf.bat`, que informou sucesso e criou `TCC-Grupo-01-v004.pdf`.
- **Conclusão:** confirmado o tratamento da ausência de `main.typ`, a preservação das versões anteriores na listagem posterior e a retomada da sequência após a restauração. A criação de `v004` foi confirmada pela mensagem de sucesso do BAT; ainda não foi enviada uma listagem posterior da pasta.
- **Decisão de escopo:** o compartilhamento de rede e a concorrência entre usuários foram retirados do escopo por decisão do usuário. O Tutorial 2 será avaliado apenas no cenário local.
- **Pendências:** no teste anterior de falha de compilação por erro de sintaxe, a mensagem de erro foi confirmada, mas não houve listagem imediata da pasta de saída para comprovar diretamente a ausência de um PDF final. Os testes técnicos realizados não demonstram conformidade com o Manual de Normalização do SENAI-SP.
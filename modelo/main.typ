// Ponto de entrada do TCC.
// A ordem dos includes define a ordem das páginas do PDF.
//
// O tcc.typ desta pasta é gerado pelo gerar-pdf.bat, a partir da
// versão escolhida em ferramentas/template. Não edite o arquivo
// gerado: ele é sobrescrito a cada compilação.
//
// Os elementos opcionais já têm arquivo pronto nas pastas
// 01-pre-textuais e 03-pos-textuais. Para usar um deles, apague o "//"
// do início do #include correspondente, abaixo, mantendo a ordem do
// manual (5.2 e 5.4). Cada arquivo opcional já começa em página nova.

#import "dados.typ": dados
#import "tcc.typ": *

#show: configurar.with(dados)

// ---------- Elementos pré-textuais ----------
#include "01-pre-textuais/capa.typ"

#pagebreak()
#counter(page).update(1)

#include "01-pre-textuais/folha-de-rosto.typ"
// Opcional: errata (manual, 5.2.4), logo depois da folha de rosto.
// #include "01-pre-textuais/errata.typ"

#pagebreak()
#include "01-pre-textuais/folha-de-aprovacao.typ"
// Opcionais, nesta ordem (manual, 5.2.6 a 5.2.8):
// #include "01-pre-textuais/dedicatoria.typ"
// #include "01-pre-textuais/agradecimentos.typ"
// #include "01-pre-textuais/epigrafe.typ"

#pagebreak()
#include "01-pre-textuais/resumo.typ"
#pagebreak()
#include "01-pre-textuais/abstract.typ"
// Opcionais, nesta ordem, depois dos resumos (manual, 5.2.11 a 5.2.14):
// #include "01-pre-textuais/lista-de-ilustracoes.typ"
// #include "01-pre-textuais/lista-de-tabelas.typ"
// #include "01-pre-textuais/lista-de-abreviaturas-e-siglas.typ"
// #include "01-pre-textuais/lista-de-simbolos.typ"

#pagebreak()
#include "01-pre-textuais/sumario.typ"

// ---------- Elementos textuais ----------
#pagebreak()

#include "02-textuais/introducao.typ"
#include "02-textuais/desenvolvimento.typ"
#include "02-textuais/conclusao.typ"

// ---------- Elementos pós-textuais ----------
#include "03-pos-textuais/referencias.typ"
// Opcionais, nesta ordem (manual, 5.4.2 a 5.4.4 e NBR 6034):
// #include "03-pos-textuais/glossario.typ"
// #include "03-pos-textuais/apendice.typ"
// #include "03-pos-textuais/anexo.typ"
// #include "03-pos-textuais/indice.typ"

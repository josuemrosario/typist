// Ponto de entrada do TCC.
// A ordem dos includes define a ordem das páginas do PDF.

#import "dados.typ": dados
#import "tcc.typ": *

#show: configurar.with(dados)

// ---------- Elementos pré-textuais ----------
#include "01-pre-textuais/capa.typ"

#pagebreak()
#counter(page).update(1)

#include "01-pre-textuais/folha-de-rosto.typ"
#pagebreak()
#include "01-pre-textuais/folha-de-aprovacao.typ"
#pagebreak()
#include "01-pre-textuais/resumo.typ"
#pagebreak()
#include "01-pre-textuais/abstract.typ"
#pagebreak()
#include "01-pre-textuais/sumario.typ"

// ---------- Elementos textuais ----------
#pagebreak()

#include "02-textuais/introducao.typ"
#include "02-textuais/desenvolvimento.typ"
#include "02-textuais/conclusao.typ"

// ---------- Elementos pós-textuais ----------
#include "03-pos-textuais/referencias.typ"

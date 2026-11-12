// Documento de teste geral: usa o template experimental existente.
#import "dados.typ": dados
#import "tcc.typ": *
#show: configurar.with(dados)

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
#pagebreak()
#include "02-textuais/introducao.typ"
#include "02-textuais/desenvolvimento.typ"
#include "02-textuais/conclusao.typ"
#include "03-pos-textuais/referencias.typ"

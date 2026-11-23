#import "../tcc.typ": lista-de-ilustracoes

// LISTA DE ILUSTRAÇÕES — elemento opcional (manual, 5.2.11), depois dos
// resumos. Relaciona figuras e quadros na ordem em que aparecem no
// texto, com o número da página. A lista é gerada pelo Typst a partir
// dos elementos #figura() e #tabela(tipo: [Quadro]) do trabalho.
// Ela só faz sentido quando o grupo já inseriu figuras ou quadros.
// Para ativar, remova o "//" do #include correspondente em main.typ.
//
// O travessão entre o número e a legenda ("Figura 1 – Título") é
// inserido automaticamente pelo template (v004).

#lista-de-ilustracoes()

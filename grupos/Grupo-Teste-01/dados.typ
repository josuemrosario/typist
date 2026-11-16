// Dados de identificação do trabalho.
// O professor e os alunos editam apenas os textos entre aspas.
// Para mais de um autor, separe por vírgula, mantendo as aspas e
// colocando os nomes em ordem alfabética (manual, 5.2.1):
//   autores: ("ANA SILVA", "BRUNO SOUZA"),
//
// Unidades da capital: use o nome institucional indicado pelo manual
// (CENTRO UNIVERSITÁRIO SENAI SÃO PAULO — UniSENAI — SP / Campus).
// Demais unidades: use o nome da escola ou faculdade.

#let dados = (
  instituicao: "SERVIÇO NACIONAL DE APRENDIZAGEM INDUSTRIAL — SENAI-SP",
  unidade: "ESCOLA SENAI NOME DA UNIDADE",
  curso: "CURSO TÉCNICO EM NOME DO CURSO",
  autores: ("NOME COMPLETO DO ALUNO 1", "NOME COMPLETO DO ALUNO 2"),
  titulo: "TÍTULO DO TRABALHO",
  subtitulo: none,
  natureza: "Trabalho de Conclusão de Curso apresentado à Escola SENAI Nome da Unidade como requisito para a obtenção do título de Técnico em Nome do Curso.",
  orientador: "Prof. Nome do Orientador",
  coorientador: none,
  cidade: "SÃO PAULO",
  ano: "2026",
  data-aprovacao: "___/___/______",
  banca: (
    (nome: "Nome do examinador 1", titulo: "Titulação", instituicao: "Instituição"),
    (nome: "Nome do examinador 2", titulo: "Titulação", instituicao: "Instituição"),
    (nome: "Nome do examinador 3", titulo: "Titulação", instituicao: "Instituição"),
  ),
)

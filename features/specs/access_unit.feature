      #language: pt

      Funcionalidade: Validando nome unidade

      Esquema do Cenário: Dado que estou no site da fleury e quero validar o nome da unidade
      Dado que o usuario acessa o menu 'Unidades'
      Quando selecionar <opcoes> facilidade
      Então devera visualizar o nome da unidade <unidade> na tela de detalhes

      Exemplos:
      | opcoes                                                                       | unidade                  |
      | 'Atendimento noturno'                                                        | 'Higienópolis'           |
      | 'Bicicletário e vaga verde, Atendimento aos domingos, Unidades em shoppings' | 'Shopping Anália Franco' |









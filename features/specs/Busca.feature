# language: pt

Funcionalidade: Busca


Cenário: Busca Palavras

Dado que estou na tela principal
Quando pesquiso uma palavra
Então devo ver a seguinte mensagem: "RESULTADO DA SUA BUSCA NO BLOG:"

Cenário: Busca sem retorno

Dado que estou na tela principal
Quando pesquiso uma palavra "3rttrettte"
Então devo ver a seguinte mensagem: "Nenhum post encontrado. Tente uma busca diferente"

#language: pt

Funcionalidade: Login
    Para poder gerenciar o meu negócio
    Sendo um Assinante
    Posso acessar o sistema Invoices

    Contexto: Pagina Login
        Dado que acessei a página login

    @login
    Cenário: Administrador faz login

        Quando faço login
            | Nome  | Kato Danzo            |
            | Email | kato.danzo@qaninja.io |
            | Senha | secret                |
        Então vejo o dashboard com a mensagem "Olá," usuário

    Esquema do Cenário: Tentativa de Login

        Quando faço login
            | Email | <email> |
            | Senha | <senha> |
        Então devo ver a seguinte mensagem: <msg>

        Exemplos:
        | email                  | senha    | msg                       |
        | kato.danzo@qaninja.io  | teste123 | "Senha inválida."         |
        | kato.danzo@qaninja.net | secret   | "Usuário não cadastrado." |
        | kato.danzo$qaninja.io  | secret   | "Informe um email válido."|

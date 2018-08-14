#language: pt

Funcionalidade: Cadastro de clientes
    Sendo um assinante do Invoices
    Posso cadastrar meus clintes
    Para que eu possa manter atualizados os dados de consumidores que compram meus produtos

    # Nome *
    # Telefone *
    # Email *
    # Masculino ou feminino (opção) (Radio ou Combobox)
    # Tipo (Prime, Gold, Platinum)
    # Campos de Observações (detalhes de cliente)
    # Checkbox para informar se o cliente permite envio de promoções *

Contexto: Acesso ao cadastro de clientes
    Dado que acesso cadastro de clientes como administrador
    
@smoke @logout
Cenario: Cadastro novo de cliente

    Quando faço o cadastro do seguinte cliente:
            | Nome     | Carlo ro      |
            | Telefone | 13999869466   |
            | Email    | CRE@papito.io |
            | Sexo     | M             |
            | Tipo     | Gold          |
            | Promo    | Sim           |
    Então este cliente deve ser exibido na lista

@logout
Cenario: Não permite email duplicado

    Quando faço o cadastro do seguinte cliente:
            | Nome     | Carlo ro     |
            | Telefone | 13999869466   |
            | Email    | CRE@papito.io |
            | Sexo     | M             |
            | Tipo     | Prime         |
            | Promo    | Sim           |
    Mas esse cliente ja está cadastrado        
    Então devo ver a mensagem de alerta:
        """
        Já existe um cliente cadastrado com o email informado!
        """
        E somente 1 cliente deve estar cadastrado

        
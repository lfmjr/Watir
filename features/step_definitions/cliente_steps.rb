# ecoding: UTF-8

Dado(/^que acesso cadastro de clientes como administrador$/) do
    @login = LoginPage.new
    @customer = CustomerPage.new
    @dash = DashPage.new

    @login.load
    @login.do_login('kato.danzo@qaninja.io','secret')
    @dash.wait_for_welcome
    @customer.load
end    

Quando(/^faço o cadastro do seguinte cliente:$/) do |table|
    @data_customer = table.rows_hash
    @customer.save(@data_customer)
end

Quando(/^esse cliente já está cadastrado$/) do
    @customer.save(@data_customer)
end
  
Então(/^este cliente deve ser exibido na lista$/) do
    @customer.search(@data_customer['Email'])

    content = @customer.grid_content

    expect(content.text).to have_content @data_customer['Nome']
    expect(content.text).to have_content @data_customer['Telefone']
    expect(content.text).to have_content @data_customer['Email']
end
#encoding: utf-8

Dado(/^que acessei a página login$/) do
    @login = LoginPage.new
    @dash = DashPage.new

    @login.load
    
end

Quando(/^faço login$/) do |table|
    @user = table.rows_hash
    @login.do_login(@user['Email'], @user['Senha']) 
     
end
  
Então(/^vejo o dashboard com a mensagem "([^"]*)" usuário$/) do |hello|
   expect(@dash.welcome.text).to have_content "#{hello} #{@user['Nome']}"
   expect(@dash.nav.usermenu.text).to eql @user['Email']
end

Então(/^devo ver a seguinte mensagem: "([^"]*)"$/) do |message|
    expect(@login.errors.text).to eql message
end

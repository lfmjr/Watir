#encoding: utf-8

Dado("que estou na tela principal") do
    @browser.goto "https://ww2.soc.com.br/blog/"
end

Quando("pesquiso uma palavra") do
    @browser.text_field(class:"form-busca")
    @browser.text_field(placeholder:"Buscar").set "Saúde do Trabalho"
    @browser.button(class:"lupa-form").click
end

Quando("pesquiso uma palavra {string}") do |string|
    @browser.text_field(class:"form-busca")
    @browser.text_field(placeholder:"Buscar").set "3rttrettte"
    @browser.button(class:"lupa-form").click
end

Então("devo ver a seguinte mensagem: {string}") do |message|
    def message_exists?(message)
      @browser.wait_until {@browser.h2(class:'pagetitle search').text == message}
      expect(text.include?("RESULTADO DA SUA BUSCA NO BLOG:")).to be true
    end

    def message_exists?(message)
     @browser.wait_until {@browser.div(class:'col-md-9').text == message}
     expect(text.include?("Nenhum post encontrado. Tente uma busca diferente")).to be true
    end
end
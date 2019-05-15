#encoding: utf-8

require 'watir'
require 'rspec'
require 'selenium-webdriver'
require 'rubygems'


# o default do watir é o chrome, caso você queira iniciar com outro tipo de browser é só passar após o .new :firefox
browser = Watir::Browser.new
browser.driver.manage.window.maximize

Before do
    # estamos setando o referencia do browser para uma variavel global chamada @browser
    @browser = browser
end

# Capturar evidências da Execução

Before do |_Scenario|
  browser.screenshot.save 'Busca Palavras.png'
  embed 'screenshot.png', 'image/png'
end

After do |_Scenario|
  browser.screenshot.save 'Busca sem retorno.png'
  embed 'screenshot.png', 'image/png'
end
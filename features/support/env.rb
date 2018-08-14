require 'rspec'
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'faker'
require 'mongo'

require_relative '../pages/sections'

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = 'https://ninjainvoices.herokuapp.com'
end

Capybara.default_max_wait_time = 10

"$mongo_uri = 'mongodb://heroku_p2lc4zrq:6n6pr6boblrljg02qh097u9u5m@ds157667.mlab.com:57667/heroku_p2lc4zrq"
"Mongo::Logger.logger.level = ::Logger::FATAL"
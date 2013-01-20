ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
require 'rspec'
require './app'
require 'capybara'
require 'capybara/dsl'
disable :run

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Capybara::DSL
  config.color = true
end

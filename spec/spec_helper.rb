require 'bundler/setup'
require 'rspec'
require './app'
require 'capybara'
require 'capybara/dsl'
disable :run

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Capybara::DSL
end
RSpec.configure do |config|
#  config.before(:each) { Machinist.reset_before_test }
end
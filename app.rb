#!/usr/bin/env ruby
require 'sinatra'
require 'haml'
require 'sass'
require 'compass'

# Haml & Sass setup
configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'stylesheets'
  end

  set :haml, { :format => :html5 }
  set :sass, Compass.sass_engine_options
end

get '/' do
  haml :home
end

get '/screen.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :screen
end
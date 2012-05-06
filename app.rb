#!/usr/bin/env ruby-local-exec
require 'sinatra'
require 'haml'
require 'sass'
require 'compass'
require 'mongoid'
require 'sinatra/xsendfile'

# MongoDB connection
Mongoid.database = Mongo::Connection.new('localhost', Mongo::Connection::DEFAULT_PORT).db('lenvyx')

# lenvyx releases
RELEASES = [
  {:name => '1.0-alpha', :ubuntu => '11.04', :date => Date.civil(2012, 04, 25)}
]

# Haml & Sass setup
configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'stylesheets'
  end

  set :haml, { :format => :html5 }
  set :sass, Compass.sass_engine_options
end

# nginx X-Accel-Redirect setup
configure :production do
  Sinatra::Xsendfile.replace_send_file!
  set :xsf_header, 'X-Accel-Redirect'
end

# downloads log
class Download
  include Mongoid::Document
  include Mongoid::Timestamps
  field :release, :type => String
end

get '/' do
  haml :home
end

get '/screen.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :screen
end

get '/download' do
  if release = RELEASES.last
    # log download time for statistics
    Download.create :release => release[:name]
    file = File.join(settings.public_folder, 'releases', "lenvyx-#{release[:name]}.iso")
    send_file file, :disposition => 'attachment'
  else
    redirect '/'
  end
end
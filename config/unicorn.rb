# unicorn -c config/unicorn.rb

rails_env = ENV['RACK_ENV'] || 'production'
worker_processes 1
preload_app true
timeout 30
listen '/home/deploy/lenvyx/shared/unicorn.sock', :backlog => 2048
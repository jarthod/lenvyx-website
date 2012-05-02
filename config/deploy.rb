require 'capistrano_colors'
require 'bundler/capistrano'

set :application, "lenvyx website"

# Repository
set :scm, :git
set :repository,  "git@github.com:jarthod/lenvyx-website"

# Server
server "lambda.rootbox.fr", :app, :web, :db, :primary => true
set :user, :deploy
set :deploy_to, "/home/deploy/lenvyx"
set :use_sudo, false

# rbenv
set :default_environment, {
  'PATH' => "/home/deploy/.rbenv/shims:/home/deploy/.rbenv/bin:$PATH"
}

# bundler
set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"

# unicorn commands
namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do
    run 'sudo start softfocus'
  end

  task :stop, :roles => :app, :except => { :no_release => true } do
    run 'sudo stop softfocus'
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run 'sudo restart softfocus'
  end
end

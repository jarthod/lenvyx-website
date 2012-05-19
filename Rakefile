require 'rspec/core/rake_task'

namespace :releases do
  desc "Push releases to production server"
  task :push do
    exec("rsync -a --progress public/releases/ deploy@lenvyx.rootbox.fr:/home/deploy/lenvyx/shared/releases")
  end
  
  desc "Pull releases from production server"
  task :pull do
    exec("rsync -a --progress deploy@lenvyx.rootbox.fr:/home/deploy/lenvyx/shared/releases/ public/releases")
  end
end

RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ["-c", "-f documentation", "-r ./spec/spec_helper.rb"]
  task.pattern    = 'spec/**/*_spec.rb'
end

task :default => :spec
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
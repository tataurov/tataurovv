# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'tataurovv'
set :repo_url, 'git@github.com:tataurov/tataurovv.git'

# Default branch is :master
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :application_image, :web
set :linked_dirs, fetch(:linked_dirs, []).concat(%w{config/stage})

desc 'Prepare and run docker image with application'
task :docker_run => [
       'setup_configuration',
       'docker:app:build',
       'docker:app:migrate',
       'docker:app:assets_precompile',
       'docker:app:restart'
     ]

desc ''
task :setup_configuration do
  invoke 'set_stage_config'
  invoke 'update_docker_config'
end

desc 'Copy stage config from shared folder to release path'
task :set_stage_config do
  on roles(:app) do
    within release_path do
      command = ['cp']
      command << "#{shared_path}/config/*.*"
      command << "config/"
      execute *command
    end
  end
end

desc 'Sync Dockerfiles and Gemfiles'
task :update_docker_config do
  on roles(:app) do
    within release_path do
      %w{Gemfile Gemfile.lock}.each do |filename|
        command = ['cmp']
        command << filename
        command << "#{docker_path}/#{filename}"
        command << '--silent'
        command << '||'
        command << 'cp'
        command << filename
        command << docker_path

        execute *command
      end
    end
  end
end

namespace :deploy do
  after :publishing, 'docker_run'

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end


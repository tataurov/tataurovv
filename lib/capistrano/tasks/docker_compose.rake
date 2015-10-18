# Tasks for interaction with application running in docker-compose container
def docker_path
  shared_path.join('docker')
end

namespace :docker do
  namespace :app do
    desc 'Create database'
    task :create_db do
      on roles(fetch(:app)) do
        app_name = fetch(:application_image)
        if app_name
          within docker_path do
            options = ['run']
            options << app_name
            options << 'rake'
            options << 'db:create'
            execute 'docker-compose', options
          end
        end
      end
    end

    desc 'Complete bundle'
    task :bundle_install do
      on roles(fetch(:app)) do
        app_name = fetch(:application_image)
        if app_name
          within docker_path do
            options = ['run']
            options << app_name
            options << 'bundle'
            options << 'install'
            options << '--without'
            options << 'development'
            options << 'test'
            execute 'docker-compose', options
          end
        end
      end
    end

    desc 'Run migrations'
    task :migrate do
      on roles(fetch(:app)) do
        app_name = fetch(:application_image)
        if app_name
          within docker_path do
            options = ['run']
            options << app_name
            options << 'rake'
            options << 'db:migrate'
            execute 'docker-compose', options
          end
        end
      end
    end

    desc 'Precompile assets inside container'
    task :assets_precompile do
      on roles(fetch(:app)) do
        app_name = fetch(:application_image)
        if app_name
          within docker_path do
            options = ['run']
            options << app_name
            options << 'rake'
            options << 'assets:precompile'
            execute 'docker-compose', options
          end
        end
      end
    end

    desc 'Build image for application'
    task :build do
      on roles(fetch(:app)) do
        app_name = fetch(:application_image)
        if app_name
          within docker_path do
            options = ['build']
            options << app_name
            execute 'docker-compose', options
          end
        end
      end
    end

    desc 'Start application'
    task :start do
      on roles(fetch(:app)) do
        app_name = fetch(:application_image)
        if app_name
          within docker_path do
            options = ['up']
            options << '-d'
            execute 'docker-compose', options
          end
        end
      end
    end

    desc 'Stop application'
    task :stop do
      on roles(fetch(:app)) do
        app_name = fetch(:application_image)
        if app_name
          within docker_path do
            options = ['stop']
            execute 'docker-compose', options
          end
        end
      end
    end

    desc 'Restart application'
    task :restart do
      invoke 'docker:app:stop'
      invoke 'docker:app:start'
    end
  end
end
# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

task :require_bundler do
  require 'capistrano/bundler'
end

task :require_assets do
  require 'capistrano/rails/assets'
end

task :require_migrations do
  require 'capistrano/rails/migrations'
end

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

Rake::Task[:production].invoke
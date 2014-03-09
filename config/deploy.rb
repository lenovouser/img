# load app config
require 'yaml'
APP_CONFIG = YAML.load(File.read(File.expand_path('../app_config.yml', __FILE__)))

set :application, 'img'
set :repo_url, APP_CONFIG['capistrano']['repo_url']
set :branch, ENV['BRANCH'] || 'master'

set :user, APP_CONFIG['capistrano']['user']
set :use_sudo, APP_CONFIG['capistrano']['use_sudo']

set :deploy_to, APP_CONFIG['capistrano']['deploy_to']
set :linked_files, %w(config/database.yml config/app_config.yml)
set :linked_dirs, (fetch(:linked_dirs) || []) + %w{public/images}

set :rvm_ruby_version, 'ruby-2.1.1@img'

namespace :deploy do

 after :finishing, 'deploy:cleanup'

end

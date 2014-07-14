set :stage, :production
set :rails_env, :production

set :unicorn_rack_env, :production
set :rails_env, :production

role :app, APP_CONFIG['capistrano']['production']['roles']['app']
role :web, APP_CONFIG['capistrano']['production']['roles']['web']
role :db,  APP_CONFIG['capistrano']['production']['roles']['db']

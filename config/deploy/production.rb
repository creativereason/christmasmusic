set :rbenv_type, :user # or :system, depends on your rbenv setup
#set :rbenv_ruby, '2.1.5' #default
set :branch, proc { `git rev-parse --abbrev-ref master`.chomp }

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value
set :deploy_to, '/var/www/christmasmusic'

server '45.56.78.39', user: 'deploy', roles: %w{web app db}

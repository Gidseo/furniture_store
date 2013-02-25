# server 'balmainandbalmain.com', :app

server '54.228.217.35', :app
server '54.228.217.35', :db, :primary => true

# To SSH into vagrant as user balmainweb:
# # ssh balmainweb@localhost -p 2222 -i ~/.ssh/clients.pem 
set :user, "balmainweb"
set :user_key, "#{ENV['HOME']}/.ssh/clients.pem"
set :sudo_user, "ubuntu"
set :sudo_user_key, "#{ENV['HOME']}/.ssh/clients.pem"
set :env, "production"
set :rails_env, "production"


# Thin web server configuration
set :thin_config, "#{current_path}/config/thin/production.yml"
set :thin_pid_dir, "#{shared_path}/pids"

after 'deploy:update_code', 'deploy:compile_assets'



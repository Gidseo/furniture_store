server '33.33.33.11', :app
server '33.33.33.11', :db, :primary => true

# To SSH into vagrant as user balmainweb:
# # ssh balmainweb@localhost -p 2222 -i ~/.ssh/clients.pem 
set :user, "balmainweb"
set :user_key, "#{ENV['HOME']}/.ssh/clients.pem"
set :sudo_user, "vagrant"
set :sudo_user_key, "#{ENV['HOME']}/.vagrant.d/insecure_private_key"
set :env, "vagrant"
set :rails_env, "vagrant"


# Thin web server configuration
set :thin_config, "#{current_path}/config/thin/vagrant.yml"
set :thin_pid_dir, "#{shared_path}/pids"

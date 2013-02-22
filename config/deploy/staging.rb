server 'ec2-54-228-64-11.eu-west-1.compute.amazonaws.com', :app
server 'ec2-54-228-64-11.eu-west-1.compute.amazonaws.com', :db, :primary => true

# To SSH into vagrant as user balmainweb:
# # ssh balmainweb@localhost -p 2222 -i ~/.ssh/clients.pem 
set :user, "balmainweb"
set :user_key, "#{ENV['HOME']}/.ssh/clients.pem"
set :sudo_user, "ubuntu"
set :sudo_user_key, "#{ENV['HOME']}/.ssh/clients.pem"
set :env, "staging"
set :rails_env, "staging"


# Thin web server configuration
set :thin_config, "#{current_path}/config/thin/staging.yml"
set :thin_pid_dir, "#{shared_path}/pids"

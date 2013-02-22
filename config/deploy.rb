require "bundler/capistrano"
require 'capistrano/ext/multistage'
require 'capistrano_colors'

set :stages, %w(vagrant staging production)

set :scm, :git
# set :repository,  "http://www.emson.co.uk/balmainweb/trunk/"
set :repository,  "git@github.com:emson/furniture_store.git"
set :deploy_to, '/var/www/balmainweb/'
set :bundle_cmd, "bundle"

ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/clients.pem"]

# deploy config
set :deploy_via, :export

# saves space by only keeping last 3 when running cleanup
set :keep_releases, 3
set :normalize_asset_timestamps, false

# =============================================================================
# OVERRIDE TASKS
# =============================================================================

after "deploy:create_symlink", "deploy:symlink_shared", "thin:restart"

namespace :deploy do


  desc "Create a database"
  task :create_db, :roles => :db do
    run "cd #{current_path};bundle exec rake db:create RAILS_ENV=#{rails_env}"
  end

  desc "Create app specific symlinks e.g. database.yml"
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/config.yml #{release_path}/config/config.yml"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Tail server log"
  task :log do
    # run "tail -f #{current_path}/log/#{rails_env}.log"
    run "tail -f #{current_path}/log/#{rails_env}.log"
  end
end

# Thin start / stop / reset
namespace :thin do
  task :stop, :roles => :app do
    run "cd #{current_path} && #{bundle_cmd} exec thin stop -s 1 -C #{thin_config} -R config.ru --socket /tmp/thin.sock"
  end

  task :start, :roles => :app do
    run "cd #{current_path} && #{bundle_cmd} exec thin start -s 1 -C #{thin_config} -R config.ru --socket /tmp/thin.sock"
  end

  task :restart, :roles => :app do
    stop
    sleep 5
    start
  end

end


# Puppet provisioning scripts

before 'puppet:bootstrap', 'puppet:prerequisites', 'puppet:update_server'
before 'puppet:apply', 'puppet:dir_copy'
before 'puppet:provision', 'puppet:bootstrap', 'puppet:apply'

namespace :puppet do

  desc "Bootstrap the server with essential libraries"
  task :bootstrap do ; end

  desc "Provision the server completely, run all provisioning tasks"
  task :provision do
    puts <<MSG
===========================================================
Server provisioned! Now run:
      cap #{rails_env} deploy:cold
===========================================================
MSG
  end

  desc "Install prerequisites libraries"
  task :prerequisites do
    with_user(sudo_user, sudo_user_key) do
      sudo "apt-get install dialog" # required or you "debconf: unable to initialize frontend: Dialog" errors
      sudo "apt-get install -y curl git-core libcurl4-openssl-dev openssl libreadline-dev libssl-dev libyaml-dev \
                             zlib1g-dev build-essential python-software-properties ruby1.9.3 rubygems \
                             libmysqlclient-dev puppet libapr1-dev libaprutil1-dev bzip2 \
                             libreadline6 libreadline6-dev"
      sudo "ln -sf /usr/bin/ruby1.9.3 /etc/alternatives/ruby"
      sudo "ln -sf /usr/bin/gem1.9.3 /etc/alternatives/gem"
    end
  end

  desc "Update server libraries"
  task :update_server do
    with_user(sudo_user, sudo_user_key) do
      sudo "apt-get update -y --fix-missing"
      # sudo "apt-get upgrade -y" # this fails trying to install grub
    end
  end

  desc "Upload provision directory to server"
  task :dir_copy do
    with_user(sudo_user, sudo_user_key) do
      system "tar -C ./config -czf ./tmp/provision.tgz ./provision"
      upload("./tmp/provision.tgz", "/home/#{sudo_user}", :via => :scp, :recursive => true)
      run("rm -rf /home/#{sudo_user}/provision && tar -xzf provision.tgz && rm ./provision.tgz")
      sudo "cp -rf $HOME/provision/puppet /etc/"
    end
  end

  desc "Run puppet apply on this server for the specified environment"
  task :apply do
    with_user(sudo_user, sudo_user_key) do
      # need to set --environment my_environment otherwise
      # apache conf file will default to production
      run "sudo puppet apply /etc/puppet/manifests/site.pp --environment #{rails_env}"
    end
  end

end





# Methods to allow switching users during a deploy.
# Required by puppet scripts in apply as a root user.

def with_user(new_user, new_key, &block)
  old_user = new_user
  old_key = new_key
  set :user, new_user
  ssh_options[:keys] = [new_key]
  close_sessions
  yield
  set :user, old_user
  ssh_options[:keys] = [old_key]
  close_sessions
end

def close_sessions
  sessions.values.each { |session| session.close }
  sessions.clear
end

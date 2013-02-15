require "bundler/capistrano"
require 'capistrano/ext/multistage'
require 'capistrano_colors'

set :stages, %w(balmain_demo production)

set :scm, :git
# set :repository,  "http://www.emson.co.uk/balmainweb/trunk/"
set :repository,  "git@github.com:emson/furniture_store.git"

# deploy config
set :deploy_via, :export

# saves space by only keeping last 3 when running cleanup
set :keep_releases, 3

# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/Path/To/id_rsa)            # If you are using ssh_keys
set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false


# =============================================================================
# OVERRIDE TASKS
# =============================================================================

namespace :deploy do

  desc "Restart Passenger"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

end



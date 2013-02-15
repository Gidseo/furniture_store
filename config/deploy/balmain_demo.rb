server 'balmain.emson.co.uk', :app, :db

set :user, 'emodemo'  # Your dreamhost account's username
set :env, 'balmain_demo'
set :rails_env, 'balmain_demo'

set :domain, 'balmain.emson.co.uk'  # Dreamhost servername where your account is located (FTP host)
set :application, 'balmain.emson.co.uk'  # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/#{user}/#{application}/public"  # The standard Dreamhost setup

#set :bundle_dir, '/home/emodemo/.gems/gems/bundler-1.0.21/'

set :deploy_to, applicationdir

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true


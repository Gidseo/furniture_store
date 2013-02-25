server 'balmainandbalmain.com', :app

set :user, 'balmainuser'
set :env, 'production'
set :rails_env, 'production'

set :domain, 'balmainandbalmain.com'  # Dreamhost servername where your 
set :application, 'balmainandbalmain.com'  # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/#{user}/#{application}/www"  # The standard Dreamhost setup

# set :bundle_dir, '/home/emodemo/.gems/gems/bundler-1.0.21/'
# set :bundle_dir, '/home/balmainuser/.gems/bin/bundle'

set :deploy_to, applicationdir

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true



# TODO UPDATE THIS BASED ON STAGING



# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.ssh.max_tries = 50
  config.ssh.timeout = 300
  config.vm.customize ["modifyvm", :id, "--name", "balmainweb", "--memory", "512"]
  # config.vm.boot_mode = :gui
  # config.vm.box = "precise64_pre_puppet"
  config.vm.box = "precise64prepuppet"
  # config.vm.box = "precise64"
  config.vm.host_name = "balmainweb"
  config.vm.forward_port 22, 2222, :auto => true
  config.vm.forward_port 80, 8080
  config.vm.network :hostonly, "33.33.33.11"
  config.vm.share_folder "provision", "/tmp/provision", "./config/provision"
  #config.vm.share_folder "app", "/var/www/balmainweb/current", "."
end



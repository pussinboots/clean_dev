# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

   config.vm.define :devel do |devel_config|
	  devel_config.vm.box = "ubuntu-12.04.1-server-i686-virtual"
	  devel_config.vm.box_url = "http://dl.dropbox.com/u/4031118/Vagrant/ubuntu-12.04.1-server-i686-virtual.box"
	  devel_config.vm.host_name = "devel.fit.com"
	  devel_config.vm.network :hostonly, "192.168.1.101"
	  devel_config.vm.customize ["modifyvm", :id, "--memory", 2096]
   end
   
   config.vm.provision :puppet do |puppet|
	puppet.options = "--verbose --debug"
	puppet.manifest_file  = "site.pp"
   end
end


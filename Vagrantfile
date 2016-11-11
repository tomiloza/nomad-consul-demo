# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end
  (0..2).each do |i|
      config.vm.define "serv-0#{i}" do |d|
        d.vm.box = "debian/jessie64"
        d.vm.hostname = "serv-0#{i}"
        d.ssh.forward_agent = true
        d.vm.provision :shell, path: "bootstrap.sh"
        d.vm.network "private_network", ip: "10.100.194.20#{i}"
        d.vm.provider "virtualbox" do |v|
          v.memory = 1024
        end
      end
   end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
    config.vbguest.no_install = true
    config.vbguest.no_remote = true
  end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Define a provider configuration
  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  # Define a VM machine configuration
  config.vm.define "raddit-app" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.hostname = "raddit-app"
    # sync a local folder with application code to the VM folder
    app.vm.synced_folder "raddit-app/", "/srv/raddit-app"
    # use port forwarding make application accessible on localhost
    app.vm.network "forwarded_port", guest: 9292, host: 9292
    # system configuration is done by ansible
    app.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/configuration.yml"
    end
  end
end

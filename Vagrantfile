# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--rtcuseutc", "on"]
    if File.exist?('.vagrant_ram')
      ram = File.read('.vagrant_ram').strip.to_i
      vb.customize ["modifyvm", :id, "--memory", ram]
    else
      vb.customize ["modifyvm", :id, "--memory", 2048]
    end
    if File.exist?('.vagrant_cpus')
      cpus = File.read('.vagrant_cpus').strip.to_i
      vb.customize ["modifyvm", :id, "--cpus", cpus ]
    end
  end
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :private_network, ip: "10.30.30.50"
  config.vm.network :forwarded_port, host: 20008, guest: 20008
  config.vm.network :forwarded_port, host: 20009, guest: 20009

  config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=777", "fmode=666"]

  config.vm.provision :shell, path: 'bootstrap.sh'
end

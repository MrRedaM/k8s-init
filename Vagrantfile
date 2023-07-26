Vagrant.configure("2") do |config|
  # Master node configuration
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/focal64"
    master.vm.hostname = "master"
    master.vm.provider "virtualbox" do |vb|
      vb.memory = 4096 # 4GB RAM
      vb.gui = false
      vb.name = "master"
      #vb.customize ["modifyvm", :id, "--natnet1", "10.3/16"]
    end
    master.vm.network "private_network", ip: "192.168.56.4"#, virtualbox__intnet: "TestNet"
    master.vm.provision "shell", path: "provisions/inits/node.sh"
    master.vm.provision "shell", path: "provisions/inits/master.sh"
    master.vm.provision "shell", path: "provisions/installs/ksniff.sh"
  end

  # Worker node configuration
  config.vm.define "worker" do |worker|
    worker.vm.box = "ubuntu/focal64"
    worker.vm.hostname = "worker"
    worker.vm.provider "virtualbox" do |vb|
      vb.memory = 8192 # 8GB RAM
      vb.gui = false
      vb.name = "worker"
    end
    worker.vm.network "private_network", ip: "192.168.56.5"#, virtualbox__intnet: "TestNet"
    worker.vm.provision "shell", path: "provisions/inits/node.sh"
    worker.vm.provision "shell", path: "provisions/inits/worker.sh"
  end
end

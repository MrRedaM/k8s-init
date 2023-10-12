Vagrant.configure("2") do |config|
  # Master node configuration
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/focal64"
    master.vm.hostname = "master"
    master.vm.provider "virtualbox" do |vb|
      vb.cpus = 4
      vb.memory = 6144 # 6GB RAM
      vb.gui = false
      vb.name = "master"
      #vb.customize ["modifyvm", :id, "--natnet1", "10.3/16"]
    end
    master.vm.network "private_network", ip: "192.168.56.4"
    master.vm.provision "shell", path: "provisions/node.sh"
    master.vm.provision "shell", path: "provisions/master.sh"
  end

  # Worker node configuration
  config.vm.define "worker" do |worker|
    worker.vm.box = "ubuntu/focal64"
    worker.vm.hostname = "worker"
    worker.vm.provider "virtualbox" do |vb|
      vb.cpus = 8
      vb.memory = 10240 # 10GB RAM
      vb.gui = false
      vb.name = "worker"
    end
    worker.vm.network "private_network", ip: "192.168.56.5"
    worker.vm.provision "shell", path: "provisions/node.sh"
    worker.vm.provision "shell", path: "provisions/worker.sh"
  end
end

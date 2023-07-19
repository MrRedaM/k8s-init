Vagrant.configure("2") do |config|
  # Master node configuration
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/focal64"
    master.vm.hostname = "master"
    master.vm.provider "virtualbox" do |vb|
      vb.memory = 4096 # 4GB RAM
      vb.gui = false
    end
    master.vm.network "private_network", ip: "10.10.10.4", virtualbox__intnet: "TestNet"
    master.vm.provision "shell", path: "provision_node_init.sh"
    master.vm.provision "shell", path: "provision_master_init.sh"
  end

  # Worker node configuration
  config.vm.define "worker" do |worker|
    worker.vm.box = "ubuntu/focal64"
    worker.vm.hostname = "worker1"
    worker.vm.provider "virtualbox" do |vb|
      vb.memory = 8192 # 8GB RAM
      vb.gui = false
    end
    worker.vm.network "private_network", ip: "10.10.10.5", virtualbox__intnet: "TestNet"
    worker.vm.provision "shell", path: "provision_node_init.sh"
    worker.vm.provision "shell", path: "provision_worker_init.sh"
  end
end

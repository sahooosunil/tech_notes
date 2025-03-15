Vagrant.configure(2) do | config |
    config.vm.define "jenkinsmaster"  do |docker|
        docker.vm.network :private_network, ip: "172.20.128.2", netmask: "16"


        docker.vm.provider "docker" do |d|
          d.image = "ubuntu:24.04"
        end
      end
    %w{slavenode1 slavenode2}.each_with_index do | nodename, index |
        config.vm.define nodename  do |docker|
        docker.vm.network :private_network, ip: "172.20.128.#{index+3}", netmask: "16"

        
        docker.vm.provider "docker" do |d|
            d.image = "ubuntu:24.04"
        end
      end
    end
end
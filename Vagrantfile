# -*- mode: ruby -*-
# vi: set ft=ruby :

# lab_name is the name of the lab where all the files will be organized.
lab_group = "Formation"
lab_name = "My_Kube"

IMAGE_NAME = "bento/ubuntu-20.04"
K8S_NAME = "ditwl-k8s-01"
MASTERS_NUM = 1
MASTERS_CPU = 2 
MASTERS_MEM = 4096

NODES_NUM = 2
NODES_CPU = 2
NODES_MEM = 4096

IP_BASE = "192.168.50."

VAGRANTFILE_API_VERSION = "2"
VAGRANT_DISABLE_VBOXSYMLINKCREATE=1

####################################################################################
# MAIN
####################################################################################

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.ssh.insert_key = false

    (1..MASTERS_NUM).each do |i|      
        config.vm.define "k8s-m-#{i}" do |master|
            master.vm.box = IMAGE_NAME
            master.vm.network "private_network", ip: "#{IP_BASE}#{i + 10}"
            master.vm.hostname = "k8s-m-#{i}"
            master.vm.provider "virtualbox" do |v|
                v.name = "k8s-m-#{i}"
                v.memory = MASTERS_MEM
                v.cpus = MASTERS_CPU
                # Set Group for virtual machin
                v.customize ["modifyvm", :id, "--groups", "/#{lab_group}/#{lab_name}"]
            end            
            master.vm.provision "ansible" do |ansible|
                ansible.playbook = "roles/k8s.yml"
                #Redefine defaults
                ansible.extra_vars = {
                    k8s_cluster_name:       K8S_NAME,                    
                    k8s_master_admin_user:  "vagrant",
                    k8s_master_admin_group: "vagrant",
                    k8s_master_apiserver_advertise_address: "#{IP_BASE}#{i + 10}",
                    k8s_master_node_name: "k8s-m-#{i}",
                    k8s_node_public_ip: "#{IP_BASE}#{i + 10}"
                }                
            end
        end
    end

    (1..NODES_NUM).each do |j|
        config.vm.define "k8s-n-#{j}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "#{IP_BASE}#{j + 10 + MASTERS_NUM}"
            node.vm.hostname = "k8s-n-#{j}"
            
            node.vm.provider "virtualbox" do |v|
                v.name = "k8s-n-#{j}"
                v.memory = NODES_MEM
                v.cpus = NODES_CPU
                #v.customize ["modifyvm", :id, "--cpuexecutioncap", "20"]
                # Set Group for virtual machin
                v.customize ["modifyvm", :id, "--groups", "/#{lab_group}/#{lab_name}"]
            end             
            node.vm.provision "ansible" do |ansible|
                ansible.playbook = "roles/k8s.yml"                   
                #Redefine defaults
                ansible.extra_vars = {
                    k8s_cluster_name:     K8S_NAME,
                    k8s_node_admin_user:  "vagrant",
                    k8s_node_admin_group: "vagrant",
                    k8s_node_public_ip: "#{IP_BASE}#{j + 10 + MASTERS_NUM}"
                }
            end
        end
    end
end
#!/bin/bash

###############################################################
#  TITRE: 
#
#  AUTEUR:   Stéphane
#  VERSION: 
#  CREATION:  20:59:57 14/03/2021
#  MODIFIE: 
#
#  DESCRIPTION: 
#
#
#  REFERENCE :
#  https://www.itwonderlab.com/en/installating-kubernetes-dashboard/
###############################################################


sudo apt update && sudo apt install apt-transport-https --assume-yes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install kubectl --assume-yes

mkdir -p ~/.kube
vagrant port k8s-m-1
scp -P 2222 vagrant@127.0.0.1:/home/vagrant/.kube/config ~/.kube/config

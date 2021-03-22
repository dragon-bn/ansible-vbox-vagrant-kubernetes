#!/bin/bash

###############################################################
#  TITRE: 
#
#  AUTEUR:   Stéphane
#  VERSION: 
#  CREATION:  07:10:57 15/03/2021
#  MODIFIE: 
#
#  DESCRIPTION: 
###############################################################

kubectl get nodes --all-namespaces
kubectl -n kubernetes-dashboard describe service kubernetes-dashboard
kubectl get services
kubectl get pods
kubectl get services


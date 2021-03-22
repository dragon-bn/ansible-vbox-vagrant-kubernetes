#!/bin/bash

###############################################################
#  TITRE: 
#
#  AUTEUR:   Stéphane
#  VERSION: 
#  CREATION:  07:12:13 19/03/2021
#  MODIFIE: 
#
#  DESCRIPTION: 
###############################################################


kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

kubectl apply -f kubernetes-dashboard-service-np.yaml 




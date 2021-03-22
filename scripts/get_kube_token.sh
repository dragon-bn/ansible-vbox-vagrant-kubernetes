#!/bin/bash

###############################################################
#  TITRE: 
#
#  AUTEUR:   Stéphane
#  VERSION: 
#  CREATION:  21:43:48 14/03/2021
#  MODIFIE: 
#
#  DESCRIPTION: 
###############################################################
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')

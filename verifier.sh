#!/bin/bash

COMPTES=`cat comptes_DNB.txt`

for i in $COMPTES
    do
      echo "**** Traitement de $i ****"
      echo "**** Bureau de $i ****"
      ls -Al /home/$i/Bureau/
      echo "**** Documents de $i ****"
      ls -Al /home/$i/Docs/
      echo "**** Classe de $i ****"
      ls -Al /var/se3/Classes/Classe_3_*/$i/
done

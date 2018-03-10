#!/bin/bash

COMPTES=`cat comptes_DNB.txt`

for i in $COMPTES
    do
      echo "**** Traitement de $i ****"
      if [ -e "/home/$i/.oldDocs" ]
      then
        echo "Déplacement du contenu du dossier /home/$i/Docs provisoire dans un dossier DNB daté"
        mv /home/$i/Docs/ /home/$i/.oldDocs/DNB_$(date +%Y%m%d)/
        echo "Remise en place du dossier .oldDocs en Docs"
        mv  /home/$i/.oldDocs/ /home/$i/Docs/
      else
        echo "Pas de dossier /home/$i/.oldDocs à traiter"
      fi

      if [ -e "/home/$i/.oldClasse" ]
      then
        echo "Remise en place du contenu du partage Classe"
        mv /home/$i/.oldClasse/* /var/se3/Classes/Classe_3_*/$i/
        rmdir /home/$i/.oldClasse
      else
        echo "Pas de dossier /home/$i/.oldClasse à traiter"
      fi
done

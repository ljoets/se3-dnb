#!/bin/bash

COMPTES=`cat comptes_DNB.txt`

for i in $COMPTES
    do
      echo "**** Traitement de $i ****"
      if [ ! -e "/home/$i/.oldDocs" ]
      then
        echo "Renommage du dossier /home/$i/Docs"
        mv /home/$i/Docs/ /home/$i/.oldDocs/
        mkdir /home/$i/Docs
      else
        echo "Le dossier /home/$i/Docs a déjà été renommé et caché."
      fi

      RES=`find /home/$i/Bureau/ -not -name "*.lnk"`
      if [ ! -z "$RES" ]
        then
          echo "$i a des éléments autres que des liens sur son bureau : $RES"
      fi

      if [ ! `ls -A /var/se3/Classes/Classe_3_*/$i/ | wc -c` -eq 0 ]
        then
          echo "Dossier Classe de $i non vide"
          echo "Déplacement du contenu"
          mkdir /home/$i/.oldClasse/
          mv /var/se3/Classes/Classe_3_*/$i/* /home/$i/.oldClasse/
      fi
done

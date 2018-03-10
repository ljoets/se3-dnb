#!/bin/bash

CLASSES="Classe_3_1 Classe_3_2 Classe_3_3 Classe_3_4"

for i in $CLASSES
    do
      mv /var/se3/Classes/$i/_travail/ /var/se3/Classes/$i/._travail/
      echo "Dossier _travail de $i caché"
      mv /var/se3/Classes/$i/_echange/ /var/se3/Classes/$i/._echange/
      echo "Dossier _echange de $i caché"
done

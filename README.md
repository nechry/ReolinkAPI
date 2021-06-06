# ReolinkAPI
Reolink Script for Jeedom using building REST API

# Installation

- A l'aide du plugin script créer un équipement pour la caméra à piloter
- Cliquer sur *Ajouter une Commande script*
- Cliquer Nouveau (Icon vert)
- Nommer le nouveau script *Reolink_API_PTZ_Commands.sh*
- Coller le contenu du fichier [Reolink_API_PTZ_Commands.sh](./Reolink_API_PTZ_Commands.sh) dans la vue edition du script
- Remplacer les valeurs des variables username et passwd pour celles de votre caméra
```
username="YourReolinkCameraUsername"
password="YourReolinkCameraPassword"
```
- Sauvegarder

# Parametres des commandes
Pour chaques commandes il faudra spécifier:

- Type de script *Script*
- Type *Action*
- Requête pointe sur le script préalablement créé avec une suite d'arguments. 

# Parametres des requêtes

Arguments dans l'ordre
1. cameraIP     addresse IP de la camera
2. command      nom de la commande comme : PtzCtrl, StartZoomFocus
3. parameter    parametre de la commande, comme: Left, Right, Up, Down, LeftUp, RightUp, LeftDown, RightDown, Stop, ZoomInc, ZoomDec, ToPos
4. speed        vitesse de déplacement, valeur entre 1 et 100, 1 très lent et 100 très rapide. 
5. id           Id de position (Preset) en utilisation avec le paramètre ToPos


Exemple pour une caméra E1 Zoom avec adresse IP 192.168.0.10

Déplacer en haut en vitesse 24
```
/var/www/html/plugins/script/data/Reolink_API_PTZ_Commands.sh 192.168.0.10 PtzCtrl Up 24
```

Déplacer en bas en vitesse 24
```
/var/www/html/plugins/script/data/Reolink_API_PTZ_Commands.sh 192.168.0.10 PtzCtrl Down 24
```

Déplacer en gauche en vitesse 24
```
/var/www/html/plugins/script/data/Reolink_API_PTZ_Commands.sh 192.168.0.10 PtzCtrl Left 24
```

Déplacer en droite en vitesse 24
```
/var/www/html/plugins/script/data/Reolink_API_PTZ_Commands.sh 192.168.0.10 PtzCtrl Right 24
```

Stopper le déplacement de la caméra
```
/var/www/html/plugins/script/data/Reolink_API_PTZ_Commands.sh 192.168.0.10 PtzCtrl Stop
```

Zoom incrément
```
/var/www/html/plugins/script/data/Reolink_API_PTZ_Commands.sh 192.168.0.10 PtzCtrl ZoomInc 16
```

Zoom décrément
```
/var/www/html/plugins/script/data/Reolink_API_PTZ_Commands.sh 192.168.0.10 PtzCtrl ZoomDec 16
```

Déplacer à une position prédéfinie
```
/var/www/html/plugins/script/data/Reolink_API_PTZ_Commands.sh 192.168.0.10 PtzCtrl ToPos 16 4
```
Ici on déplace en position (Preset) no 4 


# Problèmes

- Assurer le script [Reolink_API_PTZ_Commands.sh](./Reolink_API_PTZ_Commands.sh) a les droits et apartient à www-data.
En ligne de commande ssh depuis le répertoire */var/www/html/plugins/script/data* exécuter 
```
chmod 775 Reolink_API_PTZ_Commands.sh
chown www-data:www-data Reolink_API_PTZ_Commands.sh
```
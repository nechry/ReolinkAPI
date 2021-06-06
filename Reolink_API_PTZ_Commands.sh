#!/bin/bash
## Script Reolink_API_PTZ_Commands.sh
## ./Reolink_API_PTZ_Commands.sh 'commande PTZ Reolink' 'parametre de la commande'  (respecter la casse)
## 'commande PTZ Reolink' : PtzCtrl, StartZoomFocus
## 'parametre de la commande' possible : Left, Right, Up, Down, LeftUp, RightUp, LeftDown, RightDown, Stop
## Exemple : ./Reolink_API_PTZ_Commands.sh PtzCtrl Left 24

username="YourReolinkCameraUsername"
password="YourReolinkCameraPassword"

cameraIP=$1     # addresse IP de la camera
command=$2      # commande
parameter=$3    # parametre de la commande
speed=$4        # vitesse de déplacement 
id=$5           # Id de position en utilisation ToPos

case $parameter in
  Left|Right|Up|Down|ZoomInc|ZoomDec|FocusInc|FocusDec) 
        payload="[{\"cmd\":\""${command}"\",\"action\":0,\"param\":{\"channel\":0,\"op\":\""${parameter}"\",\"speed\":${speed}}}]";;
  Stop)
        payload="[{\"cmd\":\""${command}"\",\"action\":0,\"param\":{\"channel\":0,\"op\":\""${parameter}"\"}}]";;
  ZoomPos)
        payload="[{\"cmd\":\""${command}"\",\"action\":0,\"param\":{\"ZoomFocus\":{\"channel\":0,\"op\":\""${parameter}"\",\"pos\":${speed}}}}]";;      
  ToPos)
        payload="[{\"cmd\":\""${command}"\",\"action\":0,\"param\":{\"channel\":0,\"id\":${id},\"op\":\""${parameter}"\",\"speed\":${speed}}}]";;
esac

curl -k -X POST -H "Content-Type: application/json" -d "${payload}" "http://${cameraIP}/cgi-bin/api.cgi?cmd=${command}&user=${username}&password=${password}"
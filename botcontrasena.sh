#!/bin/bash

###set -x

TOKEN="965667485:AAEfXR4fzB-DsqqLWfV3zDaH64_q9BjSHoU"
ID="828347348"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

while inotifywait -e attrib /etc/shadow; do

cat /etc/shadow > /root/bot/contrasenaTemporal
mensaje=$(diff /root/bot/contrasena /root/bot/contrasenaTemporal | tail -1 | awk -F: '{print $1}')
cat /etc/shadow > /root/bot/contrasena
curl -s -X POST $URL -d chat_id=$ID -d text="El usuario $mensaje cambio su contraseña"
done

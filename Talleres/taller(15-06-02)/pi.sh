#!/bin/bash
curl -s http://pi.karmona.com/ > PIslices20.dat #Descarga el código fuente de la página
sed -i '1d' PIslices20.dat #Elimina la primera línea
#Elimina texto referente a comandos HTML
sed -i 's/<CENTER><B>Pi\ -\ 10 Million\ Digits<\/B><BR><BR><BR>//g' PIslices20.dat
sed -i 's/<B>//g' PIslices20.dat
sed -i 's/<\/B>//g' PIslices20.dat
sed -i 's/<\/center><\/BODY><\/HTML>//g' PIslices20.dat
sed -i 's/<BR>//g' PIslices20.dat
#Inserta una línea nueva cada 20 caracteres (ignorando los puntos)
sed -E -i "s/.[^.]{20}/&\n/g" PIslices20.dat

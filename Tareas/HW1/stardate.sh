#!/bin/bash
#Descarga hyg, elimina las primeras 32 líneas y guarda solo las columnas de interés
curl https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionales/master/homework/2015-V/HW1/hyg.csv | awk -F"," '{print $10","$8","$9","$2}' | sed '1,32d' > hyg.csv

#Busca la información del año ingresado y la guarda en una variable local
info=$(curl -s https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionales/master/homework/2015-V/HW1/worldhistory.tsv | grep $1 | sed "s/$1	//g")

#Define los años para encontrar las distancias de las estrellas
anho1=$((2015-$1))
anho2=$((2016-$1))

#Da formato al output
echo '############################################'
figlet StarDate
echo '############################################'
#Imprime el año y la información
figlet $1
echo $info
echo '############################################
LOOK AT THE FOLLOWING STARS:
RA/°	DEC/°	HIP No.'
#Compara que la columna 1 (donde están las distancias) esté entre el rango de distancias, luego imprime la info utilizando substr para recortar los caracteres a mostrar y por último utiliza head para mostrar máximo 5 resultados
awk -F"," '{if ($1 >= '$anho1' && $1 <= '$anho2') {print substr($2,1,4)"\t"substr($3,1,5)"\t"$4}}' hyg.csv | head -5

#Elimina archivos auxiliares creados
rm hyg.csv

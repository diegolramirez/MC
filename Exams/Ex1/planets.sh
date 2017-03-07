#!/bin/bash
#Elimina coma
sed -i 's/,//g' planets.txt
#Elimina asterisco
sed -i 's/\*//g' planets.txt
#Elimina líneas con la palabra Unknown
sed -i '/Unknown/d' planets.txt
#Elimina \t después de paréntesis
sed -E -i 's/\)\t/\),/g' planets.txt
#Agrega , después de dígito \t
sed -E -i 's/[0-9]\t/&,/g' planets.txt
#Agrega , después de minúscula \t
sed -E -i 's/[a-z]\t/&,/g' planets.txt
#Cambia \t, por ,
sed -E -i 's/\t,/,/g' planets.txt
#ala
sed -E -i 's/^\s+/,/g' planets.txt
#vgd
sed -E -i 's/[A-Z]\s+/&,/g' planets.txt


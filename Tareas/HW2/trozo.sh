#!/bin/bash
#Declaración
#var1=$(($1-1))
#var2=$(($2))
#var3=$(($var2-$var1))
#Se realizan los cambios
#sed "s/^.\{"$var1"\}/&\nESTO\n/g" *.txt > file.txt
#sed '1,2d' file.txt > file1.txt
#sed "s/^.\{"$var3"\}/&\nESTO\n/g" file1.txt > file2.txt
#head -1 file2.txt > elif.txt
#rm file.txt
#rm file1.txt
#rm file2.txt
#El código anterior no corria con archivos demasiado grandes, donde en una linea hubieran mas de 32707, así que emplee el comando cut
cut -c"$1"-"$2" $3

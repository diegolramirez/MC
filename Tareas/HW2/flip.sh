#!/bin/bash
#Se realizan los cambios en las letras
sed -e "s/$2/=/g" $3 > file.txt
sed -e "s/$1/0/g" file.txt > file1.txt
sed -e "s/=/$1/g" file1.txt > file2.txt
sed -e "s/0/$2/g" file2.txt > elif.txt
#Se remueven los archivos
rm file.txt
rm file1.txt
rm file2.txt


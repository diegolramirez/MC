#!/bin/bash
echo "escriba un numero del 1 al 1000: "
read a
awk -v vara=$a -F "," '{if($1==vara) print $1}' taller.csv

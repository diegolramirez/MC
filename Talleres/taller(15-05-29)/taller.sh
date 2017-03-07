#!/bin/bash
touch taller.csv
for i in {1..1000}
do 
	(( a = i * i ))
	echo $i,$a >> taller.csv
done

awk -F "," '{print $1","$2","$1+$2}' taller.csv > tallerawk.csv

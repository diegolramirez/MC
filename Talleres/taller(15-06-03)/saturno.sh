#!/bin/bash
#Download file
w3m http://nssdc.gsfc.nasa.gov/planetary/factsheet/saturniansatfact.html > saturno.txt
#Remove all lines before(including) Orbital parameters
sed -i '1,/Orbital\ parameters/d' saturno.txt
#Remove lines including titles
sed -i '1,/Major\ Satellites/d' saturno.txt
sed -i '/Lesser\ Satellites/d' saturno.txt
sed -i '/Recently\ Discovered/d' saturno.txt
#Remove all lines after(including) indicates retrograde
sed -i '/indicates\ retrograde\ motion/,$d' saturno.txt
#Remoce blank lines
sed -i '/^ *$/d' saturno.txt
#Remove spaces before satelite's names
sed -i 's/^ *//g' saturno.txt
#Remove commas
sed -i 's/,//g' saturno.txt
#Remove dots followed by empty space
sed -i 's/\.\ //g' saturno.txt
#Manually add commas to bypass rotation period missing information and make it standart csv
#sed -i 's/.\{31\}/&,/' saturno.txt
sed -i 's/.\{41\}/&,/' saturno.txt
sed -i 's/.\{58\}/&,/' saturno.txt
sed -i 's/.\{72\}/&,/' saturno.txt
sed -i 's/.\{80\}/&,/' saturno.txt
sed -i 's/.\{99\}/&,/' saturno.txt
#Manually add commas to satelites missing information
sed -i '/^Methone/ s/$/,,,/' saturno.txt
sed -i '/^Pallene/ s/$/,,,/' saturno.txt
sed -i '/^Polydeuces/ s/$/,,,/' saturno.txt
#Remove parenthesis in satelite's names
sed -i 's/(.*)//g' saturno.txt
#Remove spaces from all but first column
awk -F"," -v OFS="," '{for (i=2;i<=NF;i++) gsub (/^ */,"",$i);print}' saturno.txt > saturno2.txt
#Remove spaces in first column
sed -i 's/\ \+[0-9]/,/g' saturno2.txt
#Complete csf file, remove last spaces
awk -F"," -v OFS="," '{for (i=2;i<=NF;i++) gsub (/^ */,"",$i);print}' saturno2.txt > saturno.csv
#Remove auxiliar files
rm saturno.txt saturno2.txt

gnuplot
set term x11
set datafile separator ","
set xlabel "Eje mayor al cubo"
set ylabel "Periodo orbital al cuadrado"
func1(x) = x**3
func2(x) = x**2
plot "saturno.csv" using (func1($2)):(func2($4))

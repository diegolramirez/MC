#Taller 2
*Métodos Computacionales - Laboratorio*

03-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller2/. No olvide al final hacer un *commit* y un *push*.

## Lotería

1. Escriba  un script de `bash` llamado `loteria.sh` que determine si su taller es afortunado y va a ser revisado. La información necesaria siempre va a estar en el momento adecuado en el archivo [lottery](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv). Además de imprimir si el taller va a ser o no revisado también se debe imprimir la primera línea del archivo `csv` que tiene la fecha. Guárdelo en la carpeta de ejecutables de su computador.

#####Solución:
```
#!/bin/bash
curl -s https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv | head -1

echo "El taller de Diego Ramírez" $(curl -s https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv| grep 201214691, | sed 's/201214691,//g')
```

## Expresiones Regulares

1. Descargue el [archivo](http://www.minhacienda.gov.co/portal/page/portal/HomeMinhacienda/presupuestogeneraldelanacion/ProyectoPGN/2015/Presentacion%20Proyecto%202015.pdf) del Ministerio de Hacienda con información sobre el Presupuesto General de la Nación 2015. Abra el archivo, diríjase a la página 10, haga *copy-paste* los datos de la tabla comenzando en *EDUCACIÓN* y terminando en *100,0*, guárdelos en un archivo llamado `pgn.dat`. Escriba comandos de `sed` que lleven a cabo las siguientes tareas de búsqueda y reemplazo y aplíquelos secuencialmente sobre el archivo `pgn.dat`: 

* eliminar todos los puntos,
```
sed -i 's/\.//g' pgn.dat
```
* cambiar por puntos todas las comas que estén seguidas de algún dígito,
```
sed -i 's/\,[0-9]/\.&/g' pgn.dat
sed -i 's/\.\,/\./g' pgn.dat
```
* cambiar por `tab` todos los espacios en blanco que estén seguidos de algún dígito o por (,
```
sed -i 's/\ [0-9]/\t&/g' pgn.dat
sed -i 's/\t\ /\t/g' pgn.dat

sed -E -i 's/\ \(/\t&/g' pgn.dat
sed -E -i 's/\t\ \(/\t/g' pgn.dat
```
* eliminar todos los paréntesis derechos,
```
sed -E -i 's/\)//g' pgn.dat
```
* y por último cambiar todos los paréntesis izquierdos por -. El resultado final debe quedar guardado en el archivo `pgn.tsv`.
```
sed -E -i 's/\(/-/g' pgn.dat > pgn.tsv
```
* Finalmente usar `sort --field-separator=$'\t' ...`  y `head` para organizar el archivo de acuerdo al cambio porcentual y encontrar el sector con el menor cambio porcentual.
```
echo 'El sector con menor cambio porcentual fue: '$(sort --field-separator=$'\t' --key=4 -n pgn.tsv | awk -F"\t" '{print $1}' |head -1)
```

## gnuplot

1. Haga con [Saturno](http://nssdc.gsfc.nasa.gov/planetary/factsheet/saturniansatfact.html) lo mismo que hicimos con Júpiter: limpiar el archivo llevándolo a formato `csv` y hacer una gráfica con `gnuplot` que evalúe la tercera ley de Kepler. Hay que tener especial cuidado con la columna para el periodo de rotación.
```
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
```
Parte de **gnuplot**
```
gnuplot
set term x11
set datafile separator ","
set xlabel "Eje mayor al cubo"
set ylabel "Periodo orbital al cuadrado"
func1(x) = x**3
func2(x) = x**2
plot "saturno.csv" using (func1($2)):(func2($4))
```

**Al terminar la clase ejecute `lottery.sh` para saber si su taller va a ser revisado.**
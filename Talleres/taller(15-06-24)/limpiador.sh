#!/bin/bash
#Descargo el archivo
wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller6/running_dirty_nov.gpx

#Elimina las líneas que contienen el patrón </trkpt>
sed -i '/<\/trkpt>/d' running_dirty_nov.gpx

#Elimina todas las líneas de la primera hasta la que contiene el patrón <trkseg>
sed -i '1,/<trkseg>/d' running_dirty_nov.gpx

#Elimina todas las líneas de la que tiene el patrón </trkseg> a la última línea
sed -i '/<\/trkseg>/,$d' running_dirty_nov.gpx

#
sed -i 's/^[ \t]*<trkpt\ lon=\"//g' running_dirty_nov.gpx

#
sed -i 's/\" lat=\"/,/g' running_dirty_nov.gpx

#
cat running_dirty_nov.gpx | perl -pe 's/\">\n/ /g' > correr.txt

#
sed -i 's/^ *//' correr.txt

#
cat correr.txt | perl -pe 's/<\/ele>\n/ /g' > running_dirty_nov.gpx

#
echo -e "lon,lat,elev,hour,min,sec\n$(cat running_dirty_nov.gpx)" > correr.txt

#
sed -r -i 's/\s+//g' correr.txt

#
sed -i 's/<ele>/,/g' correr.txt

#
sed -i 's/<time>2015-04-18T/,/g' correr.txt

#
sed -i 's/\.000Z<\/time>//g' correr.txt

#
sed 's/:/,/g' correr.txt > datoscorrer.csv

#
rm correr.txt running_dirty_nov.gpx

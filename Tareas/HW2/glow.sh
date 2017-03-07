#!/bin/bash
#Para que se vea la impresión del circulo cambiando de radio, se crea un ciclo con un while en bash, entonces le damos la instruccion que empiece en t= 0.
t=0
while true
do
#Cada cuanto quiero que varie el tiempo
t=$(echo "$t + 0.1" | bc -l)
#Se dispone la función dada en la guía, tambien se le dan los intervalos de tiempo en los que se quiere que varie el radio del circulo.
r=$(echo "(c($t))^2" | bc -l)
#Se emplea el script del punto anterior para evitar crear el circulo y borrar el marco y todo eso.
bash circle.sh $r
#El comando sleep que recomiendan en la guía permite poner el tiempo entre cada iteración del ciclo.
sleep 0.1
#Se limpia el circulo para que se de la ilusión de que crece y no se creen varios circulso uno debajo del otro con diferente radio.
clear	
done 

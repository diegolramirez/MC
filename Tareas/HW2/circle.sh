#!/bin/bash
#Para acceder a GNUPlot en bash se usa la función EOF, cómo se vio en el laboratorio.
gnuplot<<EOF
#Primero quiero que lo gráfique en la terminal:
set term dumb
#Coordenadas parametricas
set parametric
#Cómo qued achatado en el eje y, entonces debe corregirse ese error
set size ratio 0.5
#Toca quitar la leyenda, donde dice la función que se ingresó
set key off
#Luego se estipula la otra condición, la cual dice que el circulo debe ser contenido por un cuadrado de L=2, entonces:
set xrange[-1:1]
set yrange[-1:1]
#Se centra en el origen
set origin 0,0
#Se le quita el marco
unset border
#Se le quita el numerado de los ejes
unset xtics
unset ytics
#En la guia de la tarea se establece que el radio del circulo debe entrar por parametro, así que:
plot $1*sin(t), $1*cos(t)
EOF

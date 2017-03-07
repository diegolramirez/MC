#!/bin/bash
gnuplot<<EOF
set term dumb
set datafile separator ","
set xrange [10:10000]
set yrange [10:1000]
set logscale xy
set key off
set title 'Temperaturas de los planetas del sistema solar'
set ylabel 'T/K' offset 0,3
set xlabel 'D/Gm'
plot "solartemps.csv" using 2:3
EOF

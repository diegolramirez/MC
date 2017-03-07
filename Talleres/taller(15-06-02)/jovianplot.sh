#!/bin/bash
gnuplot<<EOF
set term dumb
set datafile separator ","
set xrange [1:350]
set yrange [0:780]
plot "joviansatellites.csv" using 2:3 with linesp
EOF

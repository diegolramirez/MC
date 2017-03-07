#!/bin/bash
sed -i 's/\.//g' pgn.dat

sed -i 's/\,[0-9]/\.&/g' pgn.dat
sed -i 's/\.\,/\./g' pgn.dat

sed -i 's/\ [0-9]/\t&/g' pgn.dat
sed -i 's/\t\ /\t/g' pgn.dat

sed -E -i 's/\ \(/\t&/g' pgn.dat
sed -E -i 's/\t\ /\t/g' pgn.dat

sed -E -i 's/\)//g' pgn.dat

sed -E 's/\(/-/g' pgn.dat > pgn.tsv

echo 'El sector con menor cambio porcentual fue: '$(sort --field-separator=$'\t' --key=4 -n pgn.tsv | awk -F"\t" '{print $1}' |head -1)

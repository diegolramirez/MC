#!/bin/bash
curl -s https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv | head -1

echo "El taller de Diego Ramírez" $(curl -s https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv| grep 201214691, | sed 's/201214691,//g')

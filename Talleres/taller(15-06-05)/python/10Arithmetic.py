#!/usr/bin/python2
# -*- coding: utf-8 -*-
from numpy import log10
#Punto A
a = int(raw_input('Escriba el primer número: '))
b = int(raw_input('Escriba el segundo número: '))
print "La suma de los números a y b: "+str(a+b)

#Punto B
print "La resta de los números a y b: "+str(b-a)

#Punto C
print "La multiplicación de los números b y a: "+str(a*b)

#Punto D
print "El cociente de los números a y b: "+str(a/b)

#Putno E
print "El residuo de los números a y b: "+str(a%b)

#Punto F
print "El logaritmo en base 10 de a: "+str(log10(a))

#Punto G
print "a elevado a la b: "+str(a**b)

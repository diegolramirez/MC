#!/usr/bin/python2
# -*- coding: utf-8 -*-
def root(a,b,c):
	numDiscr = (b**2 - 4*a*c)
	if(numDiscr < 1):
		raices=0
	elif (numDiscr == 0):
		raices=1
	elif (numDiscr > 1):
		raices=2
	

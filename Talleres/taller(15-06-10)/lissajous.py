#!/usr/bin/python2
import matplotlib.pyplot as plt
import numpy as np

a = np.linspace(1,25,25)
b = np.linspace(2,26,25)
t = np.linspace(0,2*np.pi,200)

plt.figure(figsize=(8, 8))
plt.subplots_adjust(hspace=0.00, wspace=0.00)
for i in range(0,25):
	x = (np.sin(a[i]*t) + (np.pi/2))
	y = np.sin(b[i]*t)
	plt.subplot(5,5,i+1)
	plt.plot(x,y)
	plt.axis("off")
plt.savefig("lissajous.png", format='png',bbox_inches='tight',transparent=False)

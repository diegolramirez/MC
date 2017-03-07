#(27-05-15) Primera Clase
¡Hola mundo!, aquí estoy comenzando el curso de **Métodos Computacionales**.

Herramientas del curso:
+ git,
+ GitHub,
+ bash,
+ C,
+ Python,

y los métodos a estudiar son:
1. interpolación
2. análisis de Fourier,
3. diferenciación e integración numérica,
4. ecuaciones diferenciales ordinarias,
5. ecuaciones diferenciales parciales,
6. y métodos de Monte Carlo

---
#(28-05-15) Primera Lectura
Resumen realizado de las lecturas **Pro Git** pgs 27-34 y **Pro Bash Programming** pgs 1-28.

---
#(29-05-15) Segunda Clase
Completamos introducción a Git. Taller realizado en el laboratorio.
Cómo hacer una tabla en Markdown:

|Hola|Escribo|Cosas|En
|---|---|-----|---|
|La|Tabla|  |  |
|  |   |  |  |
|  |   |  |  |

 Nota: algunos comandos de html sirven en markdown: <u>subrayado en html</u> - markdown propiamente no tiene un comando para subrayar. Pero esto no sirve en todos los visualizadores de markdown.

[Markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

---
#(02-06-15) Tercera Clase
###Expresiones regulares.
- *^* Representa el inicio de una línea.
- *$* Representa el final de una línea.
- *.* Representa cualquier caracter.
- *\n* Representa un 'enter' o paso a nueva línea.
- *[0-10], [a-z]* Al encerrar en paréntesis cuadrados hago referencia a un intervalo. Agregar *^* vuelve el rango exclusivo: *[^0-3]* busca los dígitos que no sean 0,1,2,3.

#####Ejemplo:
Busco la info de los parámetros orbitales de los satélites de Júpiter de [esta](http://nssdc.gsfc.nasa.gov/planetary/factsheet/joviansatfact.html) página. El objetivo es cambiar el archivo al formato .csv.

Para cambiar todo lo que se encuentre dentro de paréntesis se utiliza la expresión regular: ```\(.*\)```.

Para borrar los espacios al principio de cada línea (antes de los nombres de los satélites se utiliza la expresión regular: ```^ *```.

Para cambiar los espacios por comas, delimitador de archivos .csv, se utiliza la expresión regular: ``` *``` (hay un espacio antes del asterisco).

Para eliminar los cambios de línea (enters) se utiliza la expresión regular: ```\n\n```.

Ahora manualmente eliminamos los subtítulos que posee el archivo.

Borramos comas indeseadas al final de cada línea.

####Hands-On2 log
1. Construya una expresión regular que represente cuatro caracteres al inicio de una línea junto con un espacio a continuación.
```
^.{4}\ 
```
3. Descargue con `curl` el código fuente de la página [Pi - 10 Million Digits](http://pi.karmona.com), límpielo de todo caracter diferente a los dígitos de pi y divídalo en líneas con 20 dígitos cada una quedando ellas en un archivo con nombre `PIslices20.dat`.
```
#!/bin/bash
curl -s http://pi.karmona.com/ > PIslices20.dat #Descarga el código fuente de la página
sed -i '1d' PIslices20.dat #Elimina la primera línea
#Elimina texto referente a comandos HTML
sed -i 's/<CENTER><B>Pi\ -\ 10 Million\ Digits<\/B><BR><BR><BR>//g' PIslices20.dat
sed -i 's/<B>//g' PIslices20.dat
sed -i 's/<\/B>//g' PIslices20.dat
sed -i 's/<\/center><\/BODY><\/HTML>//g' PIslices20.dat
sed -i 's/<BR>//g' PIslices20.dat
#Inserta una línea nueva cada 20 caracteres (ignorando los puntos)
sed -E -i "s/.[^.]{20}/&\n/g" PIslices20.dat
```

###GNUPlot.
Es una herramienta para realizar gráficas.
Para que las gráficas realizadas se muestren desde la terminal se escribe ```set term dumb```.

Para que las gráficas realizadas se muestren en una ventana *pop-out* es con el comando ```aqua``` (falta por investigar esto bien para Ubuntu.

Para tomar los datos a graficar de un archivo externse se debe primero ir a la carpeta donde se encuentre el archivo y luego escribir ```set datafile separator ","```.

```
plot "joviansatellites.csv" using 2:3 with lines
```

Es posible definir funciones:
```
quad (x) = x**2
cube (x) = x**3
```

Para aplicar una función a <u>todos</u> los datos de una columna en vez de poner la la variable se pone $

####Hands-On2 log
1. Escriba un script de `bash` que reciba tres argumentos, el nombre de un archivo csv, el número de la columna para el eje horizontal y el número de la columna para el eje verticual y que haga con `gnuplot` una gráfica de dispersión con puntos visibles y unidos por líneas rectas. Haga pruebas con el archivo [joviansatellites.csv](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionales/master/examples/joviansatellites.csv)]
```
#!/bin/bash
gnuplot<<EOF
set term dumb
set datafile separator ","
set xrange [1:350]
set yrange [0:780]
plot "joviansatellites.csv" using 2:3 with linesp
EOF
```

---
#(03-06-15) Cuarta Clase
`pqcopy` Copia en el portapapeles (al menos en Mac) - averiguar para ubuntu.

[Cómo hacer un fit en gnuplot](http://gnuplot.sourceforge.net/docs_4.2/node82.html)

Herramienta útil para copiar código html de páginas web -> w3m. `sudo apt-get install w3m`

---
#(05-06-15) Quinta Clase
```
touch esfericos.c
set view equal xyz #para que las gráficas de gnuplot en 3D se vean simétricas
```

Para cambiar la contraseña en compufísica (y linux en general) introducir el comando `passwd` en la consola.

####Hands-On3 log
1. Aprenda algo sobre [make](re-carpentry.org/v4/make/), y haga un resumen básico de su funcionalidad.

Make es una herramienta que ayuda a organizar dependencias de archivos cuando se quieren crear ejecutables. A veces el volumen de archivos a manejar es excesivamente grande y resulta ser una tarea muy largo y engorrosa realizar la compilación y creación de los ejectubales a mano. Para esto la herramienta **make** permite la creación de este tipo de archivos siguiendo algunos parámetros especificados por el usuario.

---
#(09-06-15) Sexta Clase
Durante la clase se hizo una introducción a matplotlib de python. Esta es una librería para realizar gráficas en python. Si se utiliza el notebook basta con utilizar el comando `%pylab inline` debido a que matplotlib está contenida en el paquete de pylab.

Por otro lado se puede invocar solo la parte pyplot que es la más representativa para realizar gráficas, el comando genérico para esto es `import matplotlib.pyplot as plt`.

**Nota** para utilizar paquetes de python es importante manejarlos de manera adecuada. Debido a que `apt-get` se queda corto en cuanto al manejo de las dependencias se recomienda utilizar `pip`. Entonces por ejemplo para instalar las librerías necesarias para el curso en python 2 y 3 se debe ejecutar el siguiente código en la terminal:

```
#!/bin/bash
#python2
#Install python 2
sudo apt-get install python
#Install python 2 special libraries
sudo apt-get install ipython ipython-notebook python-dev python-pip python-numpy python-scipy python-matplotlib python-pandas python-sympy python-nose
#Manage packages with pip
sudo apt-get install python-setuptools
sudo easy_install pip
sudo -H pip install --upgrade pip
sudo -H pip install --upgrade virtualenv
sudo -H pip install pylab --upgrade
sudo -H pipinstall ipython[notebook]
sudo ipython kernelspec install-self

#python3
sudo apt-get install python3
#Install python 2 special libraries
sudo apt-get install ipython3 ipython3-notebook python3-dev python3-pip python3-numpy python3-scipy python3-matplotlib python3-pandas python3-sympy python3-nose
#Manage packages with pip
sudo apt-get install python3-setuptools
sudo easy_install3 pip
sudo -H pip install --upgrade pip
sudo -H pip install --upgrade virtualenv
sudo -H pip install pylab --upgrade
sudo -H pipinstall ipython[notebook]
sudo ipython3 kernelspec install-self
```

####Hands-On4 log
1. Dedique 10 minutos a pensar en proyectos que le gustaría desarrollar con lo que hemos visto en las primeras dos semanas del curso.

Todavía no estoy seguro de las instrucciones específicas del proyecto final pero basado en lo que hemos visto me interesaría hacer un script de bash que instale y configure todos los paquetes necesarios para los cursos herramientas computacionales y métodos computacionales en la distribución Ubuntu de Linux. 

Esto sería una herramienta útil que le serviría a las personas que en un futuro tomen el curso. Los paquetes a instalar contendrían, pero no estarían limitados a:
+ LaTeX y mi editor favorito de este TeXMaker
+ Markdown y mi editor favorito de este Remarkable
+ Python2 y Python3 con todas sus librerías correspondientes, utilizando `apt-get` y  `pip`. Esto contendría también el notebook en su última versión *Jupyter*.
+ Los lenguajes c y java (con sus respectivos compiladores) y su editor más popular *Eclipse*.
+ Git, junto a una breve explicación de su configuración.
+ W3m
+ Figlet
+ Curl
+ GnuPlot

---
#(10-06-15) Séptima Clase
Una de las herramientas más poderosas para cálculos matemáticos en python es la librería *numpy*, esta suele ser importada de la siguiente manera: `import numpy as np`.

**Nota** dado que para ejecutar un script toca entregar el path del motor de ejecución esta es la correcta forma de hacerlo:
```
#Para Bash
#!/bin/bash

#Para python2
#!/usr/bin/python2

#Para python3
#!/usr/bin/python3
```

####Hands-On5 log
3. Haga un panel de 5X5 con diferentes [curvas de Lissajous](http://en.wikipedia.org/wiki/Lissajous_curve).

Código que genera las curvas:
```
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
```
Y por último podemos ver las gráficas a continuación:
![](https://raw.githubusercontent.com/diegolramirez/MC/master/Talleres/taller(15-06-10)/lissajous.png)

---
#(12-06-15) Octava Clase
####Hands-On6 log
## Error e incertidumbre en cálculos numéricos
Al utilizar computadores para resolver problemas matemáticos inevitablemente nos encontraremos con errores que provocan incertidumbre en los resultados. Estos provienen de errores humanos o de limitaciones de hardware/software de la máquina utilizada. Los cuatro principales tipos de errores con los que nos podemos topar son los siguientes:

+ **Blunders or bad theory:** Se dan cuando se leen/introducen mal los datos al programa, o en su defecto existe algún error en las fórmulas o en la teoría que sustenta la matemática.

+ **Random errors:** Se producen por eventos inesperados en el hardware, como que se desconecte algo o que se dañe algún transistor. Son los menos usuales.

+ **Approximation errors:** Son errores cuando se trata de acomodar conceptos matemáticos a la realidad de la computación, como aproximar series infinitas a números finitos, utilizar límites etc. Su uso excesvio podría derivar en un alto grado de incertidumbre en el resultado final.

+ **Round-off errors:** Esto se refiere a la limitación en la cantidad de cifras decimales que puede almacenar un computador. Cuando se llega al límite entonces se redondean los valores para no superar la cantidad de memoria dispobible y llegar a un overflow. Esto termina produciendo errores en los resultados ya que reduce la información inicial.



1. Inicie un cuaderno de IPython con apuntes del libro de [Landau](http://www.compadre.org/psrc/items/detail.cfm?ID=11578) llamado `/MC/Notes/LandauNotes.ipynb`, lea el segundo capítulo del libro, intente reproducir algunos de los resultados y resuelva algunos ejercicios.
2. En su bitácora escriba al menos dos párrafos de resumen de lo aprendido sobre error e incertidumbre.

---
#(16-06-15) Novena Clase
###Interpolación (en python)
**Nota** convenciones para importación de paquetes:
```
import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
```
####Hands-On7 log
3. La tabla mostrada abajo tiene información sobre el campo magnético de un dipolo magnético a lo largo de su eje, haga un ajuste por mínimos cuadrados de acuerdo a un modelo teórico adecuado y calcule la magnitud del [momento magnético](https://en.wikipedia.org/wiki/Magnetic_dipole)  del imán (en A m^2) y una tabla para B(x) con 100 renglones uniformemente espaciada entre el x=2.3cm y x=4.3cm. Haga una gráfica con los datos y el ajuste encontrado. **log**


	| x/cm        | B/uT           |
	| ------------- |:-------------:|
	|2.3|34745|
	|2.8|19689|
	|3.2|12594|
	|3.7|7982|
	|4.3|5822|

La solución a esto se puede encontrar detalladamente en [este](https://github.com/diegolramirez/MC/blob/master/Talleres/taller(15-06-16)/Hands-On7.ipynb) cuaderno de ipython.

Primero paso la información de la tabla a arrays de numpy:
```
xr = np.array([2.3,2.8,3.2,3.7,4.3])
B = np.array([34745,19689,12594,7982,5822])
```

Luego defino la función por la cuál se hará la regresión y hago la regresión.
####Ecuación de campo magnético. 
$|B|=\frac{\mu_{0}}{4\pi} \left( \frac{3r(m\cdot r)}{r^5} - \frac{m}{r^3} \right) \approx \frac{\mu_{0}}{2\pi} \left( \frac{m}{r^3} \right)$
Donde *m* se refiere al momento magnético dipolar, el cual queremos hallar utilizando el ajuste por mínimo cuadrados.
```
def magnetico(r,m):
    return (m/r**3)

fitpars,covmat = curve_fit(magnetico,xr,B)
```

Ahora utilizando el fit obtenido a partir de la regresión expando los datos a 100 utilizando `np.linspace` y luego los agrupo en una tabla.
```
xr100 = np.linspace(2.3,4.3,100)
B100 = magnetico(xr100,fitpars)

print "|     x/cm     |     B/uT     |\n|--------------|--------------|"
for i in range (len(B100)):
    print "|   %f   | %f |"%(xr100[i],B100[i])
```

Por último hago una gráfica que contiene tanto la regresión como los datos originales para compararlos.
```
plt.plot(xr100,B100,color='blue', label='fit')
plt.scatter(xr,B,color='red', label='real')
plt.legend()
plt.xlabel("x(cm)")
plt.ylabel(r"B($\mu$T)")
plt.title("Campo magnetico respecto a la distancia del dipolo")
plt.savefig("campoB.png")
plt.show()
```

La imagen es esta: ![](https://raw.githubusercontent.com/diegolramirez/MC/master/Talleres/taller(15-06-16)/campoB.png)

Momento magnetico = 674274.228895 A m^2

4. Dedique diez minutos a pensar en ideas para su proyecto final.

Teniendo en cuenta que mi primera proposición para el proyecto final no es válida me toca repensar todo desde cero.

---
#(17-06-15) Décima Clase
Para importar un archivo que está en internet a python:
```
import numpy as np
import os

Archivo = np.genfromtxt(os.path.expanduser("LinkVaAqui"))
```
---
#(19-06-15) Décima Primera Clase

---
#(23-06-15) Décima Segunda Clase

####Hands-On10 log
1. Estime la duración del [ciclo solar](https://en.wikipedia.org/wiki/Solar_cycle) analizando con una DFT los datos [monthrg.dat](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesDatos/master/hands_on/solar/monthrg.dat). La descripción del archivo está [aquí](https://github.com/ComputoCienciasUniandes/MetodosComputacionalesDatos/blob/master/hands_on/solar/README). Además utilice un filtro de altas frecuencias para obtener una gráfica similar a la mostrada abajo.

La respuesta a este prolema se puede encontrar en el siguiente [cuaderno](https://github.com/diegolramirez/MC/blob/master/Talleres/taller(15-06-23)/SolSol.ipynb)

La gráfica del filtrado quedó de la siguiente manera:
![](https://raw.githubusercontent.com/diegolramirez/MC/master/Talleres/taller(15-06-23)/filtradoFourier.png)

---
#(24-06-15) Décima Tercera Clase

---
#(26-06-15) Décima Cuarta Clase

---
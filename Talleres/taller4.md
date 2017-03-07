#Taller 4
*Métodos Computacionales - Laboratorio*

17-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller4/. No olvide al final hacer un *commit* y un *push*.

# interpolación

1. Del segundo capítulo del [libro de Scherer](http://link.springer.com.ezproxy.uniandes.edu.co:8080/book/10.1007\%2F978-3-642-13990-1) resuelva los literales c y d del problema 2.1.
```
#Punto (c)
#Se utilizan las funciones lagrangep y interlagr para hacer la interpolación polinomial según lo visto en clase.
def interpolacion_seno(numPuntos=4,**kawrgs):
    #Datos iniciales e interpolación
    x = np.linspace(0,2*np.pi,numPuntos)
    y = np.sin(x)
    xpol = np.linspace(0,2*np.pi,1000)
    pol = interlagr(x,y)
    #Gráfica
    plt.scatter(x,y,color='red',label='Datos')
    plt.plot(xpol,pol(xpol),color='blue',label='Interpolación')
    plt.legend()
    plt.xlim(-0.3,np.pi*2+0.3)
    plt.ylim(-1.5,1.5)
    plt.text(4.3,0.7,"Número de puntos\niniciales: %d"%numPuntos)
    plt.show()

interpolacion_seno(numPuntos=7)
```
El resultado final se ve así:
![](https://raw.githubusercontent.com/diegolramirez/MC/master/Talleres/taller(15-06-17)/sin.png)

```
#Punto (d)
#Defino los datos tomados de la tabla
x = np.array([-3,-2,-1,0,1,2,3])
xpol = np.linspace(-3,3,1000)
ypulse = np.array([0,0,0,1,0,0,0])
ystep = np.array([0,0,0,1,1,1,1])

#Defino las interpolaciones
#Lineales
linearpulse = interpolate.interp1d(x,ypulse,kind='linear')
linearstep = interpolate.interp1d(x,ystep,kind='linear')
#Cúbicas
cubicpulse = interpolate.interp1d(x,ypulse,kind='cubic')
cubicstep = interpolate.interp1d(x,ystep,kind='cubic')
#Polinomial
polpulse = interlagr(x,ypulse)
polstep = interlagr(x,ystep)

#Hago las gráficas
plt.figure(figsize=(11, 7))
plt.subplots_adjust(hspace=0.3, wspace=0.00)
#Pulse
plt.subplot(2,1,1)
plt.scatter(x,ypulse,color='red',label='Datos')
plt.plot(xpol,linearpulse(xpol),color='blue',label='Linear')
plt.plot(xpol,cubicpulse(xpol),color='green',label='Cubic')
plt.plot(xpol,polpulse(xpol),color='black',label='Poli')
plt.legend(loc=8,frameon=0)
plt.title("Pulse")
#Step
plt.subplot(2,1,2)
plt.scatter(x,ystep,color='red',label='Datos')
plt.plot(xpol,linearstep(xpol),color='blue',label='Linear')
plt.plot(xpol,cubicstep(xpol),color='green',label='Cubic')
plt.plot(xpol,polstep(xpol),color='black',label='Poli')
plt.legend(loc=4,frameon=0)
plt.title("Step")

plt.show()
```
El resultado final se ve así:
![](https://raw.githubusercontent.com/diegolramirez/MC/master/Talleres/taller(15-06-17)/pulsestep.png)

2. Leer del libro [Numerical Methods and Optimization](http://ezproxy.uniandes.edu.co:8080/login?url=http://dx.doi.org/10.1007/978-3-319-07671-3) de *Eric Walter* los ejemplos de la sección 5.2: *Computer experiments*, *Prototyping* y *Mining surveys*.  

3. La implementación de cierto algoritmo necesita puntos uniformemente muestreados pero los datos que se tienen son los mostrados en la tabla de abajo. Produzca una nueva tabla con el mismo número de líneas pero con muestreo uniforme usando un *cubic spline* .

	| x        | y           |
| ------------- | ------------- |
|0.138490669327|2.30060161547|
|0.153824397539|2.31193402603|
|0.229578204444|2.30212660197|
|0.266435179672|2.25835963399|
|0.276929414769|2.24136088402|
|0.334159056347|2.11468161418|
|0.383612191183|1.96176872424|
|0.446434890218|1.71619353619|
|0.541989923364|1.25473903911|
|1.33433323552|-1.434111205|
|1.44538290595|-1.20791779482|
|1.51883847305|-0.991229025177|
|1.6057389642|-0.687154743681|
|1.74396177688|-0.152610073833|
|1.87038245824|0.324964643125|
|2.30863773381|1.31618219677|
|2.38628525713|1.37058691008|
|2.46587111271|1.4006163649|
|2.65137821271|1.41356286272|
|2.75152244191|1.41133466756|
|2.82756611885|1.41289890942|
|4.19566321688|0.0396966472625|
|4.3105185461|-0.0681282942773|
|4.45641816306|-0.0704087548339|

```
#Descargo los datos y los formateo a un .csv
os.system("curl -s https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller4/Taller4.md > datos3.txt")
os.system("sed -i '1,/3\.\ La/d' datos3.txt")
os.system("sed -i '/Al\ terminar\ la/,$d' datos3.txt")
os.system("sed -i 's/^\s//g' datos3.txt")
os.system("sed -i '/^ *$/d' datos3.txt")
os.system("sed -i 's/^|//g' datos3.txt")
os.system("sed -i 's/|$//g' datos3.txt")
os.system("sed -i 's/|/,/g' datos3.txt")
os.system("sed -i '/--/d' datos3.txt")
os.system("sed -i 's/\s//g' datos3.txt")
os.system("mv datos3.txt datos3.csv")

#Importo datos
datos3 = np.genfromtxt("datos3.csv",delimiter=",",names=True)

#Hago la interpolación y defino un nuevo intervalo x con más puntos
cubicInterpolation = interpolate.interp1d(datos3["x"],datos3["y"],kind='cubic')
xinterpol = np.linspace(datos3["x"][0],datos3["x"][len(datos3["x"])-1],1000)

#Grafico interpolación y datos originales
plt.scatter(datos3["x"],datos3["y"],color='red',label='Datos',linestyle='--')
plt.plot(xinterpol,cubicInterpolation(xinterpol),color='blue',label='CubicFit')
plt.legend(loc=4)
plt.title("Interpolación con datos no uniformemente espaciados")
plt.show()
```
El resultado final se ve así:
![](https://raw.githubusercontent.com/diegolramirez/MC/master/Talleres/taller(15-06-17)/datosnu.png)

```
#Defino un nuevo intervalo x, y uniformemente espaciados
xespaciado = np.linspace(datos3["x"][0],datos3["x"][len(datos3["x"])-1],len(datos3["x"]))
yespaciado = cubicInterpolation(xespaciado)

#Grafico interpolación y datos uniformemente espaciados
plt.scatter(xespaciado,yespaciado,color='blue',label='DatosUniformes')
plt.plot(xinterpol,cubicInterpolation(xinterpol),color='red',label='CubicFit')
plt.legend()
plt.title("Interpolación con datos uniformemente espaciados")
plt.show()
```
El resultado final se ve así:
![](https://raw.githubusercontent.com/diegolramirez/MC/master/Talleres/taller(15-06-17)/datosu.png)

```
#Código para generar la tabla
print ("|  x  |  y  |\n|-----|-----|")
for i in range(len(xespaciado)):
    print ("|%.12f|%.12f|"%(xespaciado[i],yespaciado[i]))
```
####Tabla:
|  x  |  y  |
|-----|-----|
|0.138490669327|2.300601615470|
|0.326226647315|2.135579838040|
|0.513962625304|1.397198817495|
|0.701698603292|0.417206585909|
|0.889434581281|-0.508199547139|
|1.077170559269|-1.198528080330|
|1.264906537257|-1.473608280296|
|1.452642515246|-1.188336200060|
|1.640378493234|-0.556525044030|
|1.828114471223|0.171218763615|
|2.015850449211|0.779865462088|
|2.203586427199|1.184524223958|
|2.391322405188|1.373142088461|
|2.579058383176|1.414481494494|
|2.766794361164|1.411761131732|
|2.954530339153|1.388267057527|
|3.142266317141|1.284266761179|
|3.330002295130|1.116160416788|
|3.517738273118|0.902468822016|
|3.705474251106|0.661712774524|
|3.893210229095|0.412413071971|
|4.080946207083|0.173090512018|
|4.268682185072|-0.034950112880|
|4.456418163060|-0.070408754834|

**Al terminar la clase ejecute `lottery.sh` para saber si su taller va a ser revisado.**

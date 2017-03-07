#Taller 1 (29-May-2015)

**Primer punto:**
#Probando mi sección

##Huy una subsección

##Huy otra subsección

1. mi lista numerada
2. con varios punticos :D

* Ahora mi lista sin numerar
* otro punto

[link a mi repositorio](https://github.com/diegolramirez/MC)

Ahora miremos un trozo de código inline `print ("Hello world")`

```
print ("Este es un trozo de código en bloque")
```

**Segundo punto:**
```
#!/bin/bash
touch taller.csv
for i in {1..1000}
do 
	(( a = i * i ))
	echo $i,$a >> taller.csv
done
```

**Tercer punto:**
```
awk -F "," '{print $1","$2","$1+$2}' taller.csv > tallerawk.csv
```

**Cuarto punto:**
```
#!/bin/bash
read a b
echo $((a+b))
```

**Quinto punto:**
```
#!/bin/bash
while true
do
	date '+%H:%M:%S' | figlet
	sleep 1s
	clear
done
```
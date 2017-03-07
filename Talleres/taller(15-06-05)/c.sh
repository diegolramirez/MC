#!/bin/bash
touch archivoEjemplos.md
for file in $(ls *.c)
do
	echo -e "#$file\n\`\`\`" >> archivoEjemplos.md
	cat $file >> archivoEjemplos.md
	echo -e "\`\`\`\n" >> archivoEjemplos.md
done

rm c31_goto.c c83_terminal_io.c cA5_thread_join.c

pausa=0
for file in $(ls *.c)
do
	nombre=$(echo $file | sed -E 's/\.c/\.out/g')
	gcc -o $nombre $file
	grep -A 2 "Example" $file
	./$nombre
	echo "presione enter para continuar"
	read continuar
	pausa=$((pausa+1))
	if [ $pausa -eq 30 ]; then break; fi
done

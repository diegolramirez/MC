#include <stdio.h>
int main(void)
{

	/*Se declaran los factores de conversión de yards-inch, feet-inch y se retorna el valor que entro, que son las pulgagas.*/
	float yardFactor = 0.027;
	float feetFactor = 0.083;
	float inchFactor = 1.000;

	/*El parametro, el cual recibira la cifra que se quiere convertir a las diferentes unidades.*/
	float parameter;
	
	/*Aquí se indica que el usuario será el que envie el parametro, es decir que introduzca el número al se le quiere hallar la conversión.*/
	printf ("Put a distance in inches(Number)\n");
	scanf ("%f", &parameter);

	/*Creación de las operaciones de conversión.*/
	float yards = parameter * yardFactor;
	float feets = parameter * feetFactor;
	float inches = parameter * inchFactor;
	
	/*Se imprimen los diferentes datos*/
	printf ("Inches %lf: \n",inches);
	printf ("Feets %lf: \n",feets);
	printf ("Yards %lf: \n",yards);
	printf ("\n");
	return 0;
}

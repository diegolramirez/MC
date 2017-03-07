#include <stdio.h>
/*la función math, permite el uso de modf, para separa la parte entera y decimal*/
#include <math.h>
int main(void)
{
	/*Declaración de variables.*/
	float weeklyPay;
	float hours;
	
	/*El usuario le da valor a las variables.*/
	printf ("Put your weekly pay: \n");
	scanf ("%f", &weeklyPay);
	printf ("Put your hours worked: \n");
	scanf ("%f", &hours);

	/*Cómo el usuario indica cuanto le pagan a la semana, se debe transformar la semana en horas 
	*para poder saber cuanto le pagan por hora y así determinar el pago por hora trabajada, 
	*entonces al convertir la semana en horas, se tiene que una semana es igual a 0.00595 semanas.*/
	float payPerHour = weeklyPay * 0.00595;

	/*Ahora con el pago por hora se calcula cuanto le pagan por hora.*/
	double total = payPerHour * hours;

	/*Separo la parte decimal de la entera para generar el resultado que indican en el libro. Para esto se emplea la función modf*/
	double fractpart;
	double integer;
	fractpart = modf(total, &integer);
	printf ("Your average hourly pay rate is %f dollars and %f cents \n", integer, fractpart);

	return 0;
}

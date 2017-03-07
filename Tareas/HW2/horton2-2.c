#include <stdio.h>
int main(void)
{
	/*Unidades de conversión*/
	float yardFeetFactor = 0.33;
	float yardInchFactor = 0.02;
	
	/*Se establecen los parametros*/
	float widthInch;
	float lengthInch;
	float widthFeet;
	float lengthFeet;
	
	/*El usuario le da los valores a las variables*/
	printf ("Lenght in Feets: \n");
	scanf ("%f", &lengthFeet);
	printf ("Now the length in Inches: \n");
	scanf ("%f", &lengthInch);
	printf ("Width in Feets: \n");
	scanf ("%f", &widthFeet);
	printf ("Now the width in Inches: \n");
	scanf ("%f", &widthInch);
	
	
	/*Se realiza la conversión*/
	float wInchToYard = widthInch * yardInchFactor;
	float lInchToYard = lengthInch * yardInchFactor;
	float wFeetToYard = widthFeet * yardFeetFactor;
	float lFeetToYard = lengthFeet * yardFeetFactor;
	
	/*Calculo de área*/
	float area = (wInchToYard + wFeetToYard) * (lInchToYard + lFeetToYard);
		
	/*Se imprime el área*/
	printf ("Area in Yard %lf: \n", area);
	return 0;
}	
	

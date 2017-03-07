#include <stdio.h>
int main (void)
{
	/*Las variables son de tipo int, ya que son dos tipos de articulos y la cantidad es un entero*/
	int version;
	int quantity;
	
	/*El usuario le da valor a las variables*/
	printf ("Type 0 if the product is standard version, Type 1 if the product is deluxe version: \n");
	scanf ("%d", &version);
	printf ("Type the quantity of products to buy: \n");
	scanf ("%d", &quantity);

	/*Se le asigna precio a las versiones y se da el total*/
	if (version == 0)
	{
		float total = 3.5*quantity;
		printf ("Total == : $ %f \n", total);
	}
	if (version == 1)
	{
		float total = 5.5*quantity;
		printf ("Total == : $ %f \n", total);
	}
	return 0;
}

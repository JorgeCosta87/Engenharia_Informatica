#include <stdio.h>
#include <stdlib.h>


int main(int argc, char ** argv){


	if(argc !=  3){
		printf("Deve digitar o nome e idade\n");
		return 1;
	}
	
	int n = atoi(argv[2]);

	if (n > 18)  printf("\nO %s e maior de idade\n", argv[1]);
	 else printf("\nO %s e menor de idade\n", argv[1]);

	return 0;
}

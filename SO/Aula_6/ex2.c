#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <time.h>

int num1, num2, N = 5, i = 0, n = 0;

void demorou(){

	num1 = rand() % 9;
	num2 = rand() % 9;

	printf("\n %d x %d : ", num1, num2); 
	fflush(stdout);

	alarm(N);
}


int main(int argc, char** argv){

	time_t t;

	signal(SIGALRM, demorou);
 	srand((unsigned) time(&t));
	
	while (i != 2)
	{
		demorou();
		scanf("%d" ,&n);

		if(n == (num1 * num2))
		{
			printf("\nAcertou\n");
			i = 0;
			N--;
		}else{
			printf("Falhou\n");
			i++;
		}
	}

	return 0;
}

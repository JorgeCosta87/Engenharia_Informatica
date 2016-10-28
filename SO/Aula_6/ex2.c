#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <time.h>

int num1, num2, N, i;

void demorou(int n){

	if(i == 2)
		exit(1);

        num1 = rand() % 101;
        num2 = rand() % 101;
	N--;
        printf("\n %d %d", num1, num2);
	alarm(N);
}


int main(int argc, char** argv){

	int n;
	time_t t;
	N = 20;

	signal(SIGALRM, demorou);
 	srand((unsigned) time(&t));
	demorou(14);
	scanf("%d" ,&n);

	if(n == (num1 * num2))
	{
		printf("Acertou\n");
		i = 0;
	}else{
		printf("Falhou\n");
		i++;
	{

	return 0;
}

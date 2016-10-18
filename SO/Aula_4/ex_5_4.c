
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>

int main(int argc, char** argv){

	int a = 10;
	int estado;

	printf("Start fork\n");

	if(fork()  == 0){
		a = getpid();
	}
	else{
		a = getpid();
		sleep(10);
	}
	printf("\nPID: %d\n",a);

	exit(0);
}


#include <stdio.h>
#include <stdlib.h>
#include <signal.h>


int main(int argc, char** argv){

	int pid;
	union sigval val;

	pid = atoi(argv[1]);
	printf("Vou enviar o SIGUSR1 ao PID %d \n", pid);

	//kill(pid, SIGUSR1);
	printf("Qual a aposta?\n");
	scanf("%d", &val.sival_int);
	sigqueue(pid, SIGUSR1, val);

	return 0;
}

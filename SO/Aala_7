
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>


int main(int argc, char** argv){

	int pid;

	pid = atoi(argv[1]);
	printf("Vou enviar o SIGUSR1 ao PID %d \n", pid);

	kill(pid, SIGUSR1);

	return 0;
}

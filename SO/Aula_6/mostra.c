#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

void diz(int s){
	if (s == SIGINT){
		printf("Hey\n");
		alarm(0);

	} else if(s==SIGUSR1) {
		printf("\nAdeus..\n");
		exit(3);
	} else if (s == SIGALRM){
		alarm(10);
		write(1, "X", 1);
	}
}

int main(int argc, char** argv){

	//signal(SIGINT, SIG_IGN);
	signal(SIGUSR1, diz);
	signal(SIGINT, diz);


	signal(SIGALRM, diz);

	alarm(10);

	printf("Processo %d ... \n", getpid());
	if(argc != 3){
		printf("[ERRO] Nr . ARGS %d != 3\n", argc);
		exit(0);
	}

	char c = argv[2][0];

	for(int i = 0 ; i < atoi(argv[1]) ; i++)
	{
		printf("%c",c);
		fflush(stdout);
		sleep(1);
	}


	exit(0);
}

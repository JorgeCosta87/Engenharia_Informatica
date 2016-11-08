#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

int aposta;

void diz(int s, siginfo_t *info,void *context){

	union sigval val;

	printf("\nRecebi o sinal %d do processo %d...", s, info->si_pid);
	if (info->si_code==SI_QUEUE) // para saber se o programa qu enviou o sinal, foi com o sigqueue.
		printf("enviou %d!", info->si_int);

	//completar
	sigqueue(info->si_pid, SIGUSR1, val);

}

int main(int argc, char** argv){
	int i,n;
	struct sigaction act;

	srand((unsigned int) time ( NULL );
	aposta = rand() % 101;

	//signal(SIGINT, SIG_IGN);

	act.sa_flags = SA_SIGINFO;
	act.sa_sigaction = diz;
	sigaction(SIGUSR1, &act, NULL);


	//signal(SIGALRM, diz);

	alarm(10);

	printf("Processo %d ... \n", getpid());
	if(argc != 3){
		printf("[ERRO] Nr . ARGS %d != 3\n", argc);
		exit(7);
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

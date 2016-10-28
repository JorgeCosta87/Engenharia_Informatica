#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>

int main(int argc, char** argv){

	char dic, pal[20], lixo;
	int estado;

	do {
		printf("\n\n------Dicionario en = e or fr = f------\n");
		scanf("%c",&dic);
		if(dic == 'e' || dic =='f'){
			printf("Palavra :");
			scanf("%s", pal);
		}

		if(fork() == 0){
			printf("Eu sou o filho %d /n", getpid());
			sleep(20);
			if(dic == 'e')
				execl("./ding","ding",pal,NULL);
			else
				execl("./dfran","dfran",pal,NULL);
			return 13;
		}
		else{
			wait(&estado);
			if(WIFEXITED(estado))
				 printf("O filheo terminou com exit %d\n",WEXITSTATUS(estado));
			if(WIFSIGNALED(estado))
				printf("O filhe erminou com sinal %d\n", WTERMSIG(estado));
		}

	}while(dic != 'x');

	exit(0);
}

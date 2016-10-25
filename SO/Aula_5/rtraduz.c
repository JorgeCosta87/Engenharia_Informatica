
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>

int main(int argc, char** argv){

	char dic, pal[20], lixo;
	int estado;
	int canal[2]; //com um pipe precisamos de dois descritores

		printf("\n\n------Dicionario en = e or fr = f------\n");
		scanf("%c",&dic);

		if(dic == 'e' || dic =='f'){
			printf("Palavra :");
			scanf("%s", pal);
			scanf("%c",&lixo);
		}
		pipe(canal);
		if(fork() == 0){
			if(dic == 'e')
				execl("./rding","rding",NULL);
			else
				execl("./rdfran","rdfran",NULL);
		}
		else{
			wait(&estado);
			printf("o meu filho ja fez a tradução");

		}

	exit(0);
}

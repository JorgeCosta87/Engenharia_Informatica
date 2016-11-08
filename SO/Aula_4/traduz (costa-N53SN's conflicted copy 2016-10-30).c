
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>

int main(int argc, char** argv){

	char dic, pal[20], lixo;

	do {
		printf("\n\n------Dicionario en = e or fr = f------\n");
		scanf("%c",&dic);
		if(dic == 'e' || dic =='f'){
			printf("Palavra :");
			scanf("%s", pal);
			scanf("%c",&lixo);
		}

		if(fork() == 0){
			if(dic == 'e')
				execl("./ding","ding",pal,NULL);
			else
				execl("./dfran","dfran",pal,NULL);
		}
		else
			wait(NULL);

	}while(dic != 'x');

	exit(0);
}

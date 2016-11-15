
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "util.h"

int main(int argc, char** argv){
	
	int i,fd, fd_resp, res,  pid;
	char str[20];
	PEDIDO pedido;

        if(access(FIFO, F_OK) !=0){
        printf("\nO servidor nao esta a correr\n");
        return 3;
        }

	pedido.pid = getpid();
	sprintf(str,"ccc%d", pid);
	mkfifo(str, 0600);

	fd = open(FIFO, O_WRONLY);

	do{

		printf("num 1: ");
		scanf("%d", &pedido.n1);
		printf("\nnum 2: ");
		scanf("%d", &pedido.n2);
		printf("\nQue op pretende realizar: ");
		scanf(" %c", &pedido.op);


		i = write(fd, &pedido, sizeof(pedido));

		//RECEBER RESPOSTA
		fd_resp = open(str,O_RONLY);
		i = read(fd_resp, &res, sizeof(res));
		close(fd_resp);

		printf("Recebi a resposta .... %d ( %d bytes) \n",res , i);

	}while(pedido.op  != '.' && pedido.op != '!');
	close(fd);
	unlink(str);
	return 0;


}

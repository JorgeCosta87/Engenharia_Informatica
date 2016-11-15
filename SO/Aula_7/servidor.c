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


	int i, fd, fd_resp, res;
	char str[80];
	PEDIDO pedido;

	mkfifo(FIFO, 0600);

	fd = open(FIFO,O_RDWR);
	printf("A espera do primeiro produtor\n");

	do{
		 i = read(fd, &pedido, sizeof(pedido));
		if(i>0){
			printf("Recebi um pedido (%d bytes)\n",i);
		}
 		printf("\nPedido: n1: %d, n2 %d, op: %c: pid: %d \n", pedido.n1, pedido.n2, pedido.op, pedido.pid);
		res = pedido.n1 + pedido.n2;

		//ENVIAR RESP

		sprintf(str,"ccc%d", pedido.pid);
		fd_resp = open(str,O_WONLY);
                i = write(fd_resp, &res, sizeof(res));
                close(fd_resp);

                printf("Enviei a resposta .... %d ( %d bytes) \n",res , i);




	}while(pedido.op != '!');
	close(fd);
	printf("Vou terminar\n");

	unlink(FIFO);

	return 0;


}


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
	char str[80], cmd[20];
	PEDIDO pedido;


	fd_set conj_fd;
	struct timeval tempo;
	int  ret;

	//if(fork() > 0) // para deixar o servidor em background
	//{
	//	printf("\nVou deixar o meu filheo trabalhar\n");
	//	return 0;
	//}

	mkfifo(FIFO, 0600);

	fd = open(FIFO,O_RDWR);
	printf("A espera do primeiro produtor\n");

	do{
		FD_ZERO(&conj_fd);
		FD_SET(0, &conj_fd); //toma atencao ao teclado 0 igual ao stdin (teclado)
		FD_SET(fd, &conj_fd);// toma  atençao ao fifo criado
		tempo.tv_sec = 3; // esepra 3.5 segundos , ver man do select
		tempo.tv_usec = 50000;

		ret = select(fd+1, &conj_fd, NULL, NULL, &tempo); //fd+1  ficheiro no descritor de ficheiros  mais alto + 1 

		if(ret == 0 ) // acabou os 3.5 segundos e não havia dados
		{
			printf(".");
			fflush(stdout);
		}
		else if (ret > 0){
			if(FD_ISSET(0, &conj_fd) ){ // no teclado
				//Pedido balcao
				scanf("%s", cmd);
				printf("\nComando introduzido: %s ", cmd);
				//se cmd == a mostra coloca os clientes no servidor
			}
			if(FD_ISSET(fd, &conj_fd) ){

				//pedido por email
				 i = read(fd, &pedido, sizeof(pedido));
				if(i == sizeof(pedido)){
					//vereficar se o pid existe na tabela de clientes
					// Se nao existir Acrescenta
					// se pedido.op == . Entao retira o pid da tabela de clientes
					printf("Recebi um pedido (%d bytes)\n",i);
					}
	 			printf("\nPedido: n1: %d, n2 %d, op: %c pid: %d \n", pedido.n1, pedido.n2, pedido.op, pedido.pid);
				res = pedido.n1 + pedido.n2;

				//ENVIAR RESP

				sprintf(str,"ccc%d", pedido.pid);
				fd_resp = open(str,O_WRONLY);
	               		 i = write(fd_resp, &res, sizeof(res));
        	        	close(fd_resp);

	                	printf("\nEnviei a resposta .... %d ( %d bytes) \n",res , i);
				}
			}

	}while(pedido.op != '!');

	//avisar se os clientes vao embora
	// percorre tabela de clientes e envia (kill)  um sigusr1 a cada um != 0 - má opccao
	// Adpatar o cliente e enviar uma msg pelo fifo de cada clientes a dizer  -1
	close(fd);
	printf("Vou terminar\n");

	unlink(FIFO);

	return 0;


}

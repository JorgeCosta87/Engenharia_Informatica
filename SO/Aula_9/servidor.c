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


	int i,j, fd, fd_resp, res, cliente[5] = {0,0,0,0,0};
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

		if(ret > 0 ) // acabou os 3.5 segundos e não havia dados
		{
		
		if (ret > 0){
			if(FD_ISSET(0, &conj_fd) ){ // no teclado
				//Pedido balcao
				scanf("%s", cmd);
				printf("Comando introduzido: %s ", cmd);
				if(strcmp(cmd,"mostra") == 0)
					for(j = 0 ; j < 5 ; j++)
						printf("Cliente[%d] = %d\n", j, cliente[j]);
				//se cmd == a mostra coloca os clientes no servidor
			}
			if(FD_ISSET(fd, &conj_fd) ){

				//pedido por email
				 i = read(fd, &pedido, sizeof(pedido));
				if(i == sizeof(pedido))
				{
					for(int j = 0 ; j <5 ;j++){
						if(cliente[j] != pedido.pid)
							cliente[j] = pedido.pid;
							
					}
					//vereficar se o pid existe na tabela de clientes
					// Se nao existir Acrescenta
					// se pedido.op == . Entao retira o pid da tabela de clientes
					printf("\nRecebi um pedido (%d bytes)",i);
					}
	 			printf("\nPedido: n1: %d, n2 %d, op: %c pid: %d \n", pedido.n1, pedido.n2, pedido.op, pedido.pid);
				res = pedido.n1 + pedido.n2;


				//ENVIAR RESP
				if(cliente[j] != 0 ){

					sprintf(str,"ccc%d", cliente[j]);
					fd_resp = open(str,O_WRONLY);
	        	       		 i = write(fd_resp, &res, sizeof(res));
        		        	close(fd_resp);
	
	                		printf("\nEnviei a resposta .... %d ( %d bytes) \n",res , i);
				}
				}
			}
		}
	}while(pedido.op != '!' && strcmp(cmd, "sai") != 0);

	close(fd);
	printf("Vou terminar\n");

	unlink(FIFO);

	return 0;


}

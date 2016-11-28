#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <pthread.h>
#include "util.h"

int ACTIVA;

void *recebe_msg(void *dados){
	int i, fd, fd_resp, res;
	char str[80];

	sprintf(str,"ccc%d", getpid());
	mkfifo(str, 0600);

    do{	
	fd_resp = open(str,O_RDWR);
	i = read(fd_resp, &res, sizeof(res));
	printf("\n\nRecebi a resposta .... %d ( %d bytes) \n",res , i);
   }while(ACTIVA);
    close(fd_resp);
    unlink(str);

    pthread_exit(0);
}



int main(int argc, char** argv){
	int i,fd; 
	char str[20];
	PEDIDO pedido;
	pthread_t tarefa;

        if(access(FIFO, F_OK) !=0){
        printf("\nO servidor nao esta a correr\n\n");
        return 3;
        }
	ACTIVA = 1;
	pthread_create(&tarefa, NULL, &recebe_msg, NULL);
	pedido.pid = getpid();

	fd = open(FIFO, O_WRONLY);
	do{
		printf("\nnum 1: ");scanf("%d", &pedido.n1);
		printf("num 2: ");scanf("%d", &pedido.n2);
		printf("Que op pretende realizar: ");scanf(" %c", &pedido.op);
		i = write(fd, &pedido, sizeof(pedido));
	}while(pedido.op  != '.' && pedido.op != '!');
	ACTIVA = 0;
	pthread_join(tarefa, NULL); //podemos receber o valor da thread
	close(fd);
	return 0;


}

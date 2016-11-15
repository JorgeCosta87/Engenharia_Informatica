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


	int i, fd;
	char str[80];

	mkfifo("canal.txt", 0600);

	fd = open("canal.txt",O_RDWR);
	printf("A espera do primeiro produtor\n");

	do{

		 i = read(fd, str, 79);  //temos de usar ( ), caso contrario a comparação seria feita primeiro que a atribuição
		if(i>0){
			str[i-1] = '\0';
			printf("%s (%d bytes)\n", str,i);
		}

	}while(strcmp(str,"desliga") != 0);
	close(fd);
	printf("Vou terminar\n");

	unlink("canal.txt");

	return 0;


}

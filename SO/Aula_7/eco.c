#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

	int main(int argc, char** argv){


	int i, fd;
	char str[80];

	mkfifo("canal.txt", 0600);

	fd = open("canal.txt",O_RDONLY);

	do{

	 i = read(fd, str, 79);  //temos de usar ( ), caso contrario a comparação seria feita primeiro que a atribuição
	if(i>0){
		str[i] = '\0';
		printf("%s (%d btes)", str,i);
	}else if(i==0){
	printf("Nao tenho produtores..");
		sleep(1);
	}
	}while(strncmp(str,"desliga",7) != 0);
	close(fd);
	printf("Vou terminar");

	unlink("canal.txt");

	return 0;


}

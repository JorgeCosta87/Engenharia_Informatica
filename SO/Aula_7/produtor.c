
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
	
	int i, fd, n=40;
	char str[80];

	if(access("canal.txt", F_OK) !=0){

	printf("\nO servidor nao esta a correr\n");
	return 3;
	}

	fd = open("canal.txt",O_WRONLY);
	do{
		fgets(str,79,stdin);
		i = write(fd, str, strlen(str));
	}while(strncmp(str,"fim",3) != 0);
	close(fd);

	return 0;


}

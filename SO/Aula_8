
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char** argv){
	
	int i, fd, n=40;
	char str[80];

	if(argc != 2){
		printf("[ERROR]: -filename\n");
		exit(1);
	}

	fd = open(argv[1],O_WRONLY | O_CREAT, 0600);
	i = write(fd, &n, sizeof(int));

	do{
		fgets(str,79,stdin);
		i = write(fd, str, strlen(str));
	}while(strncmp(str,"fim",3) != 0);
	close(fd);

	return 0;


}

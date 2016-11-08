

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
	printf("\nJá tneho clientes\n");
	while( ( i = read(fd, str, 79) ) > 0){  //temos de usar ( ), caso contrario a comparação seria feita primeiro que a atribuição
		str[i] = '\0';
		printf("%s", str);
	}
	printf("\nPerdi todos os clientes\n");
	close(fd);

	unlink("canal.txt");

	return 0;


}

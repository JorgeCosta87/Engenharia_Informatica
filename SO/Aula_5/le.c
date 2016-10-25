
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

	fd = open(argv[1],O_RDONLY);
	i = read(fd, &n, sizeof(int));

	printf("N = %d ( %d bytes)\n", n, i);
	while( ( i = read(fd, str, 79) ) > 0){  //temos de usar ( ), caso contrario a comparação seria feita primeiro que a atribuição
		str[i] = '\0';
		printf("%s", str);
	}
	close(fd);

	return 0;


}

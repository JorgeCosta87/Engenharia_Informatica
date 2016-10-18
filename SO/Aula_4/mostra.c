#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char** argv){

	if(argc != 3){
		printf("[ERRO] Nr . ARGS %d != 3\n", argc);
		exit(0);
	}

	char c = argv[2][0];

	for(int i = 0 ; i < atoi(argv[1]) ; i++)
	{
		printf("%c",c);
		fflush(stdout);
		sleep(1);
	}



	exit(0);
}

#include <stdio.h>
#include <stdlib.h>


int main(int argc, char ** argv){


	if(argc < 2){ // we want more than one cmd
		printf("Invalid command\n");
		return 1;
	}

	for(int i = 1 ; argv[i] != NULL ; i++){

		printf("cmd %d - %s\n",i,argv[i]);
	}

	return 0;
}

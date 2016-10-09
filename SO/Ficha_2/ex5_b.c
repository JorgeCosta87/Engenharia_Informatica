#include <stdio.h>
#include <stdlib.h>


int main(int argc, char ** argv){


	if(argc < 1){
		printf("Invalid command");
		return 1;
	}
	
	for(int i = 1 ; argv[i] != NULL ; i++){
		
		printf("cmd %d - %s\n",i,argv[i]);
	}

	return 0;
}

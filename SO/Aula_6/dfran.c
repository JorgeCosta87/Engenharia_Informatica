
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>

int main(int argc, char** argv){
	
	int i ;

	if(argc != 2){
		printf("[ERROR] digite uma plavra\n");
		exit(1);
	}


	char *words_pt[] =  {"ola","terra","agua","rato","aviao"};
        char *words_en[] = {"hi","earth_fr","water_fr","mouse_fr","plane_fr"};

	for(i = 0; i < 5 ; i++){
		if(strcmp(argv[1],words_pt[i]) == 0){
			printf("Traducao: %s \n", words_en[i]);
			break;
		}
	}

	if(i > 4)
		printf("unkown\n");

	exit(0);
}


#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>

int main(int argc, char** argv){
	
	int i ;



	char *words_pt[] =  {"ola","terra","agua","rato","aviao"};
        char *words_en[] = {"hi","earth_fr","water_fr","mouse_fr","plane_fr"};
	char word[15];

	printf("Digite uma plavra: \n");
	fgets(word,15,stdin);
	word[strlen(word) - 1] = '\0';
	
	for(i = 0; i < 5 ; i++){
		if(strcmp(word,words_pt[i]) == 0){
			printf("Traducao: %s \n", words_en[i]);
			break;
		}
	}

	if(i > 4)
		printf("unkown\n");

	exit(0);
}

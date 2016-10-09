#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char ** argv){

	char *value;

	if(argc != 3){
		printf("[ERROR] Globalvar : value\n");
		return 1;
	}

	value = malloc(sizeof(char) * (strlen(argv[1]) + strlen(argv[2]))) + sizeof(char); // plus 1 for the equal sign
	strcpy(value, argv[1]);
	strcat(value, "=");
	strcat(value, argv[2]);

	putenv(value); // value = nameVar=ValueVar

	printf("Value of %s: %s \n",argv[1],getenv(argv[1]));
	return 0;
}

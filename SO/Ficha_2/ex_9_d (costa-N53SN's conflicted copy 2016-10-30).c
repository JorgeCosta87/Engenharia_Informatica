#include <stdio.h>
#include <stdlib.h>

extern char **environ;

int main(int argc, char ** argv){


	printf("getEnv  -  %s\n",getenv("PATH"));

	return 0;
}

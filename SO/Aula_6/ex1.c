#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

void call(int n){
	static int c = 0;
	if (c==5)
		exit(1);

	printf("\nai\n");
	c++;
}

int main(int argc, char** argv){

	char str[20];

	signal(SIGINT, call);

	scanf("%s", str);

	printf("hey %s\n", str);

	return 0;
}

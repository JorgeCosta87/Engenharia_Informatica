#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

void call(int n){
	static int c = 0;
	if (c==5)
		exit(1);

	printf("\n%d\n",c);
	c++;
}

int main(int argc, char** argv){

	char str[20];

	signal(SIGINT, call);

	while(1) pause();
	scanf("%s", str);

	printf("hey %s\n", str);

	return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char** argv){

	printf("Start...Executa\n");
	sleep(1);
	printf("Executa mostra...\n\n");
	execl("./mostra","mostra","10","a", NULL);
	printf("[ERROR] still executar\n");

	exit(0);
}

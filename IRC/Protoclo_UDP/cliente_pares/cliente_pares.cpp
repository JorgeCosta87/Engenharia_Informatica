#include <winsock.h>
#include <stdio.h>


#define SERVER_HOST "127.0.0.1"
#define SERVER_PORT 6000

#define BUFFER_SIZE 4096
#define MAX_RESPOSTA 50


void Abort(char *s);

int main(int argc, char ** argv)
{
	SOCKET socket_hanlder;
	int iResult, nbytes, my_addr_len, addr_len;
	struct sockaddr_in my_addr, serv_addr, cli_addr, addr;
	WSAData wsadata;

	if (argc != 2)
	{
		fprintf(stderr, "[ERROR] - Sintaxe: msg");
		exit(1);
	}

	iResult = WSAStartup(MAKEWORD(2, 2), &wsadata);
	if (iResult != 0) {
		fprintf(stderr, "WSASARTUP falied: %d", iResult);
		getchar();
		exit(1);
	}

	socket_hanlder = socket(PF_INET, SOCK_DGRAM, 0);
	if (socket_hanlder == INVALID_SOCKET) {
		Abort("Impossibiidade de abertura do socket");
	}

	memset((char*)&serv_addr, 0, sizeof(serv_addr));
	serv_addr.sin_family = AF_INET;
	serv_addr.sin_addr.s_addr = inet_addr(SERVER_HOST);
	serv_addr.sin_port = htons(SERVER_PORT);


	//OBTER INFO SOBRE O MEU SOCKET


	//ENVIAR A MSG AO SERVIDOR, PARA FICAR REGISTADO

	if (sendto(socket_hanlder, argv[1], strlen(argv[1]), 0, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) == SOCKET_ERROR) {
		Abort("Impossivel enviar a mensagem ao servidor");
	}

	printf("\nMensagem envida para o servidor sem confirmacao\n");

	//RECEBER INFORMÇÃO SOBRE O MEU SOCKET
	my_addr_len = sizeof(my_addr);
	if ((getsockname(socket_hanlder, (struct sockaddr*)&my_addr, &my_addr_len)) == SOCKET_ERROR) {
		Abort("Impossivel receber info do socket");
	}

	fprintf(stdout, "\nMeus Dados: \n IP: %s \n PORT: %d\n", inet_ntoa(my_addr.sin_addr), ntohs(my_addr.sin_port));

	//AGUARDAR RESPOSTA
	addr_len = sizeof(addr);
	nbytes = recvfrom(socket_hanlder, (char*)&cli_addr, sizeof(cli_addr), 0, (struct sockaddr*)&addr, &addr_len);


	//Verificar se a mensagem veio do servidor ou do cliente
	if (serv_addr.sin_addr.s_addr == addr.sin_addr.s_addr && serv_addr.sin_port == addr.sin_port) {

		printf("\nEnvio por parte do servidor:\n");
		fprintf(stdout, "\nCara metade \nDados: \n IP: %s \n PORT: %d\n", inet_ntoa(cli_addr.sin_addr), ntohs(cli_addr.sin_port));

		if (sendto(socket_hanlder, (char*)&my_addr, sizeof(my_addr), 0, (struct sockaddr*)&cli_addr, sizeof(cli_addr)) == SOCKET_ERROR) {
			Abort("Impossivel enviar a mensagem ao cliente");
		}

		printf("\nEstabelecer contacto com a cara metade\n");
	}
	else 
	{
		printf("\nEnvio por parte da cara metade:\n");
		fprintf(stdout, "\nCara metade \nDados: \n IP: %s \n PORT: %d\n", inet_ntoa(addr.sin_addr), ntohs(addr.sin_port));
	}
	closesocket(socket_hanlder);
}


void Abort(char * s)
{
	fprintf(stderr, "\n[ERRO] - msg: %s - %d\n", s, WSAGetLastError());
	exit(1);
}
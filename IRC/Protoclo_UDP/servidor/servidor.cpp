#include <stdio.h>
#include <WinSock.h>


#define SERVER_PORT 6000

#define BUFFER_SIZE 4096
#define MAX_REPOSTA 50


void Abort(char * s);


int main(int argc, char ** argv)
{
	SOCKET socket_handler;
	int nbytes, iResult, cli_len;
	char buffer[BUFFER_SIZE];
	char resposta[MAX_REPOSTA];
	struct sockaddr_in srv_addr, cli_addr;
	WSAData wsadata;


	iResult = WSAStartup(MAKEWORD(2, 2), &wsadata);

	if (iResult != 0)
	{
		fprintf(stderr, "WSASTARTUP failed %d", iResult);
		getchar();
		exit(1);
	}

	socket_handler = socket(PF_INET, SOCK_DGRAM, 0);

	if (socket_handler == INVALID_SOCKET)
	{
		Abort("Impossivel criar Socket");
	}

	memset((char*)&srv_addr, 0, sizeof(srv_addr));

	srv_addr.sin_family = AF_INET;
	srv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
	srv_addr.sin_port = htons(SERVER_PORT);

	if (bind(socket_handler,(struct sockaddr *)&srv_addr, sizeof(srv_addr)) == SOCKET_ERROR) {
		Abort("Impossivel de registar-se para escuta");
	}

	while (1) {

		fprintf(stderr, "\n Server 1 - Esperando datagram...\n");

		cli_len = sizeof(cli_addr);
		nbytes = recvfrom(socket_handler, buffer, sizeof(buffer), 0, (struct sockaddr*)&cli_addr, &cli_len);

		if (nbytes == SOCKET_ERROR)
			Abort("Erro na recepcao de datagrams");

		buffer[nbytes] = '\0';

		printf("\n Server 1 - Mensagem Recebida : %s\n", buffer);

		fprintf(stdout, "\n Dados do cliente: \n IP: %s \n PORTO: %d\n", inet_ntoa(cli_addr.sin_addr), ntohs(cli_addr.sin_port));

		//sprintf(resposta, "%d", nbytes); int to ascii
		//itoa(nbytes, resposta, 10); int to ascii



		if (sendto(socket_handler, (char*)&nbytes, sizeof(nbytes), 0, (struct sockaddr*)&cli_addr, sizeof(cli_addr)) == SOCKET_ERROR) {
			Abort("Mensagem não foi enviada");
		}

		printf("\n Server 1 - Enviou de confirmacao da msg : %s\n", buffer);
	
	}


	closesocket(socket_handler);

	printf("\n");
	exit(EXIT_SUCCESS);

}

void Abort(char * s)
{
	fprintf(stderr, "[ERRO] msg: %s - %d", s, WSAGetLastError());
	exit(EXIT_FAILURE);
}
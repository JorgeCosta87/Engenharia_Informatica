#include <stdio.h>
#include <WinSock.h>



#define SERVER_ADDR "127.0.0.1"
#define SERVER_PORT 6000

#define BUFFER_SIZE 4096

#define TIMEOUT 10000

void Abort(char * s);

int main(int argc, char ** argv) {

	SOCKET socket_handler;
	int ip, port, msg, broadcast = 1, timeout;
	int nbytes, iResult, msg_len, cli_len, addr_len, resposta;
	char buffer[BUFFER_SIZE];
	struct sockaddr_in serv_addr, cli_addr, addr;
	WSAData wsdata;

	timeout = TIMEOUT;


	if (argc != 7) {
		fprintf(stderr, "[ERRO] : Deve conter os seguintes args -ip -msg -port");
		exit(EXIT_FAILURE);
	}

	for (int i = 0; i < argc; i++)
	{
		if (strcmp(argv[i], "-ip") == 0) {
			ip = ++i;
		}
		else if (strcmp(argv[i], "-port") == 0) {
			port = ++i;
		}
		else if (strcmp(argv[i], "-msg") == 0) {
			msg = ++i;
		}
	}

	iResult = WSAStartup(MAKEWORD(2, 2), &wsdata);
	if (iResult != 0) // caso a função tinha sido bem sucedidade returna 0;
	{
		printf("WSAStartup failed: %d", iResult);
		getchar();
		exit(1);
	}


	socket_handler = socket(PF_INET, SOCK_DGRAM, 0);

	if (socket_handler == INVALID_SOCKET){
		Abort("Impossivel abrir socket");
	}

	//to set the broadcast
	//setsockopt(socket_handler, SOL_SOCKET, SO_BROADCAST,(char*)&broadcast, sizeof(broadcast));

	//Timeout aguarda pela resposta do servidor durante x tempo
	if(setsockopt(socket_handler, SOL_SOCKET, SO_RCVTIMEO, (char*)&timeout, sizeof(timeout)) == SOCKET_ERROR)
		Abort("Timetout error");

	//initialize scokaddr_in
	memset((char*)&serv_addr, 0, sizeof(serv_addr));
	serv_addr.sin_family = AF_INET;
	serv_addr.sin_addr.s_addr = inet_addr(argv[ip]);
	serv_addr.sin_port = htons(atoi(argv[port]));


	if (sendto(socket_handler, argv[msg], strlen(argv[msg]), 0, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) == SOCKET_ERROR)
	{
		Abort("SO nao aceitou o seu dataggram");
	}

	printf("\nCliente: Mensagem enviada, sem confirmacao de chegada");


	cli_len = sizeof(cli_addr);
	if (getsockname(socket_handler, (struct sockaddr*)&cli_addr, &cli_len) == SOCKET_ERROR)
	{
		Abort("Nao extraiu a informcao do socket");
	}

	fprintf(stdout, "\nO meu Porto: %d\n", ntohs(cli_addr.sin_port));


	//------------A espera da resposta do servidor-----------------------

	addr_len = sizeof(addr);
	nbytes = recvfrom(socket_handler, (char*)&resposta, sizeof(resposta), 0,(struct sockaddr*)&addr,&addr_len);



	if (nbytes == SOCKET_ERROR)
		Abort("Erro na recepcao de datagrams");

	if (strcmp(inet_ntoa(serv_addr.sin_addr), inet_ntoa(addr.sin_addr)) == 0 && serv_addr.sin_port == addr.sin_port)
	{
		//buffer[nbytes] = '\0';
		printf("\nCliente: Confirmacao por parte do serv - tamanho da msg: %d", resposta);
		printf("\nA mensagem foi enviada pelo servidor \n Dados servidor: \n IP: %s \n PORTO: %d", inet_ntoa(addr.sin_addr), ntohs(addr.sin_port));
	}
	else 
	{
		printf("\nA mensagem nao foi enviada pelo servidor \n Dados impostor: \n IP: %s \n PORTO: %d", inet_ntoa(addr.sin_addr), ntohs(addr.sin_port));
	}


	closesocket(socket_handler);

	printf("\n");
	exit(EXIT_SUCCESS);

}


void Abort(char * s) {
	fprintf(stderr,"\n[ERRO] : msg: %s  - %d\n", s, WSAGetLastError());
	exit(EXIT_FAILURE);
}

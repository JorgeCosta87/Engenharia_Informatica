#include <winsock.h>
#include <stdio.h>



#define SERVER_PORT 6000

#define BUFFER_SIZE 4096
#define MAX_RESPOSTA 50


void Abort(char *s);

int main(int argc, char ** argv)
{
	int iResult, nbytes, cli1_len, cli2_len;
	char cl1_buffer[BUFFER_SIZE];
	char cl2_buffer[BUFFER_SIZE];
	SOCKET socket_handler;
	struct sockaddr_in serv_addr, cli_addr_1, cli_addr_2;
	WSAData wsadta;


	iResult = WSAStartup(MAKEWORD(2, 2), &wsadta);
	if (iResult != 0)
	{
		printf("WSASTARTUP failed: %d", iResult);
		getchar();
		exit(1);
	}

	//Initialize the socket

	if (((socket_handler = socket(PF_INET, SOCK_DGRAM, 0)) == INVALID_SOCKET)) {
		Abort("Impossivel criar o socket");
	}

	//preencher a struct sockaddr

	memset((char*)&serv_addr, 0, sizeof(serv_addr));

	serv_addr.sin_family = AF_INET;
	serv_addr.sin_addr.s_addr = htonl(INADDR_ANY); // converter para netowr long
	serv_addr.sin_port = htons(SERVER_PORT);


	//Registar a porta do servidor

	if ((bind(socket_handler, (struct sockaddr*)&serv_addr, sizeof(serv_addr))) == SOCKET_ERROR)
	{
		Abort("Nao foi possivel registar a porta do servidor");
	}


	while (1)
	{
		fprintf(stdout, "\nServer - A espera dos datagrams\n");

		//REGISTAR O CLIENTE 1

		cli1_len = sizeof(cli_addr_1);
		nbytes = recvfrom(socket_handler, cl1_buffer, sizeof(cl1_buffer), 0, (struct sockaddr*)&cli_addr_1, &cli1_len);

		cl1_buffer[nbytes] = '\0';
		fprintf(stdout, "\nCliente 1 registado\nDados: \n Mensagem: %s\n IP: %s \n PORT: %d\n", cl1_buffer, inet_ntoa(cli_addr_1.sin_addr), ntohs(cli_addr_1.sin_port));

		//REGISTAR O CLIENTE 2

		cli2_len = sizeof(cli_addr_2);
		nbytes = recvfrom(socket_handler, cl2_buffer, sizeof(cl2_buffer), 0, (struct sockaddr*)&cli_addr_2, &cli2_len);

		cl2_buffer[nbytes] = '\0';
		fprintf(stdout, "\nCliente 2 registado\nDados: Mensagem: %s\n IP: %s \n PORT: %d\n", cl2_buffer, inet_ntoa(cli_addr_2.sin_addr), ntohs(cli_addr_2.sin_port));


		//Remeter o endereço de c1 a c2 através de uma struct sockaddr_in

		if (sendto(socket_handler, (char*)&cli_addr_1, sizeof(cli_addr_1), 0, (struct sockaddr *)&cli_addr_2, sizeof(cli_addr_2)) == SOCKET_ERROR) {
			Abort("Erro no envio da estrutura");
		}
	}

	closesocket(socket_handler);

}




void Abort(char * s)
{
	fprintf(stderr, "\n[ERRO] - msg: %s - %d\n", s, WSAGetLastError());
	exit(1);
}


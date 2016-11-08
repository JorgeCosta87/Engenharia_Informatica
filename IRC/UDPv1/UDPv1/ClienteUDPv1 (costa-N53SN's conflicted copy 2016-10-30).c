/*=========================== Cliente basico UDP ===============================
Este cliente destina-se a enviar mensagens passadas na linha de comando, sob
a forma de um argumento, para um servidor especifico cuja locacao e' dada
pelas seguintes constantes: SERV_HOST_ADDR (endereco IP) e SERV_UDP_PORT (porto)

O protocolo usado e' o UDP.
==============================================================================*/
#define _CRT_SECURE_NO_WARNINGS

#include <winsock.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define SERV_HOST_ADDR "127.0.0.1"
#define SERV_UDP_PORT  6000

#define BUFFERSIZE     4096

void Abort(char *msg);

/*________________________________ main _______________________________________
*/

int main(int argc, char *argv[])
{

	char ip[18];
	int port, msg;

	SOCKET sockfd;
	int msg_len, iResult, nbytes, info_len;
	struct sockaddr_in serv_addr, info_sock;
	char buffer[BUFFERSIZE];
	WSADATA wsaData;





	/*========================= TESTA A SINTAXE =========================*/

	if (argc != 7) {
		fprintf(stderr, "Sintaxe: %s -msg -ip -port\n", argv[0]);
		exit(EXIT_FAILURE);
	}


	for (int i = 1; i < argc; i++) {

		if (strcmp(argv[i], "-ip") == 0)
		{
			strcpy(ip, argv[i + 1]);
		}
		else if (strcmp(argv[i], "-msg") == 0)
		{
			msg = i + 1;
		}
		else if (strcmp(argv[i], "-port") == 0)
		{
			port = atoi(argv[i + 1]);
		}
	}

	/*=============== INICIA OS WINSOCKS ==============*/

	iResult = WSAStartup(MAKEWORD(2, 2), &wsaData);
	if (iResult != 0) {
		printf("WSAStartup failed: %d\n", iResult);
		getchar();
		exit(1);
	}

	/*=============== CRIA SOCKET PARA ENVIO/RECEPCAO DE DATAGRAMAS ==============*/

	sockfd = socket(PF_INET, SOCK_DGRAM, 0);
	if (sockfd == INVALID_SOCKET)
		Abort("Impossibilidade de criar socket");

	/*================= PREENCHE ENDERECO DO SERVIDOR ====================*/

	memset((char*)&serv_addr, 0, sizeof(serv_addr)); /*Coloca a zero todos os bytes*/
	serv_addr.sin_family = AF_INET; /*Address Family: Internet*/
	serv_addr.sin_addr.s_addr = inet_addr(ip); /*IP no formato "dotted decimal" => 32 bits*/
	serv_addr.sin_port = htons(port); /*Host TO Netowork Short*/

									  /*====================== ENVIA MENSAGEM AO SERVIDOR ==================*/

	msg_len = sizeof(argv[msg]);

	if (sendto(sockfd, argv[msg], msg_len, 0, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) == SOCKET_ERROR)
		Abort("SO nao conseguiu aceitar o datagram");

	printf("<CLI1>Mensagem enviada ...\n");

	info_len = sizeof(info_sock);
	getsockname(sockfd, (struct sockaddr*)&info_sock, &info_len);

	printf("Porto local: %d", ntohs(info_sock.sin_port));

	nbytes = recvfrom(sockfd, buffer, sizeof(buffer), 0, NULL, NULL);

	if (nbytes == SOCKET_ERROR)
		Abort("Erro na recepcao de datagrams");

	buffer[nbytes] = '\0'; /*Termina a cadeia de caracteres recebidos com '\0'*/

	printf("\n<CLi1>Mensagem recebida {%s}\n", buffer);

	/*========================= FECHA O SOCKET ===========================*/

	closesocket(sockfd);

	printf("\n");
	exit(EXIT_SUCCESS);
}

/*________________________________ Abort________________________________________
Mostra uma mensagem de erro e o c�digo associado ao ultimo erro com Winsocks.
Termina a aplicacao com "exit status" a 1 (constante EXIT_FAILURE)
________________________________________________________________________________*/

void Abort(char *msg)
{

	fprintf(stderr, "<CLI1>Erro fatal: <%s> (%d)\n", msg, WSAGetLastError());
	exit(EXIT_FAILURE);

}

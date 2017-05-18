#include <windows.h>
#include <tchar.h>
#include <io.h>
#include <fcntl.h>
#include <stdio.h>

#define PIPE_NAME TEXT("\\\\.\\pipe\\teste")
#define PIPE_NAME2 TEXT("\\\\.\\pipe\\CLIENTESERVIDOR")
#define N_MAX_LEITORES 3
#define TAM 256

HANDLE PipeLeitores[N_MAX_LEITORES];
int total=0;
BOOL fim = FALSE;

DWORD WINAPI RecebeLeitores(LPVOID param);
DWORD WINAPI AtendeCliente(LPVOID p);
void DifundeMensagem(TCHAR *msg);

int _tmain(int argc, LPTSTR argv[]){
	DWORD n=0;
	HANDLE hThread;
	TCHAR buf[TAM];

#ifdef UNICODE 
	_setmode(_fileno(stdin), _O_WTEXT);
	_setmode(_fileno(stdout), _O_WTEXT);
	_setmode(_fileno(stderr), _O_WTEXT);
#endif
	for (int i = 0; i < N_MAX_LEITORES; i++)
		PipeLeitores[i] = INVALID_HANDLE_VALUE;
	//Invocar a thread que inscreve novos leitores
	hThread=CreateThread(NULL,0,(LPTHREAD_START_ROUTINE)
		RecebeLeitores,NULL,0,NULL);

	do{
		_tprintf(TEXT("[ESCRITOR] Frase: "));
		_fgetts(buf, 256, stdin);
		//Escrever para todos os leitores inscritos
		DifundeMensagem(buf);
		_tprintf(TEXT("[ESCRITOR] Enviei %d bytes aos %d leitores... (WriteFile)\n"),
			n, total);
	} while (_tcsncmp(buf, TEXT("fim"), 3));
	fim = TRUE;
	
	//Esperar a thread recebeLeitores terminar
	WaitForSingleObject(hThread, INFINITE);
	CloseHandle(hThread);
	exit(0);
}
DWORD WINAPI AtendeCliente(LPVOID p) {
//recebe por parâmetro o pipe que vem do Cliente
	HANDLE pipe = (HANDLE)p;
	TCHAR buf[TAM]; DWORD n_lidos;
	do {
		//_tprintf(TEXT("[ESCRITOR] Frase: "));
		//_fgetts(buf, 256, stdin);
		ReadFile(pipe, buf, TAM, &n_lidos, NULL);
		if (n_lidos == 0) { //Cliente terminou			
			break;
		}
		buf[n_lidos / sizeof(TCHAR)] = '\0';
		DifundeMensagem(buf);
		_tprintf(TEXT("[ESCRITOR] Enviei %d bytes aos %d leitores... (WriteFile)\n"),
			n_lidos, total);
	} while (_tcsncmp(buf, TEXT("fim"), 3));
	DisconnectNamedPipe(pipe);
	CloseHandle(pipe);	
	return 0;
}

DWORD WINAPI RecebeLeitores(LPVOID param){
	HANDLE hPipe1, hPipe2;
	while (!fim){
		if (total < N_MAX_LEITORES) {
			_tprintf(TEXT("[ESCRITOR] Vou passar à criação de uma cópia do pipe '%s'... (CreateNamedPipe)\n"),
				PIPE_NAME);
			hPipe1 = CreateNamedPipe(PIPE_NAME, PIPE_ACCESS_OUTBOUND,
				PIPE_WAIT | PIPE_TYPE_MESSAGE
				| PIPE_READMODE_MESSAGE, PIPE_UNLIMITED_INSTANCES, TAM * sizeof(TCHAR),
				TAM * sizeof(TCHAR),
				1000, NULL);
			if (hPipe1 == INVALID_HANDLE_VALUE) {
				_tperror(TEXT("Erro na ligação ao leitor!"));
				exit(-1);
			}
			hPipe2 = CreateNamedPipe(PIPE_NAME2, PIPE_ACCESS_INBOUND,
				PIPE_WAIT | PIPE_TYPE_MESSAGE
				| PIPE_READMODE_MESSAGE, N_MAX_LEITORES, TAM * sizeof(TCHAR),
				TAM * sizeof(TCHAR),
				1000, NULL);
			if (hPipe2 == INVALID_HANDLE_VALUE) {
				_tperror(TEXT("Erro na ligação ao leitor!"));
				exit(-1);
			}
			_tprintf(TEXT("[ESCRITOR] Esperar ligação de um leitor... (ConnectNamedPipe)\n"));
			ConnectNamedPipe(hPipe1, NULL); //Fica aqui à espera mesmo que já seja FIM=true
				
			CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)AtendeCliente, (LPVOID)hPipe2,
				0, NULL);
			//Procurar  vaga dentro dentro do array
			for (int i = 0; i < N_MAX_LEITORES; i++) {
				if (PipeLeitores[i] == INVALID_HANDLE_VALUE) {
					PipeLeitores[i] = hPipe1;
					break;
				}
			}
			total++;
		}
		else //o que fazer?
			Sleep(1000);
	}
	for (int i = 0; i < total; i++){
		DisconnectNamedPipe(PipeLeitores[i]);
		_tprintf(TEXT("[ESCRITOR] Vou desligar o pipe... (CloseHandle)\n"));
		CloseHandle(PipeLeitores[i]);
	}
	return 0;
}

void DifundeMensagem(TCHAR *buf) {
	DWORD n;
	for (int i = 0; i < N_MAX_LEITORES; i++) {
		//Ainda deve ser melhorado, ver exemplo do escritor
		if (PipeLeitores[i] != INVALID_HANDLE_VALUE)
			if (!WriteFile(PipeLeitores[i], buf, _tcslen(buf)*sizeof(TCHAR),
				&n, NULL)) {
				DisconnectNamedPipe(PipeLeitores[i]);
				CloseHandle(PipeLeitores[i]);
				total--;
				PipeLeitores[i] = INVALID_HANDLE_VALUE;
			}		
	}


}
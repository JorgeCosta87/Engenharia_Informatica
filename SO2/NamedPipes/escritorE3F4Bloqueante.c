#include <windows.h>
#include <tchar.h>
#include <io.h>
#include <fcntl.h>
#include <stdio.h>

#define PIPE_NAME TEXT("\\\\.\\pipe\\teste")
#define N_MAX_LEITORES 3
#define TAM 256

HANDLE PipeLeitores[N_MAX_LEITORES];
int total=0;
BOOL Fim = FALSE;

DWORD WINAPI RecebeLeitores(LPVOID param);

int _tmain(int argc, LPTSTR argv[]){
	DWORD n=0, erro;
	HANDLE hThread;
	TCHAR buf[TAM];

	for (int i = 0; i < N_MAX_LEITORES; i++)
		PipeLeitores[i] = INVALID_HANDLE_VALUE;
#ifdef UNICODE 
	_setmode(_fileno(stdin), _O_WTEXT);
	_setmode(_fileno(stdout), _O_WTEXT);
	_setmode(_fileno(stderr), _O_WTEXT);
#endif
	//Invocar a thread que inscreve novos leitores
	hThread=CreateThread(NULL,0,(LPTHREAD_START_ROUTINE)RecebeLeitores,NULL,0,NULL);
	do{
		_tprintf(TEXT("[ESCRITOR] Frase: "));
		_fgetts(buf, 256, stdin);
		//Escrever para todos os leitores inscritos
		for (int i = 0; i < N_MAX_LEITORES; i++) {
			if(PipeLeitores[i] != INVALID_HANDLE_VALUE)
				if(WriteFile(PipeLeitores[i], buf, _tcslen(buf)*sizeof(TCHAR), &n, NULL) == 0){					
					DisconnectNamedPipe(PipeLeitores[i]);
					CloseHandle(PipeLeitores[i]);
					PipeLeitores[i] = INVALID_HANDLE_VALUE;			
					total--;					
				}
		}
		_tprintf(TEXT("[ESCRITOR] Enviei %d bytes aos %d leitores... (WriteFile)\n"), n, total);
	} while (_tcsncmp(buf, TEXT("fim"), 3));
	Fim = TRUE;	
	
	//Esperar a thread recebeLeitores terminar
	WaitForSingleObject(hThread, INFINITE);
	CloseHandle(hThread);
	exit(0);
}

DWORD WINAPI RecebeLeitores(LPVOID param){	
	
	HANDLE pipe;
	
	while (!Fim) {
		if (total < N_MAX_LEITORES) {
			_tprintf(TEXT("[ESCRITOR] Vou passar à criação de uma cópia do pipe '%s' ... (CreateNamedPipe)\n"), PIPE_NAME);
			pipe = CreateNamedPipe(PIPE_NAME, PIPE_ACCESS_OUTBOUND, PIPE_WAIT | PIPE_TYPE_MESSAGE
				| PIPE_READMODE_MESSAGE, N_MAX_LEITORES, TAM * sizeof(TCHAR), TAM * sizeof(TCHAR),
				1000, NULL);
			if (pipe == INVALID_HANDLE_VALUE) {
				_tperror(TEXT("Erro na ligação ao leitor!"));
				continue;
			}
			_tprintf(TEXT("[ESCRITOR] Esperar ligação de um leitor... (ConnectNamedPipe)\n"));
			ConnectNamedPipe(pipe, NULL);
				
			if (Fim)
				break;
			//Ir à procura de uma posição livre
			for (int i = 0; i < N_MAX_LEITORES; i++)
				if (PipeLeitores[i] == INVALID_HANDLE_VALUE) {
					PipeLeitores[i] = pipe;
					break;
				}
			
			total++;
			
		}
		else
			Sleep(2000);
	}
	for (int i = 0; i < N_MAX_LEITORES; i++){
		DisconnectNamedPipe(PipeLeitores[i]);
		_tprintf(TEXT("[ESCRITOR] Vou desligar o pipe... (CloseHandle)\n"));
		CloseHandle(PipeLeitores[i]);
	}
	return 0;
}
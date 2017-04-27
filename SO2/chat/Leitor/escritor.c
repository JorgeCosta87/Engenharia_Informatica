#include <windows.h>
#include <tchar.h>
#include <fcntl.h>
#include <io.h>
#include <stdlib.h>
#include <stdio.h>


#define PIPE_NAME TEXT("\\\\.\\pipe\\teste")
#define N 5

DWORD WINAPI RecebeLeitores(LPVOID p);

HANDLE hPipe[N];
int total = 0;

int _tmain(int argc, LPTSTR argv[]) {
	DWORD n;
	TCHAR buf[256];

#ifdef UNICODE
	_setmode(_fileno(stdin), _O_WTEXT);
	_setmode(_fileno(stdout), _O_WTEXT);
#endif

	for (int i = 0; i < N; i++)
	{
		hPipe[i] = INVALID_HANDLE_VALUE;
	}

	CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)RecebeLeitores, NULL, 0, NULL);
	
	do {
		_tprintf(TEXT("[ESCRITOR] Frase: "));
		_fgetts(buf, 256, stdin);

		for (int i = 0; i < total; i++)
		{
			if (hPipe[i] != INVALID_HANDLE_VALUE){
				if (!WriteFile(hPipe[i], buf, _tcslen(buf) * sizeof(TCHAR), &n, NULL)) {
					_tprintf(TEXT("[ERRO] Escrever no pipe... (WriteFile)\n"));
					_tprintf(TEXT("[ESCRITOR]Vou desligar o pipe(DisconnectNamedPipe/CloseHandle)\n"));
					if (!DisconnectNamedPipe(hPipe)) {
						_tprintf(TEXT("Erro ao desligar o pipe!"));
						exit(-1);
					}
					_tprintf(TEXT("[ESCRITOR] Vou desligar o pipe... (CloseHandle)\n"));
					CloseHandle(hPipe);
					hPipe[i] = INVALID_HANDLE_VALUE;
				}
			}
			_tprintf(TEXT("[ESCRITOR] Enviei %d bytes ao leitores... (WriteFile)\n"), n);
		}


	} while (_tcsncmp(buf, TEXT("fim"),3));


	exit(0);
}

DWORD WINAPI RecebeLeitores(LPVOID p) {

	int indice = -1;
	TCHAR buf[256];

	_tprintf(TEXT("[ESCRITOR] Vou passar à criação de uma cópia do pipe '%s' ... (CreateNamedPipe)\n"), PIPE_NAME);
	while(1)
	{
		for (int i = 0; i < N; i++)
		{
			if (hPipe[i] == INVALID_HANDLE_VALUE)
				indice = i;

			if (indice != -1)
			{
				hPipe[i] = CreateNamedPipe(PIPE_NAME, PIPE_ACCESS_OUTBOUND, PIPE_WAIT | PIPE_TYPE_MESSAGE
					| PIPE_READMODE_MESSAGE, 5, sizeof(buf), sizeof(buf), 1000, NULL);
				if (hPipe[i] == INVALID_HANDLE_VALUE) {
					_tprintf(TEXT("Erro na ligação ao leitor!"));
					exit(-1);
				}

				_tprintf(TEXT("[ESCRITOR] Esperar ligação de um leitor... (ConnectNamedPipe)\n"));
				if (!ConnectNamedPipe(hPipe[i], NULL)) {
					_tprintf(TEXT("Erro na ligação ao leitor!"));
					exit(-1);
				}
				total++;
			}
			else
			{
				Sleep(1000);
			}
		}
	}
}
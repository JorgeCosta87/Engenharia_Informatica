#include <windows.h>
#include <tchar.h>
#include <io.h>
#include <fcntl.h>
#include <stdio.h>


#define PIPE_NAME TEXT("\\\\.\\pipe\\teste")
#define PIPE_NAME2 TEXT("\\\\.\\pipe\\CLIENTESERVIDOR")
#define TAM 256
DWORD WINAPI MandaServidor(LPVOID p) {
	HANDLE hPipe = (HANDLE)p;
	DWORD n; TCHAR buf[TAM];
	do {
		_tprintf(TEXT("[ESCRITOR] Frase: "));
		_fgetts(buf, 256, stdin);
		//Escrever para servidor
		WriteFile(hPipe, buf, _tcslen(buf)*sizeof(TCHAR),
				&n, NULL);
			//	_tperror(TEXT("[ERRO] Escrever no pipe... (WriteFile)\n"));
			//	exit(-1);
			//}
		_tprintf(TEXT("[Cliente] Enviei %d bytes ao servidor... (WriteFile)\n"),
			n);
	} while (_tcsncmp(buf, TEXT("fim"), 3));
	CloseHandle(hPipe);
	return 0;
}
int _tmain(int argc, LPTSTR argv[]){
	TCHAR buf[256];
	HANDLE hPipe, hPipe2;
	int i = 0;
	BOOL ret;
	DWORD n, modo;
#ifdef UNICODE 
	_setmode(_fileno(stdin), _O_WTEXT);
	_setmode(_fileno(stdout), _O_WTEXT);
#endif

	_tprintf(TEXT("[LEITOR]Esperar pelo pipe '%s'(WaitNamedPipe)\n"), PIPE_NAME);
	if (!WaitNamedPipe(PIPE_NAME, NMPWAIT_WAIT_FOREVER)) {
		_tprintf(TEXT("[ERRO] Ligar ao pipe '%s'... (WaitNamedPipe)\n"), PIPE_NAME);
		exit(-1);
	}

	_tprintf(TEXT("[LEITOR] Ligação ao escritor... (CreateFile)\n"));
	hPipe = CreateFile(PIPE_NAME, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
	if (hPipe == INVALID_HANDLE_VALUE) {
		_tprintf(TEXT("[ERRO] Ligar ao pipe '%s'... (CreateFile)\n"), PIPE_NAME);
		exit(-1);
	}
	hPipe2 = CreateFile(PIPE_NAME2, GENERIC_WRITE, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
	if (hPipe2 == INVALID_HANDLE_VALUE) {
		_tprintf(TEXT("[ERRO] Ligar ao pipe '%s'... (CreateFile)\n"), PIPE_NAME);
		exit(-1);
	}
	//Lançar thread para ler da consola e escrever para servidor
	CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)MandaServidor, (LPVOID)hPipe2, 0, NULL);
	
	_tprintf(TEXT("[LEITOR]Liguei-me...\n"));
	while (1) {
		ret = ReadFile(hPipe, buf, sizeof(buf), &n, NULL);
		buf[n / sizeof(TCHAR)] = '\0';
		if (!ret || !n)
			break;
		_tprintf(TEXT("[LEITOR] Recebi %d bytes: '%s'... (ReadFile)\n"), n, buf);
	}
	CloseHandle(hPipe);

	Sleep(200);
	return 0;
}

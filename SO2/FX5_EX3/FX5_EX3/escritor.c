//Escritor.c
#include <windows.h>
#include <tchar.h>
#include <stdio.h>
#define BufferSize 100
#define Buffers 10
TCHAR NomeMemoria[] = TEXT("Nome da Mem�ria Partilhada");
TCHAR(*PtrMemoria)[Buffers][BufferSize];
TCHAR *NomeSemaforoPodeEscrever = { TEXT("Sem�foro Pode Escrever") };
TCHAR *NomeSemaforoPodeLer = { TEXT("Sem�foro Pode Ler") };
HANDLE PodeEscrever;
HANDLE PodeLer;
HANDLE hMemoria;
int _tmain(void)
{


	HANDLE mapInfo;

	mapInfo = CreateFile(TEXT("backup.txt"), GENERIC_READ | GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);


	PodeEscrever = CreateSemaphore(NULL, Buffers, Buffers, NomeSemaforoPodeEscrever);
	PodeLer = CreateSemaphore(NULL, 0, Buffers, NomeSemaforoPodeLer);
	hMemoria = CreateFileMapping(mapInfo, NULL, PAGE_READWRITE, 0
		, sizeof(TCHAR[Buffers][BufferSize]), NomeMemoria);
	if (PodeEscrever == NULL || PodeLer == NULL || hMemoria == NULL) {
		_tprintf(TEXT("[Erro]Cria��o de objectos do Windows(%d)\n"), GetLastError());
		return -1;
	}
	PtrMemoria = (TCHAR(*)[Buffers][BufferSize])MapViewOfFile(hMemoria
		, FILE_MAP_WRITE, 0, 0, sizeof(TCHAR[Buffers][BufferSize]));
	if (PtrMemoria == NULL) {
		_tprintf(TEXT("[Erro]Mapeamento da mem�ria partilhada(%d)\n"), GetLastError());
		return -1;
	}
	for (int i = 0; i < 100; i++)
	{
		WaitForSingleObject(PodeEscrever, INFINITE);
		_tprintf(TEXT("Escrever para buffer %i\n"), i);
		_stprintf_s((*PtrMemoria)[i%Buffers], BufferSize, TEXT("Escritor-%i\n"), i);
		Sleep(1000);
		ReleaseSemaphore(PodeLer, 1, NULL);
	}
	UnmapViewOfFile(PtrMemoria);
	CloseHandle(PodeEscrever);
	CloseHandle(PodeLer);
	CloseHandle(hMemoria);
	return 0;
}
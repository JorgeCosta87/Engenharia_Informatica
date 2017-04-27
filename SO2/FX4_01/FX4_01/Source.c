#include <windows.h>
#include <tchar.h>
#include <fcntl.h>
#include <io.h>
#include <stdio.h>

#define MAX 256
#define N 20

DWORD WINAPI ThreadProdutor(LPVOID param);
DWORD WINAPI ThreadConsumidor(LPVOID param);
HANDLE hMutex, evento, semaforo;
TCHAR frase[MAX];
BOOL nova = 0;

int _tmain(int argc, LPTSTR argv[])
{
	TCHAR resp;
	DWORD threadId;
	HANDLE hThreadProd, hThreadCons[N];
	//hMutex = CreateMutex(NULL, FALSE, NULL);
	semaforo = CreateSemaphore(NULL, N, N, NULL);

#ifdef UNICODE
	_setmode(_fileno(stdin), _O_WTEXT);
	_setmode(_fileno(stdout), _O_WTEXT);
#endif

	evento = CreateEvent(NULL, TRUE, FALSE, TEXT("EVNTCH"));

	_tprintf(TEXT("Lan�ar threads produtor-consumidor?"));
	_tscanf_s(TEXT("%c"), &resp, 1);

	if (resp == 'S' || resp == 's')
	{
		hThreadProd = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)ThreadProdutor, NULL, 0, &threadId);

		if (hThreadProd != NULL)
			_tprintf(TEXT("Lancei uma thread com id %d\n"), threadId);
		else
		{
			_tprintf(TEXT("Erro ao criar Thread\n"));
			return -1;
		}

		for (int i = 0; i < N; i++)
		{
			hThreadCons[i] = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)ThreadConsumidor, NULL, 0, &threadId);

			if (hThreadCons[i] != NULL)
				_tprintf(TEXT("Lancei uma thread com id %d\n"), threadId);
			else
			{
				_tprintf(TEXT("Erro ao criar Thread\n"));
				return -1;
			}
		}

		WaitForSingleObject(hThreadProd, INFINITE);
		WaitForMultipleObjects(N, hThreadCons, TRUE, INFINITE);
	}
	_tprintf(TEXT("[Thread Principal %d]Finalmente vou terminar..."), GetCurrentThreadId());
	return 0;
}

DWORD WINAPI ThreadProdutor(LPVOID param)
{
	TCHAR strLocal[MAX];
	_tprintf(TEXT("[Produtor]Sou a thread %d e vou come�ar a trabalhar ...\n Prima\'fim\' para terminar..."), GetCurrentThreadId());

	do
	{
		_fgetts(strLocal, MAX, stdin);
		fflush(stdin);

		for (int i = 0; i < N; i++)
			WaitForSingleObject(semaforo, INFINITE);

		//WaitForSingleObject(hMutex, INFINITE);

		_tcscpy_s(frase, MAX, strLocal);

		SetEvent(evento);
		ResetEvent(evento);
		//ReleaseMutex(hMutex);
		ReleaseSemaphore(semaforo, N, NULL);
	} while (_tcsncmp(strLocal, TEXT("fim"), 3));
	return 0;
}

DWORD WINAPI ThreadConsumidor(LPVOID param)
{
	TCHAR strLocal[MAX];
	_tprintf(TEXT("[Consumidor]Sou a thread %d e vou come�ar a trabalhar ...\nPrima \'fim\' para terminar..."), GetCurrentThreadId());
	do
	{
		WaitForSingleObject(evento, INFINITE);
		//WaitForSingleObject(hMutex, INFINITE);
		WaitForSingleObject(semaforo, INFINITE);

		_tcscpy_s(strLocal, MAX, frase);
		_tprintf(TEXT("[Consumidor-%d]: %s"), GetCurrentThreadId(), strLocal);

		//ReleaseMutex(hMutex);
		ReleaseSemaphore(semaforo, N, NULL);
	} while (_tcsncmp(strLocal, TEXT("fim"), 3));
	return 0;
}
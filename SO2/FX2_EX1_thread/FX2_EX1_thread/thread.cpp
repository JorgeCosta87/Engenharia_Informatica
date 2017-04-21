//includes do exercício anterior…
#include <time.h>
#include <Windows.h>
#include <io.h>
#include <time.h>
#include <tchar.h>
#include <stdio.h>
#include <fcntl.h>


#define LIM 10000
#define TAM 5

typedef struct {
	COORD c;
	int id;
}parametro;


HANDLE mutexOcupado;
DWORD WINAPI Thread(LPVOID param);
void gotoxy(int x, int y);




int _tmain(int argc, LPTSTR argv[]) {
	TCHAR resp, c;
	int y;
	COORD v;
	DWORD threadId[TAM]; //Id da thread a ser criada
	HANDLE hT[TAM]; //HANDLE/ponteiro para a thread a ser criada
	PROCESS_INFORMATION pi;
	STARTUPINFO si = { 0 };
	si.cb = sizeof(STARTUPINFO);

	SYSTEMTIME instantei, instantef, inst_diff;;
	FILETIME fti, ftf, ftd;
	ULARGE_INTEGER ui, uf, udiff;
	
#ifdef UNICODE
	_setmode(_fileno(stdin), _O_WTEXT);
	_setmode(_fileno(stdout), _O_WTEXT);
#endif


	mutexOcupado = CreateMutex(NULL, FALSE, TEXT("Meu Mutex")); //usando um nome para o mutex, quando é usado o createMutex pela primeira vez é criado,
																//na segunda vez é aberto (noutro processos)
	if (argc == 1)
	{
		TCHAR executavel[1024];
		_tcscpy_s(executavel, 1024, argv[0]);

		_tprintf(TEXT("\npath: %s\n"), executavel);

		_tcscat_s(executavel, 1024, TEXT(" _1"));
		if (CreateProcess(NULL, executavel, NULL, NULL, 0, 0, NULL, NULL, &si, &pi) == 0)
		{
			_tprintf(TEXT("[ERROR]: creating processing, %d"), GetLastError());
		}
	}
	else
		Sleep(1000);



	GetLocalTime(&instantei);
	srand((int)time(NULL));
	//_tprintf(TEXT("Lançar thread (S/N)?"));
	//_tscanf_s(TEXT("%c"), &resp, 1);
	parametro passar;

	//if (resp == 'S' || resp == 's') {

		for (int i = 0; i < TAM; i++)
		{
			passar.c.X = rand() % 40;
			passar.c.Y = rand() % 40;
			passar.id = i;
 			hT[i] = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)Thread, (LPVOID)&passar, 0, &threadId[i]);
			if (hT[i] != NULL) {
				//_tprintf(TEXT("Lancei uma thread com id %d\n"), threadId);
				Sleep(200);
			}
			else
				_tprintf(TEXT("Erro ao criar Thread\n"));
		}
	//}
	SetThreadPriority(hT[0], THREAD_PRIORITY_LOWEST);
	
	/*
	do {
		
		_tprintf(TEXT("Suspende or Resume: \n"));
		fflush(stdin);
		_tscanf_s(TEXT("%c"), &c, 1);
		_tprintf(TEXT("************ %c *************\n", c));

	
		for (int i = 0; i < TAM; i++)
			{	
				if (c == 's')
					 SuspendThread(hT[i]);
				else 
					 ResumeThread(hT[i]);
			}

		}while (c != 'f' && c != 'F');
	
	*/


	WaitForMultipleObjects(TAM, hT, TRUE, INFINITE);

	GetSystemTime(&instantef);

	SystemTimeToFileTime(&instantef, &ftf);
	_tprintf(TEXT("\nEND: %02d : %02d : %02d : %02d\n"), instantef.wHour, instantef.wMinute, instantef.wSecond, instantei.wMilliseconds);

	ui.HighPart = fti.dwHighDateTime;
	ui.LowPart = fti.dwLowDateTime;

	uf.HighPart = ftf.dwHighDateTime;
	uf.LowPart = ftf.dwLowDateTime;

	udiff.QuadPart = uf.QuadPart - ui.QuadPart;
	ftd.dwHighDateTime = udiff.HighPart;
	ftd.dwLowDateTime = udiff.LowPart;

	FileTimeToSystemTime(&ftd, &inst_diff);

	_tprintf(TEXT("DIFF: %02d : %02d : %02d : %02d \n"), inst_diff.wHour, inst_diff.wMinute, inst_diff.wSecond, instantei.wMilliseconds);


	_tprintf(TEXT("[Thread Principal %d]Vou terminar...\n"), GetCurrentThreadId());
	return 0;
}

/* ----------------------------------------------------- */
/* "Thread" - Funcao associada à Thread */
/* ----------------------------------------------------- */

DWORD WINAPI Thread(LPVOID param) {
	int i;
	parametro  v = (*(parametro*)param);
	//_tprintf(TEXT("\n[Thread %d]Vou começar a trabalhar\n"), GetCurrentThreadId());
	Sleep(100);
	for (i = 0; i<LIM; i++) {
		WaitForSingleObject(mutexOcupado, INFINITE);

		gotoxy(v.c.X, v.c.Y);
		_tprintf(TEXT("\n[%d] ProcessId: %d Thread %5d "),v.id,GetCurrentProcessId(), i);
		ReleaseMutex(mutexOcupado);
	}
	return 0;
}
void gotoxy(int x, int y) {
	static HANDLE hStdout = NULL;
	COORD coord;
	coord.X = x;
	coord.Y = y;
	if (!hStdout)
		hStdout = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleCursorPosition(hStdout, coord);
}
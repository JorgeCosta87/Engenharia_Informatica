#include <windows.h>
#include <tchar.h>
#include <fcntl.h>
#include <io.h>
#include <stdio.h>
#define MAX 256
int _tmain(int argc, LPTSTR argv[]) {
	TCHAR executavel[MAX], resp;
	PROCESS_INFORMATION pi;
	STARTUPINFO si;
	//UNICODE: Por defeito, a consola Windows não processe caracteres wide.
	//A maneira mais fácil para ter esta funcionalidade é chamar _setmode:
#ifdef UNICODE
	_setmode(_fileno(stdin), _O_WTEXT);
	_setmode(_fileno(stdout), _O_WTEXT);
#endif
	_tprintf(TEXT("Lançar outra aplicação igual a mim (S/N)?"));
	_tscanf_s(TEXT("%c"), &resp, 1);
	if (resp == 'S' || resp == 's') {


		ZeroMemory(&si, sizeof(STARTUPINFO));//É equivalente preencher com 0s
		si.cb = sizeof(STARTUPINFO);
		si.lpTitle = TEXT("new proc");
		si.dwX = 0;
		si.dwY = 0;
		si.dwXSize = 50;
		si.dwYSize = 500;
		//so têm efeito se activar a flag
		si.dwFlags = STARTF_USEPOSITION | STARTF_USESIZE;
		

		GetModuleFileName(NULL, executavel, MAX);
		_tprintf(TEXT("Processo a ser lançado:%s\n"), executavel);

		TCHAR *nome = TEXT("notepad.exe");

		//no primeiro arguemtno podemos colocar programas que estejam nas variáveis de ammbiente
		if (CreateProcess(NULL, executavel, NULL, NULL, 0, CREATE_NEW_CONSOLE, NULL, NULL, &si, &pi))
		{
			_tprintf(TEXT("Sucesso\n"));
		
			_tprintf(TEXT("dwProcess: %d\n"), pi.dwProcessId);
			WaitForSingleObject(pi.hProcess, INFINITE);
			HANDLE h = pi.hProcess;
		
		}
		else
			_tprintf(TEXT("Erro\n"));
	}
	return 0;
}
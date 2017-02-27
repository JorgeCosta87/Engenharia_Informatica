#include <stdio.h>
#include <string.h>
#include <Windows.h>
#include <tchar.h>
#include <fcntl.h>
#include <io.h>

//Pág 34 a 36 wsp

#define MAX 256


int _tmain(int argc, LPTSTR  argv[])
{
	TCHAR c, cmdLine[MAX];

	STARTUPINFO si;
	PROCESS_INFORMATION pi;


#ifdef UNICODE
	_setmode(_fileno(stdin), _O_WTEXT);
	_setmode(_fileno(stdout), _O_WTEXT);
#endif // 


	_tprintf(TEXT("Launch a new application? (Y/N)"));
	_tscanf_s(TEXT("%c"), &c, 1);

	if (c == 'Y' || c == 'y')
	{
		ZeroMemory(&si, sizeof(STARTUPINFO));
		si.cb = sizeof(STARTUPINFO);
		GetModuleFileName(NULL, cmdLine, MAX);

		_tprintf(TEXT("Process launch: %s\n"), cmdLine);

		if (CreateProcess(NULL, cmdLine, NULL, NULL, 0, 0, NULL, NULL, &si, &pi))
			_tprintf(TEXT("Sucess\n"));
		else
			_tprintf(TEXT("Error\n"));
	}

	return 0;
}
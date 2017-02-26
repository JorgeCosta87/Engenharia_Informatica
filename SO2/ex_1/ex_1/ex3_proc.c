#include <stdio.h>
#include <string.h>
#include <Windows.h>
#include <tchar.h>
#include <fcntl.h>
#include <io.h>

//Pág 34 a 36 wsp



int _tmain(int argc, TCHAR ** argv)
{
	TCHAR str[50], cmdLine[100];

	STARTUPINFO si;
	PROCESS_INFORMATION pi;

	ZeroMemory(&si, sizeof(si));
	si.cb = sizeof(STARTUPINFO);

#ifdef UNICODE

	_setmode(_fileno(stdin), _O_WTEXT);
	_setmode(_fileno(stdout), _O_WTEXT);

#endif // 

	CreateProcess(NULL, argv[0], NULL, NULL, 0, 0, NULL, NULL, &si, &pi);


	return 0;

}
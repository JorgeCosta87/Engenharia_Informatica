#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <string.h>
#include <Windows.h>
#include <tchar.h>
#include <fcntl.h>
#include <io.h>

//Pág 34 a 36 wsp


/*
int _tmain(int argc, TCHAR ** argv)
{
	TCHAR str[50];

	TCHAR str1[50] = _T("Tell me something: ");

	#ifdef UNICODE

		_setmode(_fileno(stdin), _O_WTEXT);
		_setmode(_fileno(stdout), _O_WTEXT);

	#endif // 

	_tprintf(str1);

	_fgetts(str, 50, stdin);

	_tprintf(_T("\n%s\n"), str);



	return 1;
}
*/
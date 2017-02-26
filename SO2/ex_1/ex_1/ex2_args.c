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

#ifdef UNICODE

	_setmode(_fileno(stdin), _O_WTEXT);
	_setmode(_fileno(stdout), _O_WTEXT);

#endif // 

	if (argc > 1)
		_tcscpy_s(str, 50,  argv[1]);

	else
	{
		_tprintf("Insert a text: ");
		_fgetts(str, 50, stdin);
	}

	_tprintf(_T("\n%s\n"), str);



	return 0;

}
*/
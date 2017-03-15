#include <windows.h>
#include <tchar.h>
#include <io.h>
#include <fcntl.h>
#include <stdio.h>

#define TAM 200


int _tmain(int argc, TCHAR ** argv)
{

	HKEY chave;

	DWORD queAconteceu, versao, tamanho;
	TCHAR str[TAM], autor[TAM];


	if (RegCreateKeyEx(HKEY_LOCAL_MACHINE, TEXT("SOFTWARE\\MinhaApp"),
		0, NULL, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, NULL, &chave, &queAconteceu)
		!= ERROR_SUCCESS)
	{
		_tprintf(TEXT("Erro ao abriri / criar a chave: %d\n"), GetLastError());
	}
	else
	{
		if (queAconteceu == REG_CREATED_NEW_KEY)
		{
			_tprintf(TEXT("Chave"), GetLastError());
		}
	}
	return 0;
}


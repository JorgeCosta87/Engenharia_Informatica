
#include <windows.h>
#include <tchar.h>
#include <io.h>
#include <fcntl.h>
#include <stdio.h>

#include "..\..\FX1_EX8_DLL\\FX1_EX8_DLL\dll.h"


int _tmain(int argc, TCHAR *argv[]) {
	//Usar a vari�vel da Dll
	_tprintf(TEXT("Valor da vari�vel da DLL: %d\n"), nDLL);
	//Chamar a funcao da Dll
	_tprintf(TEXT("Resultado da fun��o da UmaString DLL: %d"), UmaString());
	return 0;
}
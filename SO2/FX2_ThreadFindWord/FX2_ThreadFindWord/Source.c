#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <tchar.h>
#include <windows.h>
#include <fcntl.h>
#include <io.h>



typedef struct {

	long begin, end;
	TCHAR word[256];
	TCHAR fileName;
	int threadN;
	int count;

}treadData;

DWORD WINAPI  search(LPVOID parms)
{
	treadData * data = (treadData*)parms;

	FILE  * f;
	TCHAR linha[256];
	int countLines = 0;

	_tprintf(TEXT("\n\nBegin: %d\nend: %d\n\n"),data->begin, data->end);
	fopen_s(&f, "FactualPT.csv", "rt");

	if (f == NULL)
	{
		_tprintf(TEXT("Opening file %s\n"), data->fileName);
		perror("ERROR");
		return 1;
	}

	fseek(f, data->begin, SEEK_SET);


	while (_fgetts(linha, 256, f) != NULL && ftell(f) < data->end)
	{
		if ((_tcsstr(linha, data->word)) != NULL)
		{
			_tprintf(TEXT("ThreadId: %d - %s at byte: %d\n"),data->threadN,data->word, ftell(f));
			data->count++;
		}
	}
	
	fclose(f);
	_tprintf(TEXT("end\n"));
	return 0;
}

int _tmain(int argc, TCHAR * argv[])
{
	FILE  * fp;
	char linha[256], * aux;
	int countLines = 0;
	treadData * data;
	DWORD * threadId;
	long slot;
	HANDLE  * hThread;
	int totalWords = 0;

	FILETIME fti, ftf, ftd;
	ULARGE_INTEGER ui, uf, udiff;
	SYSTEMTIME inst_i, inst_f, inst_diff;

#ifdef UNICODE

	_setmode(_fileno(stdin), _O_WTEXT);
	_setmode(_fileno(stdout), _O_WTEXT);

#endif // 


	if (argc != 4)
	{
		_tprintf(TEXT("invalid args: -filename -word - N threads\n"));
		exit(1);
	}


	hThread = (HANDLE*)malloc(sizeof(HANDLE) * _ttoi(argv[3]));
	data = (treadData*)malloc(sizeof(treadData) * _ttoi(argv[3]));

	//_tcslen(argv[2])
	//FactualPT.csv
	fopen_s(&fp, "FactualPT.csv", "rt");

	if (fp == NULL)
	{
		_tprintf(TEXT("Opening file %s\n"), argv[1]);
		perror("ERROR");
		return 1;
	}

	fseek(fp, 0, SEEK_END);

	long fileSize = ftell(fp);
	slot = fileSize / _ttoi(argv[3]);
	fclose(fp);
	_tprintf(TEXT("Word: %s\n"), argv[2]);
	_tprintf(TEXT("N. threads: %d\n"), _ttoi(argv[3]));

	GetSystemTime(&inst_i);

	SystemTimeToFileTime(&inst_i, &fti);
	_tprintf(TEXT("%02d : %02d : %02d : %02d\n"), inst_i.wHour, inst_i.wMinute, inst_i.wSecond, inst_i.wMilliseconds);

	for (int i = 0; i < _ttoi(argv[3]) ; i++)
	{
		_tcscpy_s(data[i].word,256, argv[2]);

		data[i].begin = i * slot;
		data[i].end = data[i].begin + slot + 300;
		data[i].threadN = i + 1;
		data[i].count = 0;

		hThread[i] = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)search, (LPVOID)&data[i], 0, NULL);
	}



	WaitForMultipleObjects(_ttoi(argv[3]), hThread, TRUE, INFINITE);


	for (int i = 0; i < _ttoi(argv[3]); i++)
		totalWords += data[i].count;
	_tprintf(TEXT("Words find: %d\n"), totalWords);


	GetSystemTime(&inst_f);
	SystemTimeToFileTime(&inst_f, &ftf);
	_tprintf(TEXT("\nEND: %02d : %02d : %02d : %02d\n"), inst_f.wHour, inst_f.wMinute, inst_f.wSecond, inst_i.wMilliseconds);

	ui.HighPart = fti.dwHighDateTime;
	ui.LowPart = fti.dwLowDateTime;

	uf.HighPart = ftf.dwHighDateTime;
	uf.LowPart = ftf.dwLowDateTime;

	udiff.QuadPart = uf.QuadPart - ui.QuadPart;
	ftd.dwHighDateTime = udiff.HighPart;
	ftd.dwLowDateTime = udiff.LowPart;

	FileTimeToSystemTime(&ftd, &inst_diff);

	_tprintf(TEXT("DIFF: %02d : %02d : %02d : %02d \n"), inst_diff.wHour, inst_diff.wMinute, inst_diff.wSecond, inst_i.wMilliseconds);


	return 0;

}
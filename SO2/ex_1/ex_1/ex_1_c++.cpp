#include <iostream>
#include <string>
#include <windows.h>
#include <tchar.h>

using namespace std;

int _tmain(int argc , TCHAR ** argv)
{
#ifdef UNICODE
	#define tstring wstring
	#define tcout	wcout
	#define tcin	wcin
#else
	#define tstring string
	#define	tcout	cout
	#define tcin	cin
#endif // UNICODE

	tstring str = TEXT("Give me something: ");
	
	tcout << str;

	getline(tcin,  str);

	tcout << str << endl;


	return 0;
}
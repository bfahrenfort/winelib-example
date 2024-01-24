#include <windows.h>
// #include <win_dll.h>
#include <string.h>

__stdcall int WINAPI returnString(char* str)
{
  strcpy(str, "a string from Windows");
  return 0;
}

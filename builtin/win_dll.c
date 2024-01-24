#include <windef.h>
#include <lin_dll.h>

int WINAPI proxy_returnString(char* str)
{
  returnString(str);
  return 0;
}

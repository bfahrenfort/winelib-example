#include <string.h>
#include <lin_dll.h>

#define EXPORT

int returnString(char* str)
{
  strcpy(str, "a string from Lindll");
  return 0;
}


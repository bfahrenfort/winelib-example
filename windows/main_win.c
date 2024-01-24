#include <stdio.h>
#include <windows.h>

int main() {
  HINSTANCE DllHandle;
  char fromDLL[255];
  typedef int(__stdcall *dllFunc)(char * const);
  DllHandle = LoadLibrary("win_dll.dll.so");
  dllFunc fp = (dllFunc)GetProcAddress(DllHandle, "returnString");
  fp(fromDLL);
  printf("%s\n", fromDLL);
  FreeLibrary(DllHandle);
}

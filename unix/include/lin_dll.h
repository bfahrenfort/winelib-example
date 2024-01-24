#ifndef LIN_DLL_H
#define LIN_DLL_H

#ifdef EXPORT
#define ATTR __attribute__((visibility("default")))
#else
#define ATTR
#endif

int ATTR returnString(char *str);
#endif

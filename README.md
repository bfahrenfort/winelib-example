# The WineLib Simple Example

I hacked together a simple Winelib dll and makefile to show how overrides work.

## Requirements
`winegcc`, `wine`, `make`

## Running
`make test_native` will use wine for the program's intended behavior. 

Now imagine that the `win_dll.dll.so` doesn't work so well in Wine, and we want to use functions from the Linux build `liblin_dll.so` instead. Run `make test_builtin` to have wine override calls to `win_dll` to the "builtin" (overriding) library, which was linked to `lin_dll`.

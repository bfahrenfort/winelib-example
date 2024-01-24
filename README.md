# The WineLib Simple Example

I hacked together a simple Winelib dll and makefile to show how overrides work.

Everything here is taken from the [Winelib tutorial](https://wiki.winehq.org/Winelib_User's_Guide), I just couldn't finagle `winebuilder` to work the way I wanted it to so instead chose violence.

## Requirements
`winegcc`, `wine`, `make`

## Running
We have a Windows program called `main_win.exe`. It dynamically loads `win_dll.dll.so` to call a function.

`make test_native` will use wine for the program's intended behavior. 

Now imagine that the `win_dll.dll.so` doesn't work so well in Wine, and we want to use functions from the Linux build `liblin_dll.so` instead. Run `make test_builtin` to have wine override calls to `win_dll` to the "builtin" (overriding) library, which was linked to `lin_dll`.

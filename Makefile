all: win_dll.dll.so builtin_dll.dll.so main_win.exe

lin_dll.so:
	pushd unix && gcc -shared -o liblin_dll.so lin_dll.c -Iinclude && popd

win_dll.dll.so: 
	pushd windows && winegcc -shared -o win_dll win_dll.c win_dll.spec && popd

main_win.exe: win_dll.dll.so
	pushd windows && winegcc -o main_win main_win.c && popd

builtin_dll.dll.so: lin_dll.so
	pushd builtin && \
		winegcc -shared -o win_dll win_dll.c win_dll.spec -L../unix -llin_dll -I../unix/include \
	&& popd

test_native: main_win.exe
	rm -rf build && mkdir build && pushd build && \
		cp ../windows/main_win.* ./ && cp ../windows/win_dll.dll.so ./ && \
		wine main_win.exe \
	&& popd
	
test_builtin: main_win.exe builtin_dll.dll.so
	rm -rf build && mkdir build && pushd build && \
		cp ../windows/main_win.* ./ && cp ../builtin/win_dll.dll.so ./ && \
		rm -rf lib && mkdir lib && cp ../unix/liblin_dll.so lib/ && \
		LD_LIBRARY_PATH="$$PWD/lib:$$LD_LIBRARY_PATH" WINEDLLOVERRIDES="win_dll=b" wine main_win.exe \
	&& popd

clean:
	rm -rf build && \
	rm windows/win_dll.dll.so && \
	rm builtin/win_dll.dll.so && \
	rm unix/liblin_dll.so && \
	rm windows/main_win.exe && rm windows/main_win.exe.so

#ifndef WINMAIN_BI
#define WINMAIN_BI

#include "windows.bi"
#include "win\shellapi.bi"
#include "win\commctrl.bi"

Declare Function WinMain( _
	Byval hInst As HINSTANCE, _
	ByVal hPrevInstance As HINSTANCE, _
	ByVal Args As WString Ptr Ptr, _
	ByVal ArgsCount As Integer, _
	ByVal iCmdShow As Integer _
)As Integer

#endif

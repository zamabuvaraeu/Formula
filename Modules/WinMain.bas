#include "WinMain.bi"
#include "DisplayError.bi"
#include "FormulaDialogProc.bi"
#include "Resources.RH"

Function WinMain( _
		Byval hInst As HINSTANCE, _
		ByVal hPrevInstance As HINSTANCE, _
		ByVal Args As WString Ptr Ptr, _
		ByVal ArgsCount As Integer, _
		ByVal iCmdShow As Integer _
	)As Integer
	
	Dim icc As INITCOMMONCONTROLSEX = Any
	icc.dwSize = SizeOf(INITCOMMONCONTROLSEX)
	icc.dwICC = ICC_ANIMATE_CLASS Or _
		ICC_BAR_CLASSES Or _
		ICC_COOL_CLASSES Or _
		ICC_DATE_CLASSES Or _
		ICC_HOTKEY_CLASS Or _
		ICC_INTERNET_CLASSES Or _
		ICC_LINK_CLASS Or _
		ICC_LISTVIEW_CLASSES Or _
		ICC_NATIVEFNTCTL_CLASS Or _
		ICC_PAGESCROLLER_CLASS Or _
		ICC_PROGRESS_CLASS Or _
		ICC_STANDARD_CLASSES Or _
		ICC_TAB_CLASSES Or _
		ICC_TREEVIEW_CLASSES Or _
		ICC_UPDOWN_CLASS Or _
		ICC_USEREX_CLASSES Or _
	ICC_WIN95_CLASSES
	
	If InitCommonControlsEx(@icc) = False Then
		DisplayError(GetLastError(), "Failed to register Common Controls")
		Return 1
	End If
	
	Dim DialogBoxParamResult As INT_PTR = DialogBoxParam( _
		hInst, _
		MAKEINTRESOURCE(IDD_DLG_FORMULA), _
		NULL, _
		@FormulaDialogProc, _
		0 _
	)
	If DialogBoxParamResult = 0 OrElse DialogBoxParamResult = -1 Then
		DisplayError(GetLastError(), "Failed to DialogBoxParam")
		Return 1
	End If
	
	Return 0
	
End Function

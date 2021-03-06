#include "FormulaDialog.bi"
#include "Resources.RH"
#include "crt\math.bi"
#include "win\ole2.bi"
#include "win\oleauto.bi"

Function GetDlgItemDouble(ByVal hWin As HWND, ByVal nIDDlgItem As Long)As Double
	
	Const MAX_VALUE As Long = 2048 - 1
	Dim wszValue As WString * (MAX_VALUE + 1) = Any
	
	If GetDlgItemText(hWin, nIDDlgItem, @wszValue, MAX_VALUE) = 0 Then
		' Ошибка
		Return 0.0
	End If
	
	Dim Value As Double = Any
	Dim hr As HRESULT = VarR8FromStr(@wszValue, 0, 0, @Value)
	If FAILED(hr) Then
		' Ошибка
		Return 0.0
	End If
	
	Return Value
	
End Function

Sub MainForm_Load(ByVal hWin As HWND, ByVal wParam As WPARAM, ByVal lParam As LPARAM)
	Dim ico As HICON = LoadIcon(GetModuleHandle(0), Cast(WString Ptr, IDR_ICON))
	SendMessage(hWin, WM_SETICON, ICON_BIG, Cast(LPARAM, ico))
	SendMessage(hWin, WM_SETICON, ICON_SMALL, Cast(LPARAM, ico))
End Sub

Sub Calculate_Click(ByVal hWin As HWND)
	
	Dim u As Double = GetDlgItemDouble(hWin, IDC_EDT_PARAM_U)
	Dim t As Double = GetDlgItemDouble(hWin, IDC_EDT_PARAM_T)
	Dim s As Double = GetDlgItemDouble(hWin, IDC_EDT_PARAM_S)
	
	Dim tres As Double = Any
	VarR8Pow(M_E, -(u * t / s), @tres)
	
	Dim res As Double = 1.0 - tres
	
	Scope
		Dim bstrResult As BSTR = Any
		VarBstrFromR8(res, 0, 0, @bstrResult)
		SetDlgItemText(hWin, IDC_EDT_RESULT, bstrResult)
		SysFreeString(bstrResult)
	End Scope
	
End Sub

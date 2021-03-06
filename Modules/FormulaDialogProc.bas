#include "FormulaDialogProc.bi"
#include "FormulaDialog.bi"
#include "Resources.RH"

Function FormulaDialogProc( _
		ByVal hwndDlg As HWND, _
		ByVal uMsg As UINT, _
		ByVal wParam As WPARAM, _
		ByVal lParam As LPARAM _
	)As INT_PTR
	
	Select Case uMsg
		
		Case WM_INITDIALOG
			MainForm_Load(hwndDlg, wParam, lParam)
			
		Case WM_COMMAND
			Select Case LOWORD(wParam)
				
				Case IDC_BTN_RESULT
					Calculate_Click(hwndDlg)
					
				Case IDCANCEL
					EndDialog(hwndDlg, 1)
					
			End Select
			
		Case WM_CLOSE
			EndDialog(hwndDlg, 1)
			
		Case Else
			Return False
			
	End Select
	
	Return True
	
End Function

#ifndef DISPLAYERROR_BI
#define DISPLAYERROR_BI

#ifndef unicode
#define unicode
#endif

#include "windows.bi"

Declare Sub DisplayError( _
	ByVal dwErrorCode As DWORD, _
	ByVal Caption As WString Ptr _
)

#endif


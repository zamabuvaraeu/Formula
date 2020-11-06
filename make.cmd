set CompilerDirectory=%ProgramFiles%\FreeBASIC
set MainFile=Modules\EntryPoint.bas
set Classes=
set Modules=Modules\DisplayError.bas Modules\FormulaDialog.bas Modules\FormulaDialogProc.bas Modules\WinMain.bas
set Resources=Resources.RC
set OutputFile=Formula.exe

set IncludeFilesPath=-i Classes -i Interfaces -i Modules -i Headers
set IncludeLibraries=
set ExeTypeKind=gui

set MaxErrorsCount=-maxerr 1
set MinWarningLevel=-w all
REM set UseThreadSafeRuntime=-mt

REM set EnableShowIncludes=-showincludes
REM set EnableVerbose=-v
REM set EnableRuntimeErrorChecking=-e
REM set EnableFunctionProfiling=-profile

if "%1"=="service" (
	set SERVICE_DEFINED=-d WINDOWS_SERVICE
) else (
	set SERVICE_DEFINED=
	set PERFORMANCE_TESTING_DEFINED=-d PERFORMANCE_TESTING
)

if "%2"=="debug" (
	set EnableDebug=debug
	set OptimizationLevel=-O 0
	set VectorizationLevel=-vec 0
) else (
	set EnableDebug=release
	set OptimizationLevel=-O 3
	set VectorizationLevel=-vec 0
)

if "%3"=="withoutruntime" (
	set WithoutRuntime=withoutruntime
) else (
	set WithoutRuntime=runtime
)

set CompilerParameters=-d UNICODE %SERVICE_DEFINED% %PERFORMANCE_TESTING_DEFINED% %MaxErrorsCount% %UseThreadSafeRuntime% %MinWarningLevel% %EnableFunctionProfiling% %EnableShowIncludes% %EnableVerbose% %EnableRuntimeErrorChecking% %IncludeFilesPath% %IncludeLibraries% %OptimizationLevel% %VectorizationLevel% 

call translator.cmd "%MainFile% %Classes% %Modules% %Resources%" "%ExeTypeKind%" "%OutputFile%" "%CompilerDirectory%" "%CompilerParameters%" %EnableDebug% noprofile %WithoutRuntime%
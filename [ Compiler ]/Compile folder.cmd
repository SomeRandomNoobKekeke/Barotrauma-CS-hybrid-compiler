echo off 

@REM first arg without quotes
SET SourceModDir="%~1/"
SET ModDeployDir="%~1 [compiled]/"

:Loop 
SET /P ModRootNamespace=What's ModRootNamespace?
IF "%ModRootNamespace%"=="" GOTO Loop 

SET ModAssemblyName=%ModRootNamespace%

echo Compiling to %ModDeployDir%

@REM Assuming that you're currently in LocalMods drag and droping some folder
SET CompilerDir="[ Compiler ]"

@REM you can set -p WarningLevel=4 and remove /clp:ErrorsOnly if you like warnings
@REM -maxcpucount:1 disables building multiple projects in parallel, on my pc they constanly block each other
cd %CompilerDir%
dotnet build .\Compiler.sln -c Release /clp:ErrorsOnly -p WarningLevel=0 -maxcpucount:1 -p:ModAssemblyName=%ModAssemblyName% -p:ModRootNamespace=%ModRootNamespace% -p:SourceModDir=%SourceModDir% -p:ModDeployDir=%ModDeployDir%

pause

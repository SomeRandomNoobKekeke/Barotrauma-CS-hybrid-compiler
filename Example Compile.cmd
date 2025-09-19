echo off 

@REM Set those vars
@REM Note: it's space sensitive
SET CompileTo=CompileTest
SET ModAssemblyName=CompileTest
SET ModRootNamespace=CompileTest

@REM Folder paths should end in /
SET CompilerDir="../[ Compiler ]/"
SET SourceModDir="%cd%/"

@REM https://stackoverflow.com/a/60046276
for %%I in ("%~dp0.") do for %%J in ("%%~dpI.") do set ParentFolder=%%~dpnxJ
@REM echo %ParentFolder%

SET ModDeployDir="%ParentFolder%/%CompileTo%/"

@REM you can set -p WarningLevel=4 and remove /clp:ErrorsOnly if you like warnings
cd %CompilerDir%
dotnet build .\Compiler.sln -c Release /clp:ErrorsOnly -p WarningLevel=0 -p:ModAssemblyName=%ModAssemblyName% -p:ModRootNamespace=%ModRootNamespace% -p:SourceModDir=%SourceModDir% -p:ModDeployDir=%ModDeployDir%

pause

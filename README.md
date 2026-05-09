Currently borked, don't use it, wait until i update it to https://github.com/Luatrauma/LuaCsModTemplate/commit/5602ff179f59100610745aaf2540010af93095e6

## What is this:

A tool for compiling any barotrauma C# "in memory" mod into dll mod in one click

It's 99% https://github.com/MapleWheels/VSProjectSkeleton but instead of compiling its own files it accepts a path to "in memory" mod via command line params and compiles its files into another folder  
And because it accepts any mod you only need one such thing

## How to use it:
Download zip and extract [ Compiler ] into LocalMods, add [luatrauma refs](https://github.com/evilfactory/LuaCsForBarotrauma/releases/download/latest/luacsforbarotrauma_refs.zip) to Refs folder

Then you'll need to call `dotnet build .\Compiler.sln -c Release /clp:ErrorsOnly -p WarningLevel=0 -p:ModAssemblyName=%ModAssemblyName% -p:ModRootNamespace=%ModRootNamespace% -p:SourceModDir=%SourceModDir% -p:ModDeployDir=%ModDeployDir%` in Compilers folder

You can just drag and drop you "in memory" mod folder into "Compile folder.cmd" script  
Or copy paste "Example mod compilation script.cmd" into your "in memory" mod folder, change the vars there and run it

I have "f5 anything" extension in VSCode, so i just press f5 to compile it

## Why???:
Big "in memory" mods might take too much time to compile for users and there's no easy way to hot reload precompiled mod  
In theory you can run VS over debug luatrauma but i don't have enough computer for that, also i don't like VS

Also you can't release "in memory" mods with nuget packages, it has to be precompiled, but it's possible to dev "in memory" mod with nuget by running it in custom built barotrauma
 
So i develop mods using cl_reloadlua and then f5 it when i want to release it

## Notes:
If you need to copy some files you can create "CopyFiles.targets" in mod folder and Assets.csproj will import it
Check CopyFiles.targets.Example for example





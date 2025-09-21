## What is this:

A tool for compiling any barotrauma C# "in memory" mod into dll mod in one click

It's 99% https://github.com/MapleWheels/VSProjectSkeleton but instead of compiling its own files it accepts a path to "in memory" mod via command line params and compiles its files into another folder  
And because it accepts any mod you only need one such thing

## How to use it:
Download it and drop it into LocalMods, add luatrauma refs

Then you'll need to call `dotnet build .\Compiler.sln -c Release /clp:ErrorsOnly -p WarningLevel=0 -p:ModAssemblyName=%ModAssemblyName% -p:ModRootNamespace=%ModRootNamespace% -p:SourceModDir=%SourceModDir% -p:ModDeployDir=%ModDeployDir%` in that folder

i've made [a cmd script](https://github.com/SomeRandomNoobKekeke/Barotrauma-CS-hybrid-compiler/blob/main/Example%20Compile.cmd) that you can just put in your "in memory" mod folder, change some vars there and then click it

I have "f5 anything" extension in VSCode, so i just press f5 and it's compiling

## Why???:
Big "in memory" mods might take too much time to compile for users and there's no easy way to hot reload precompiled mod  
In theory you can run VS over debug luatrauma but i don't have enough computer for that, also i don't like VS

Also you can't release "in memory" mods with nuget packages, it has to be precompiled, but it's possible to dev "in memory" mod with nuget by running it in custom built barotrauma
 
So i develop mods using cl_reloadlua and then f5 it when i want to release it

## Notes:
It's also copies Content/** Lua/** CSharp/RunConfig.xml files, check https://github.com/SomeRandomNoobKekeke/Barotrauma-CS-hybrid-compiler/blob/main/Assets/Assets.csproj and edit it as you want

if you want warnigns remove `/clp:ErrorsOnly` and set `-p WarningLevel=4`

Sometimes it fails with "can't access stuff, blocked by another process", just as original VSProjectSkeleton actually, f5 until you make it ig

Also i'm not batch/MSBuild expert, used it for the first time in my life, not sure if it works on other systems, works at least on windows 11  
Scripts for other systems, advices are welcome





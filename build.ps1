# Builds the 32-bit mod DLL build\DA2Access.asi with the MSVC x86 toolset.
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$vswhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
$vs = & $vswhere -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath
if (-not $vs) { throw 'Visual Studio C++ build tools not found' }
$vcvars = Join-Path $vs 'VC\Auxiliary\Build\vcvars32.bat'
$env:PATH = "$(Split-Path $vswhere);$env:PATH"  # vcvars calls vswhere by bare name
New-Item -ItemType Directory -Force "$root\build" | Out-Null
$sources = (Get-ChildItem "$root\src\*.cpp" | ForEach-Object { "`"$($_.FullName)`"" }) -join ' '
$cmd = "`"$vcvars`" >nul && cl /nologo /std:c++17 /O2 /MT /EHsc /utf-8 /W3 /LD " +
       "/I`"$root\lib\prism\include`" $sources /Fo`"$root\build\\`" /Fe`"$root\build\DA2Access.asi`" " +
       "/link /DLL user32.lib version.lib"
cmd /c $cmd
if ($LASTEXITCODE -ne 0) { throw "build failed ($LASTEXITCODE)" }
Write-Host "Built $root\build\DA2Access.asi"
# Flash agent loaded into the game's menus (FFDec compiles src\agent\daoaccess.as)
python "$root\tools\build_agent.py"
if ($LASTEXITCODE -ne 0) { throw "agent build failed ($LASTEXITCODE)" }

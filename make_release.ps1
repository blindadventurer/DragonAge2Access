# Builds the mod and packs a release archive: release\DA2Access-<version>.zip.
# The archive holds two folders:
#   bin_ship  - extract into the game's bin_ship folder (loader, mod, speech library)
#   override  - da2access.gfx for Documents\BioWare\Dragon Age 2\packages\core\override
# Same files as deploy.ps1, plus the licences and the README.
param([Parameter(Mandatory = $true)][string]$Version)
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot

& "$root\build.ps1"

$stage = "$root\release\stage"
if (Test-Path $stage) { Remove-Item -Recurse -Force $stage }
$bin = "$stage\bin_ship"
$data = "$bin\scripts\DA2Access"
$files = @(
    @{ From = "$root\vendor\ual-9.7.4\dinput8.dll";     To = "$bin\dinput8.dll" },
    @{ From = "$root\build\DA2Access.asi";              To = "$bin\scripts\DA2Access.asi" },
    @{ From = "$root\build\da2access.gfx";              To = "$data\da2access.gfx" },
    @{ From = "$root\build\da2access.gfx";              To = "$stage\override\da2access.gfx" },
    @{ From = "$root\lib\prism-x86\prism.dll";          To = "$data\prism.dll" },
    @{ From = "$root\lib\prism\third-party\prism\mpl-2.0.txt"; To = "$data\third-party\prism\mpl-2.0.txt" },
    @{ From = "$root\lib\prism\third-party\prism\NOTICE";      To = "$data\third-party\prism\NOTICE" },
    @{ From = "$root\vendor\ual-9.7.4\LICENSE.txt";     To = "$data\third-party\ultimate-asi-loader\LICENSE.txt" },
    @{ From = "$root\LICENSE";                          To = "$data\LICENSE.txt" },
    @{ From = "$root\README.md";                        To = "$stage\README.md" }
)
foreach ($f in $files) {
    New-Item -ItemType Directory -Force (Split-Path $f.To) | Out-Null
    Copy-Item $f.From $f.To -Force
}
$zip = "$root\release\DA2Access-$Version.zip"
if (Test-Path $zip) { Remove-Item -Force $zip }
# tar.exe (Windows 10+) writes zip entries with forward slashes; Compress-Archive of
# PowerShell 5.1 writes backslashes, which some extractors do not take as folders.
& "$env:SystemRoot\System32\tar.exe" -a -c -f $zip -C $stage bin_ship override README.md
if ($LASTEXITCODE -ne 0) { throw "packing failed ($LASTEXITCODE)" }
$hash = (Get-FileHash $zip -Algorithm SHA256).Hash
Write-Host "Release $zip"
Write-Host "SHA-256 $hash"

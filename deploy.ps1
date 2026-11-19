# Builds the mod and copies it into the game. Refuses while the game runs.
# Game folder changes are listed in NOTEBOOK.md.
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$game = 'F:\games\Dragon Age 2.v 1.04 + 16 DLC\bin_ship'
# The game's official override folder (resources placed here add to the game's).
$override = Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'BioWare\Dragon Age 2\packages\core\override'

$running = Get-Process -ErrorAction SilentlyContinue | Where-Object {
    $_.Name -in @('DragonAge2', 'DragonAge2Launcher', 'DragonAge2Config') }
if ($running) { throw "The game is running ($($running.Name -join ', ')). Close it first." }

& "$root\build.ps1"

$files = @(
    @{ From = "$root\vendor\ual-9.7.4\dinput8.dll"; To = "$game\dinput8.dll" },
    @{ From = "$root\build\DA2Access.asi";          To = "$game\scripts\DA2Access.asi" },
    @{ From = "$root\build\da2access.gfx";          To = "$game\scripts\DA2Access\da2access.gfx" },
    @{ From = "$root\build\da2access.gfx";          To = "$override\da2access.gfx" },
    @{ From = "$root\lib\prism-x86\prism.dll";      To = "$game\scripts\DA2Access\prism.dll" },
    @{ From = "$root\lib\prism\third-party\prism\mpl-2.0.txt"; To = "$game\scripts\DA2Access\third-party\prism\mpl-2.0.txt" },
    @{ From = "$root\lib\prism\third-party\prism\NOTICE";      To = "$game\scripts\DA2Access\third-party\prism\NOTICE" }
)
New-Item -ItemType Directory -Force "$game\scripts\DA2Access\third-party\prism" | Out-Null
New-Item -ItemType Directory -Force $override | Out-Null
foreach ($f in $files) {
    if ((Test-Path $f.To) -and ($f.To -like '*\dinput8.dll')) {
        $same = (Get-FileHash $f.From).Hash -eq (Get-FileHash $f.To).Hash
        if (-not $same) { throw "$($f.To) exists and is not our loader. Not overwriting." }
    }
    Copy-Item $f.From $f.To -Force
    Write-Host "Copied $($f.From) -> $($f.To)"
}

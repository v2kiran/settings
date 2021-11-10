#psdefault values
$PSDefaultParameterValues.Add('Out-Default:OutVariable', 'Lastout')
# this imports the bookmarks
#import-folderbookmark

#Import-Module Poshcolor
Import-Module -Name Terminal-Icons
Import-Module c:\gh\misc -Force
#psreadline

Import-Module oh-my-posh
Set-PoshPrompt -Theme 'C:\Users\Kiran\OneDrive\GitHub\settings\themes\my-paradox.json'

# Goto location
Set-Location c:\gh


. 'C:\gh\settings\psreadline\Sample.profile.ps1'

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile))
{
    Import-Module "$ChocolateyProfile"
}


Function Elevate
{
    Start-Process (Get-Process -Id $PID).path -Verb runas
}
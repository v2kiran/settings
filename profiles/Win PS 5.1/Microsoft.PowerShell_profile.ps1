Set-Location C:\gh\

#Import-Module Poshcolor
Import-Module -Name Terminal-Icons
Import-Module oh-my-posh
Import-Module c:\gh\misc -DisableNameChecking
Set-PoshPrompt -Theme 'C:\gh\settings\themes\my-paradox.json'

$dc = ($env:LOGONSERVER -replace '\\\\')

#psreadline
. 'C:\gh\settings\psreadline\Sample.profile.ps1'

Function Elevate
{
    Start-Process (Get-Process -Id $PID).path -Verb runas
}

Set-Location C:\ghe\

Import-Module PSColor
Import-Module oh-my-posh
Set-Theme Paradox

$dc = ($env:LOGONSERVER -replace '\\\\')

#psreadline
. "C:\gh\settings\psreadline\Sample.profile.ps1"

Function Elevate
{
  Start-Process (Get-Process -id $PID).path -verb runas
}

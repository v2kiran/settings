Set-Location C:\gh\
$PSDefaultParameterValues.Add('Out-Default:OutVariable', 'Lastout')


#Import-Module Poshcolor
Import-Module -Name Terminal-Icons
Import-Module oh-my-posh
Import-Module c:\gh\misc -Force -DisableNameChecking
Set-PoshPrompt -Theme 'C:\gh\settings\themes\my-paradox.json'
New-PSDrive -Name Z -PSProvider FileSystem -Root \\archie-ds\winroot -Persist

$PSStyle.Formatting.TableHeader = $PSStyle.Foreground.BrightYellow
$PSStyle.Formatting.FormatAccent = $PSStyle.Foreground.BrightYellow


#psreadline
. 'C:\gh\settings\psreadline\Sample.profile.ps1'

Function Elevate
{
    Start-Process (Get-Process -Id $PID).path -Verb runas
}
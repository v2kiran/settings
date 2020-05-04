#psdefault values
#$PSDefaultParameterValues.Add('Out-Default:OutVariable', 'Lastout')
# this imports the bookmarks
#import-folderbookmark

Import-Module PSColor
<#
Import-Module "C:\ghe\Cisco.DS.Password\src\Cisco.DS.Password.psd1" -Force
Import-Module "C:\ghe\Cisco.DS.YubiKey\src\Cisco.DS.YubiKey.psd1" -Force
Import-Module "C:\ghe\Cisco.DS.Certificate\src\Cisco.DS.Certificate.psd1" -Force
import-folderbookmark
#>


#psreadline

Import-Module oh-my-posh
Set-Theme Paradox

# Goto location
Set-Location c:\gh


# Goto location
$dc = ($env:LOGONSERVER -replace '\\\\')


. "C:\gh\settings\psreadline\Sample.profile.ps1"

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile))
{
  Import-Module "$ChocolateyProfile"
}


Function Elevate
{
  Start-Process (Get-Process -id $PID).path -verb runas
}

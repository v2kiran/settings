Set-PSReadLineOption -Colors @{
  Parameter = 'DarkCyan'     # cyan - #20B2AA
  Command   = '#FFD700'
  Type      = 'DarkCyan'
  Variable  = '#FF69B4' # hot pink
  Number    = '#EEE8AA'
  Operator  = 'white'
  String    = "$([char]0x1b)[38;5;100m"
  member    = '#FF7F50' # coral
  default   = 'DarkGreen'
}
$PSStyle.Formatting.TableHeader = $PSStyle.Foreground.FromRgb('#ccc82c')
$PSStyle.Formatting.FormatAccent = $PSStyle.Foreground.FromRgb('#ccc82c')

$PSDefaultParameterValues.Add('Out-Default:OutVariable', 'Lastout')


#Import-Module Poshcolor
Import-Module EditorServicesCommandSuite
Import-EditorCommand -Module EditorServicesCommandSuite

Import-Module -Name Terminal-Icons
Import-Module oh-my-posh
Import-Module c:\gh\misc -Force -DisableNameChecking
Set-PoshPrompt -Theme 'C:\gh\settings\themes\my-paradox.json'


#psreadline
. 'C:\gh\settings\psreadline\Sample.profile.ps1'

Function Elevate
{
  Start-Process (Get-Process -Id $PID).path -Verb runas
}
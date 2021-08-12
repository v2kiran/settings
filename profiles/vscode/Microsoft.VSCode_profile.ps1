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


Set-Location C:\gh\

#Import-Module Poshcolor
Import-Module -Name Terminal-Icons
Import-Module oh-my-posh
Import-Module c:\gh\misc
Set-PoshPrompt -Theme 'C:\Users\Kiran\OneDrive\GitHub\settings\themes\my-paradox.json'

$dc = ($env:LOGONSERVER -replace '\\\\')

#psreadline
#. 'C:\gh\settings\psreadline\Sample.profile.ps1'

Function Elevate
{
  Start-Process (Get-Process -Id $PID).path -Verb runas
}
$FormatEnumerationLimit = 99

# 4. Set some command defaults
$PSDefaultParameterValues = @{
  '*:autosize'              = $true
  'Receive-Job:keep'        = $true
  '*:Wrap'                  = $true
  'Out-Default:OutVariable' = 'Lastout'
}


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

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView

Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'


#Import-Module Poshcolor
Import-Module EditorServicesCommandSuite
Import-EditorCommand -Module EditorServicesCommandSuite


Import-Module oh-my-posh
#Import-Module c:\gh\misc -Force -DisableNameChecking
$omp_config = 'c:\gh\settings\config\takuya.omp.json'
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
#Set-PoshPrompt -Theme 'C:\Users\Kiran\OneDrive\GitHub\settings\themes\my-paradox.json'

<#
#psreadline
. 'C:\gh\settings\psreadline\Sample.profile.ps1'

Function Elevate
{
  Start-Process (Get-Process -Id $PID).path -Verb runas
}

#Import-Module Az.Tools.Predictor
 #>
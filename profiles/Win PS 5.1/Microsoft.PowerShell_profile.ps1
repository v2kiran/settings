#psdefault values
# 3. Set Format enumeration olimit
$FormatEnumerationLimit = 99

# 4. Set some command defaults
$PSDefaultParameterValues = @{
    '*:autosize'              = $true
    'Receive-Job:keep'        = $true
    '*:Wrap'                  = $true
    'Out-Default:OutVariable' = 'Lastout'
}
# this imports the bookmarks
#import-folderbookmark

#Import-Module Poshcolor
Import-Module -Name Terminal-Icons
#Import-Module c:\gh\misc -Force
#psreadline

Import-Module oh-my-posh
$omp_config = 'c:\gh\settings\config\takuya.omp.json'
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
#Set-PoshPrompt -Theme 'C:\Users\Kiran\OneDrive\GitHub\settings\themes\my-paradox.json'

# Goto location
Set-Location c:\gh


. 'C:\gh\settings\psreadline\Sample.profile.ps1'

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile))
{
    Import-Module "$ChocolateyProfile"
}

Set-PSReadLineOption -PredictionViewStyle ListView
Function Elevate
{
    Start-Process (Get-Process -Id $PID).path -Verb runas
}

Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
if ((Get-Command nvim -ErrorAction Ignore))
{
    if (-not (Get-Command vim -ErrorAction Ignore))
    {
        Set-Alias vim nvim
    }
    if (-not (Get-Command vi -ErrorAction Ignore))
    {
        Set-Alias vi vim
    }
    if (-not (Get-Command gvim -ErrorAction Ignore))
    {
        Set-Alias gvim nvim-qt
    }
}

<#endregion
psfzf
Ctrl+T searches the paths below the current directory and inserts the selected path
Alt+C does the same, but automatically changes the current directory to the selected one upon confirmation.
cd \  press tab to autocomplete directories
#>
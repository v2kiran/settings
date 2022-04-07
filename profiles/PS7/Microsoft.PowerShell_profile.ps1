Set-Location C:\gh\

#Import-Module Poshcolor
Import-Module -Name Terminal-Icons
Import-Module oh-my-posh
#Import-Module c:\gh\misc -Force -DisableNameChecking
#Set-PoshPrompt -Theme 'C:\gh\settings\themes\my-paradox.json'

# 3. Set Format enumeration olimit
$FormatEnumerationLimit = 99

# 4. Set some command defaults
$PSDefaultParameterValues = @{
    '*:autosize'              = $true
    'Receive-Job:keep'        = $true
    '*:Wrap'                  = $true
    'Out-Default:OutVariable' = 'Lastout'
}


$omp_config = 'c:\gh\settings\config\takuya.omp.json'
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

if (Test-Path \\archie-ds\winroot)
{
    New-PSDrive -Name Z -PSProvider FileSystem -Root \\archie-ds\winroot -Persist -ErrorAction SilentlyContinue
}


$PSStyle.Formatting.TableHeader = $PSStyle.Foreground.BrightYellow
$PSStyle.Formatting.FormatAccent = $PSStyle.Foreground.BrightYellow


#psreadline
. 'C:\gh\settings\psreadline\Sample.profile.ps1'

Function Elevate
{
    Start-Process (Get-Process -Id $PID).path -Verb runas
}
Import-Module Az.Tools.Predictor
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView

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
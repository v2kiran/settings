$env:PSModulePath = $env:PSModulePath + ";$home\psmodules"

# 3. Set Format enumeration olimit
$FormatEnumerationLimit = 99

# 4. Set some command defaults
$PSDefaultParameterValues = @{
    '*:autosize'              = $true
    'Receive-Job:keep'        = $true
    '*:Wrap'                  = $true
    'Out-Default:OutVariable' = 'Lastout'
}


$omp_config = 'C:\Users\Kiran.Reddy6\OneDrive - Shell\gh\personal\settings\config\takuya-1.omp.json'
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression


#$PSStyle.Formatting.TableHeader = $PSStyle.Foreground.BrightYellow
#$PSStyle.Formatting.TableHeader = $PSStyle.Foreground.FromRgb(151, 74, 32)

$psstyle.Formatting.TableHeader = "`e[3;96;195m"
$PSStyle.Formatting.Error = "`e[38;201m"
$PSStyle.Formatting.FormatAccent = $PSStyle.Foreground.BrightYellow


#psreadline
. 'C:\Users\Kiran.K.Reddy2\OneDrive - Shell\Github\settings\psreadline\Sample.profile.ps1'

Import-Module -Name Terminal-Icons
#ipmo powershellget -RequiredVersion 3.0.22
#Import-Module Az.Tools.Predictor
Import-Module CompletionPredictor
import-module posh
import-module psutil
#import-module ugit
Import-Module PowerType
Enable-PowerType
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView


function New-Password
{
    (op item create --category password --generate-password=18,letters,digits,symbols --dry-run --format json | ConvertFrom-Json).fields.value
}


function Update-AllModules
{
    $mods = (Get-Module -ListAvailable | Where-Object path -Match psmodule) | Select-Object Name, version
    $mod_group = $mods | Group-Object Name
    foreach ($mg in $mod_group)
    {
        if($mg.name -notmatch "az\.")
        {
            $m = $mg.group | Sort-Object version -Descending | Select-Object -First 1

            $newversion = (Find-PSResource -Name $m.name -repository psgallery).Version
            if ($newversion -gt $m.Version )
            {
                # springgreen1
                #Write-Host "Module [$($m.name)]:`tOld version [$($m.version)]  << [$newversion] "
                Write-SpectreHost -Message "Module [underline bold purple][[$($m.name)]][/]:`tOld version [red][[$($m.version)]][/]  << [green][[$newversion]][/] "
                Save-PSResource -Name $m.Name -Path $home\psmodules
            }
        }
    }

    # remove old module versions
    $new_mod_group = $mod_group | Where-Object count -GT 1
    foreach ($mg in $new_mod_group)
    {
        $old_versions = $mg.group | Sort-Object version -Descending | Select-Object * -Skip 1
        foreach ($ov in $old_versions)
        {
            $path = "$home\psmodules\$($ov.name)\$($ov.version)"
            if (Test-Path $path)
            {
                Write-Host "Module [$($ov.name)]:`t removing Old version [$($ov.version)]"
                Get-ChildItem $Path -Recurse | Remove-Item -Force -Confirm:$false -Recurse
                #Remove-Item -path $path\* -Recurse -Force -Confirm:$false
            }
        }
    }
}


[console]::InputEncoding = [console]::OutputEncoding = [System.Text.UTF8Encoding]::new()


<#
$spncredential = cms bus -value
#>
$env:PSModulePath = $env:PSModulePath + ";$home\psmodules"

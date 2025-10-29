$env:PSModulePath = $env:PSModulePath + ";$home\psmodules"
Set-Location 'C:\Users\Kiran.K.Reddy2\OneDrive - Shell\'



# 3. Set Format enumeration olimit
$FormatEnumerationLimit = 99

# 4. Set some command defaults
$PSDefaultParameterValues = @{
    '*:autosize'              = $true
    'Receive-Job:keep'        = $true
    '*:Wrap'                  = $true
    'Out-Default:OutVariable' = 'Lastout'
}


$omp_config = 'C:\Users\Kiran.K.Reddy2\OneDrive - Shell\Github\settings\config\takuya1.omp.json'
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
#import-module psutil
#import-module ugit
Import-Module PowerType
Enable-PowerType
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView


function azloginshell
{
    param(
        # Parameter help description
        [Parameter(Mandatory)]
        [ValidateSet('dev', 'tst', 'bus', 'root')]
        [string]
        $Env,

        [switch]
        $LogintoGraphasSPN
    )

    if ($dev)
    {
        $cred = Import-Clixml 'C:\Users\Kiran.K.Reddy2\OneDrive - Shell\cr\dev_spn.xml'
    }

    switch ($env)
    {
        'dev' { $cred = Import-Clixml 'C:\Users\Kiran.K.Reddy2\OneDrive - Shell\cr\dev_spn.xml' }
        'tst' { $cred = Import-Clixml 'C:\Users\Kiran.K.Reddy2\OneDrive - Shell\cr\tst_spn.xml' }
        'bus' { $cred = Import-Clixml 'C:\Users\Kiran.K.Reddy2\OneDrive - Shell\cr\bus_spn.xml' }
        'root' { $cred = Import-Clixml 'C:\Users\Kiran.K.Reddy2\OneDrive - Shell\cr\root_spn.xml' }

    }

    $tenantID = 'db1e96a8-a3da-442a-930b-235cac24cd5c'
    Connect-AzAccount -TenantId $tenantID -Credential $cred -ServicePrincipal -WarningAction SilentlyContinue

    if ($LogintoGraphasSPN)
    {
        $tenantid = 'db1e96a8-a3da-442a-930b-235cac24cd5c'

        $body = @{
            Grant_Type    = 'client_credentials'
            Scope         = 'https://graph.microsoft.com/.default'
            Client_Id     = $cred.UserName
            Client_Secret = $cred.GetNetworkCredential().Password
          }

          $connection = Invoke-RestMethod `
            -Uri https://login.microsoftonline.com/$tenantid/oauth2/v2.0/token `
            -Method POST `
            -Body $body

          $token = $connection.access_token
          $null = Connect-MgGraph -AccessToken $token
    }
    else
    {
        Connect-MgGraph
    }
    Get-MgContext

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

$dpcoe = 'ed0c2f5b-069b-412f-bf32-7a21255f8dac'
$tenantid = 'db1e96a8-a3da-442a-930b-235cac24cd5c'

[console]::InputEncoding = [console]::OutputEncoding = [System.Text.UTF8Encoding]::new()


<#
$spncredential = cms bus -value
#>
$env:PSModulePath = $env:PSModulePath + ";$home\psmodules"

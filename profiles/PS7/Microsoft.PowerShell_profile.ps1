Set-Location C:\gh\

#Import-Module Poshcolor
Import-Module -Name Terminal-Icons
#Import-Module c:\gh\misc -Force -DisableNameChecking

# Aliases
set-alias -value psutil\write-psuknowledge -name note

# 3. Set Format enumeration olimit
$FormatEnumerationLimit = 99

# 4. Set some command defaults
$PSDefaultParameterValues = @{
  '*:autosize'              = $true
  'Receive-Job:keep'        = $true
  '*:Wrap'                  = $true
  'Out-Default:OutVariable' = 'Lastout'
}

Write-Verbose 'Configuring ps prompt'
$omp_config = 'c:\gh\settings\config\takuya-1.omp.json'
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
Write-Verbose 'Done...Configuring ps prompt'


$PSStyle.Formatting.TableHeader = $PSStyle.Foreground.BrightYellow
$PSStyle.Formatting.FormatAccent = $PSStyle.Foreground.BrightYellow

Write-Verbose 'configure psreadline'

#psreadline
. 'C:\gh\settings\psreadline\Sample.profile.ps1'
Write-Verbose 'dONE...configure psreadline'

Function Elevate
{
  Start-Process (Get-Process -Id $PID).path -Verb runas
}
Set-PSReadLineOption -PredictionSource HistoryAndPlugin -ErrorAction SilentlyContinue
Set-PSReadLineOption -PredictionViewStyle ListView -ErrorAction SilentlyContinue
#Import-Module ugit
Import-Module posh

# command predictors
Import-Module Az.Tools.Predictor
Import-Module CompletionPredictor
Import-Module PowerType
Enable-PowerType

#Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
#Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
# Override PSReadLine's history search
#Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Override default tab completion
#Set-PSReadLineKeyHandler -Key F3 -ScriptBlock { Invoke-FzfTabCompletion }


function tfauth
{
  $creds = cms spn-azure-devops-001 -Value
  $tenantId = $creds.TenantID
  $clientId = $creds.ClientID
  $subscriptionId = $creds.SubscriptionID

  $tfstg_access_key = cms tfstg_access_key -Value

  # storing the credentials as environment variables
  New-Item -Path 'Env:\' -Name ARM_CLIENT_ID -Value $clientId -Force | Out-Null
  New-Item -Path 'Env:\' -Name ARM_CLIENT_SECRET -Value (cms spn-azure-devops-001 -Value)['Secret'] -Force | Out-Null
  New-Item -Path 'Env:\' -Name ARM_SUBSCRIPTION_ID -Value $subscriptionId -Force | Out-Null
  New-Item -Path 'Env:\' -Name ARM_TENANT_ID -Value $tenantId -Force | Out-Null
  New-Item -Path 'Env:\' -Name ARM_ACCESS_KEY -Value $tfstg_access_key -Force | Out-Null
}

function azauth
{
  $creds = cms spn-azure-devops-001 -Value
  $tenantId = $creds.TenantID
  $clientId = $creds.ClientID

  $SecuredPassword = (cms spn-azure-devops-001 -Value)['Secret'] | ConvertTo-SecureString -AsPlainText -Force
  $Credential = [PSCredential]::new($clientId, $SecuredPassword)
  Connect-AzAccount -ServicePrincipal -TenantId $tenantId -Credential $Credential

  # az login
  az login --service-principal -u $clientId -p (cms spn-azure-devops-001 -Value)['Secret'] --tenant $tenantId

}

function download-pwsh {
  $path = 'C:\Users\Kiran\downloads\Apps'
  Push-Location
  Set-Location $path
  Get-PSReleaseAsset -Family Windows -Only64Bit -Format zip |
    Save-PSReleaseAsset -Path $path -Passthru |
    Expand-Archive
  Pop-Location
}

function New-Password
{
    (op item create --category password --generate-password=18,letters,digits,symbols --dry-run --format json | ConvertFrom-Json).fields.value
}
# kubernetes autocomplete
kubectl completion powershell | out-string | invoke-expression
Set-Alias k 'kubectl'
Set-Alias kx 'kubectl exec -it'
function SetNamespace {
  param(
  [string]$namespace = 'default'
  )
  kubectl config set-context --current --namespace $namespace
  }
Set-Alias kn SetNamespace

function get-quotedstring { Write-Host "wrap '"' '"' | join ','" }
[console]::InputEncoding = [console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

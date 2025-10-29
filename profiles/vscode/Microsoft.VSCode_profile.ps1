$FormatEnumerationLimit = 99

# 4. Set some command defaults
$PSDefaultParameterValues = @{
  '*:autosize'              = $true
  'Receive-Job:keep'        = $true
  '*:Wrap'                  = $true
  'Out-Default:OutVariable' = 'Lastout'
}


Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
set-alias -value psutil\write-psuknowledge -name note


# import modules
Import-Module EditorServicesCommandSuite
Import-EditorCommand -Module EditorServicesCommandSuite
Import-Module CompletionPredictor
Import-Module PowerType
Enable-PowerType
Import-Module psutil
Import-Module Posh


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
  $subscriptionId = $creds.SubscriptionID

  $SecuredPassword = (cms spn-azure-devops-001 -Value)['Secret'] | ConvertTo-SecureString -AsPlainText -Force
  $Credential = [PSCredential]::new($clientId, $SecuredPassword)
  Connect-AzAccount -ServicePrincipal -TenantId $tenantId -Credential $Credential

  # az login
  az login --service-principal -u $clientId -p (cms spn-azure-devops-001 -Value)['Secret'] --tenant $tenantId

}

# 1password
function New-Password
{
    (op item create --category password --generate-password=18,letters,digits,symbols --dry-run --format json | ConvertFrom-Json).fields.value
}

function download-pwsh {
  $path = 'C:\Users\Kiran\downloads\Apps'
  Push-Location
  Set-Location $path
  Get-PSReleaseAsset -Family Windows -Only64Bit -Format zip -Verbose |
    Save-PSReleaseAsset -Path $path -Passthru |
    Expand-Archive
  Pop-Location
}

# kubernetes autocomplete
kubectl completion powershell | out-string | invoke-expression
Set-Alias k 'kubectl'
function SetNamespace {
  param(
  [string]$namespace = 'default'
  )
  kubectl config set-context --current --namespace $namespace
  }
Set-Alias kn SetNamespace




# oh my posh
$omp_config = 'c:\gh\settings\config\takuya-vscode.omp.json'
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression


# Psreadline Options
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource HistoryAndPlugin

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

# Set encoding for console
[console]::InputEncoding = [console]::OutputEncoding = [System.Text.UTF8Encoding]::new()
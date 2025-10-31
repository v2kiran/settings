Set-Psrepository -Name Psgallery  -InstallationPolicy Trusted

Install-Module -Name Packagemanagement -force -Repo Psgallery -Scope CurrentUser 
Install-Module -Name PowerShellGet -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name PSSecret -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name PSReadline  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name EditorServicesCommandSuite -force -Repo Psgallery -Scope CurrentUser
#Install-Module -Name Pester -force -Repo Psgallery -Scope CurrentUser -req 4.10.1
Install-Module -Name Pester -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name InvokeBuild -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name WindowsConsoleFonts -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name PowerShellBooks -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name jit-tree -force -Repo Psgallery -allowprerelease -Scope CurrentUser
Install-Module -Name PowerHistory  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name Ezout -force -Repo Psgallery -Scope CurrentUser -allowclo
Install-Module -Name PSColor -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name posh-git -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name PSScriptTools -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name EnvironmentVariableCmdlet -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name Native -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name GetNetStat -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name EncodingAnalyzer  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name ParameterCache -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name ReallySimpleDatabase  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name Dynpar  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name PSNotebook  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name PSMath  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name DataQuery  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name HorkerTemplateEngine -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name Indented.Net.Ip -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name PoshNmap -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name PSFzf  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name completionpredictor  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name Yayaml -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name pstcpip -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name TabExpansion++ -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name StageCoder -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name PSGraph -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name Posh -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name Z -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name MaintainModule -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name SecretManagement.1Password -force -Repo Psgallery -Scope CurrentUser

Install-Module -Name  JustinGrote.Microsoft.Graph.Extensions -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name  psnotes  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name  psdates  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name  UsefulArgumentCompleters  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name  Microsoft.PowerShell.whatsnew  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name  OpenSSL  -force -Repo Psgallery -Scope CurrentUser -AllowClobber
Install-Module -Name  Sampler  -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name  Fsharp -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name  ModuleBuild -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name  ModuleBuilder -force -Repo Psgallery -Scope CurrentUser
Install-Module -Name Microsoft.PowerShell.SecretManagement  -force -Repo Psgallery -Scope CurrentUser

Save-PSResource -Name some -Path $home\psmodules 
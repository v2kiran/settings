Set-PSResourceRepository -Name PSGallery -Trusted 

Save-PSResource -Name PSSecret  -Repo Psgallery 
Save-PSResource -Name PSReadline   -Repo Psgallery -Prerelease
Save-PSResource -Name EditorServicesCommandSuite  -Repo Psgallery 
#Save-PSResource -Name Pester  -Repo Psgallery  -req 4.10.1
Save-PSResource -Name Pester  -Repo Psgallery 
Save-PSResource -Name InvokeBuild  -Repo Psgallery 
Save-PSResource -Name WindowsConsoleFonts  -Repo Psgallery 
Save-PSResource -Name PowerShellBooks  -Repo Psgallery 
Save-PSResource -Name jit-tree  -Repo Psgallery -allowprerelease 
Save-PSResource -Name PowerHistory   -Repo Psgallery 
Save-PSResource -Name Ezout  -Repo Psgallery  -allowclo
Save-PSResource -Name PSColor  -Repo Psgallery 
Save-PSResource -Name posh-git  -Repo Psgallery 
Save-PSResource -Name PSScriptTools  -Repo Psgallery 
Save-PSResource -Name EnvironmentVariableCmdlet  -Repo Psgallery 
Save-PSResource -Name Native  -Repo Psgallery 
Save-PSResource -Name GetNetStat  -Repo Psgallery 
Save-PSResource -Name EncodingAnalyzer   -Repo Psgallery 
Save-PSResource -Name ParameterCache  -Repo Psgallery 
Save-PSResource -Name ReallySimpleDatabase   -Repo Psgallery 
Save-PSResource -Name Dynpar   -Repo Psgallery 
Save-PSResource -Name PSNotebook   -Repo Psgallery 
Save-PSResource -Name PSMath   -Repo Psgallery 
Save-PSResource -Name DataQuery   -Repo Psgallery 
Save-PSResource -Name HorkerTemplateEngine  -Repo Psgallery 
Save-PSResource -Name Indented.Net.Ip  -Repo Psgallery 
Save-PSResource -Name PoshNmap  -Repo Psgallery 
Save-PSResource -Name PSFzf   -Repo Psgallery 
Save-PSResource -Name completionpredictor   -Repo Psgallery 
Save-PSResource -Name Yayaml  -Repo Psgallery 
Save-PSResource -Name pstcpip  -Repo Psgallery 
Save-PSResource -Name TabExpansion++  -Repo Psgallery 
Save-PSResource -Name StageCoder  -Repo Psgallery 
Save-PSResource -Name PSGraph  -Repo Psgallery 
Save-PSResource -Name Posh  -Repo Psgallery 
Save-PSResource -Name Z  -Repo Psgallery 
Save-PSResource -Name MaintainModule  -Repo Psgallery 
Save-PSResource -Name SecretManagement.1Password  -Repo Psgallery 

Save-PSResource -Name  JustinGrote.Microsoft.Graph.Extensions  -Repo Psgallery 
Save-PSResource -Name  psnotes   -Repo Psgallery 
Save-PSResource -Name  psdates   -Repo Psgallery 
Save-PSResource -Name  UsefulArgumentCompleters   -Repo Psgallery 
Save-PSResource -Name  Microsoft.PowerShell.whatsnew   -Repo Psgallery 
Save-PSResource -Name  OpenSSL   -Repo Psgallery  -AllowClobber
Save-PSResource -Name  Sampler   -Repo Psgallery 
Save-PSResource -Name  Fsharp  -Repo Psgallery 
Save-PSResource -Name  ModuleBuild  -Repo Psgallery 
Save-PSResource -Name  ModuleBuilder  -Repo Psgallery 
Save-PSResource -Name Microsoft.PowerShell.SecretManagement   -Repo Psgallery 
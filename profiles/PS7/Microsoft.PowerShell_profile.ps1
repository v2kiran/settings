Set-Location c:\gh -ErrorAction Stop
Import-Module oh-my-posh
Set-Theme Paradox

if ($env:wt_session)
{
  #theme Cobalt2
  Set-PSReadLineOption -Colors @{
    Parameter = 'DarkCyan'
    Type      = 'DarkCyan'
    Variable  = "#FF69B4" # hot pink
    Number    = '#A9A9A9'
    Operator  = 'white'
    String    = "$([char]0x1b)[38;5;100m"
    member    = "#FF7F50" # coral
    default   = 'DarkGreen'
    #default   = '#8181f7' # purple
  }
}

#psdefault values
#$PSDefaultParameterValues.Add('Out-Default:OutVariable', 'Lastout')
# this imports the bookmarks
#import-folderbookmark

Import-Module oh-my-posh
Set-Theme Paradox

# Goto location
cd c:\gh

if ($env:wt_session)
{
  # theme AdventureTime
  Set-PSReadLineOption -Colors @{
    Parameter = 'Blue'
    Type      = 'Blue'
    Variable  = "#FF69B4" # hot pink
    Number    = 'cyan'
    Operator  = 'white'
    String    = "$([char]0x1b)[38;5;100m"
    member    = "#FF7F50" # coral
    default   = 'DarkGreen'
    #default   = '#8181f7' # purple
  }
}
else
{
  Set-PSReadLineOption -Colors @{
    Parameter = 'DarkMagenta'     # cyan - #20B2AA
    Command   = "DarkYellow"
    Type      = 'DarkMagenta'
    Variable  = "#FF69B4" # hot pink
    Number    = '#EEE8AA'
    Operator  = 'white'
    String    = "$([char]0x1b)[38;5;100m"
    member    = "#FF7F50" # coral
    default   = 'DarkGreen'
  }
}
👌
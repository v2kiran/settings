Set-PSReadLineOption -Colors @{
  Parameter = 'DarkCyan'     # cyan - #20B2AA
  Command   = "#FFD700"
  Type      = 'DarkCyan'
  Variable  = "#FF69B4" # hot pink
  Number    = '#EEE8AA'
  Operator  = 'white'
  String    = "$([char]0x1b)[38;5;100m"
  member    = "#FF7F50" # coral
  default   = 'DarkGreen'
}
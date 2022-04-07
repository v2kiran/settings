
# Install neovim
choco install neovim


# Install Plug.vim
$plug_vim_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim';
Invoke-WebRequest -useb $plug_vim_url |
    New-Item "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

# Set environment variables
[System.Environment]::SetEnvironmentVariable('plug_vim', "$env:LOCALAPPDATA\nvim-data\site\autoload\plug.vim", 'User')

$init_vim_data = @'
call plug#begin('C:/Users/Kiran/AppData/Local/nvim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'pprovost/vim-ps1'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
'@

$coc_settings = @"
{
    "coc.preferences.formatOnSaveFiletypes": ["powershell", "typescript", "json"],
    "powershell.integratedConsole.showOnStartup": false
}
"@

# Create the nvim folder
$nvim_folder = "$env:LOCALAPPDATA\nvim"
$nvim_init_vim = "$env:LOCALAPPDATA\nvim\init.vim"
$coc_settings_file = "$env:LOCALAPPDATA\nvim\coc-settings.json"


if ( (Test-Path $nvim_folder) -eq $false)
{
    New-Item $nvim_folder -type directory -Force
}
# Create init.vim file
if ( (Test-Path $nvim_init_vim) -eq $false)
{
    New-Item $nvim_init_vim -type file -Force -Value $init_vim_data
}

# -------------------------------------------------------------------------------------------------------------

# Install plugins defined in init.vim
# run nvim and then ": PlugInstall"

# install powershell language server - https://github.com/coc-extensions/coc-powershell
#use :CocInstall coc-powershell

# disable showing powershell terminal automatically while editing a ps file
# Create init.vim file
if ( (Test-Path $coc_settings_file) -eq $false)
{
    New-Item $coc_settings_file -type file -Force -Value $coc_settings
}

# -------------------------------------------------------------------------------------------------------------

# Install coc-snippets
# :CocInstall coc-snippets

# complete setup
# https://betterprogramming.pub/setting-up-neovim-for-web-development-in-2020-d800de3efacd

# sample init.vim file
# https://robindouglas.uk/powershell/vim/2018/04/05/PowerShell-with-Vim.html

<#
:CocUninstall coc-css
 :CocUpdate
#>

# If chocolatey not installed
## Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# `choco uninstall xxx --skip-powershell --skip-autouninstaller` is used to make choco no longer manage the application 
# > Use case: to prevent managing software that automatically updates, alternative is to pin

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) 
{ Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
ECHO "Installing apps via Chocolatey"
choco feature enable -n allowGlobalConfirmation

# MISC
choco install chocolateygui
choco install qbittorrent
choco install autohotkey

# PERIPHERAL
choco install lghub
choco uninstall lghub --skip-powershell --skip-autouninstaller

# WINDOWS
choco install shutup10 # "OOSU10" > win+R
choco install defaultprogramseditor

# EDITORS
choco install firacode # Font for editors
choco install vscode
choco uninstall vscode --skip-powershell --skip-autouninstaller
choco install notepadplusplus
choco install 7zip

# MEDIA
choco install k-litecodecpackfull
choco install paint.net
choco install wincdemu
choco install spotify
choco uninstall spotify --skip-powershell --skip-autouninstaller

# BROWSERS
choco install firefox
choco uninstall firefox --skip-powershell --skip-autouninstaller

# DEV
choco install git
choco install gradle
choco install python
choco install nvm
choco install dotnet-sdk
choco install openjdk

# DEV-OPS
choco install sysinternals
choco install putty
choco install speccy
#choco install ilspy 

# GAMING
choco install nvidia-app
choco pin add -n nvidia-app # pinning this since geforce experience uninstall seemed off
choco install steam
choco uninstall steam --skip-powershell --skip-autouninstaller
choco install discord
choco uninstall discord --skip-powershell --skip-autouninstaller

# Cleaning up
choco feature disable -n allowGlobalConfirmation

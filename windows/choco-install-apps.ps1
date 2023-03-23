# If chocolatey not installed
## Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) 
{ Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
ECHO "Installing apps via Chocolatey"
choco feature enable -n allowGlobalConfirmation

# MISC
choco install chocolateygui
choco install qbittorrent
choco install autohotkey
choco install wsl2

# PERIPHERAL
choco install lghub

# WINDOWS
choco install shutup10 # "OOSU10" > win+R
choco install defaultprogramseditor

# EDITORS
choco install firacode # Font for editors
choco install visualstudiocode
choco install notepadplusplus # \/ makes it default editor
choco install 7zip

# MEDIA
choco install k-litecodecpackfull
choco install paint.net
choco install wincdemu
choco install spotify

# BROWSERS
choco install firefox
choco install tor-browser

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
choco install geforce-experience
choco install steam
choco install discord

# Cleaning up
choco feature disable -n allowGlobalConfirmation

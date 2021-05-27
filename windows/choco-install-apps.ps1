# If chocolatey not installed
## Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) 
{ Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
ECHO "Installing apps via Chocolatey"
choco feature enable -n allowGlobalConfirmation

# MISC
choco install shutup10 # "OOSU10" > win+R
choco install microsoft-teams
choco install qbittorrent

# EDITORS
choco install firacode # Font for editors
choco install visualstudiocode
choco install notepadplusplus # \/ makes it default editor
cmd /c 'reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe" /v "Debugger" /t REG_SZ /d "\"%ProgramFiles%\Notepad++\notepad++.exe\" -notepadStyleCmdline -z" /f'
choco install 7zip

# MEDIA
choco install k-litecodecpackfull
choco install paint.net
# choco install spotify # I've it through windows store

# BROWSERS
choco install firefox
choco install tor-browser 

# DEV
choco install git
choco install fiddler
choco install gradle
#choco install mongodb
choco install python3
choco install autohotkey
# Cxx
choco install nugetpackageexplorer
choco install linqpad
## NODE
choco install nodejs
choco install yeoman

# DEVOPS
choco install sysinternals
choco install putty
choco install ccleaner
choco install speccy
choco install filezilla
#choco install ilspy 
choco install malwarebytes

# GAMING
choco install geforce-experience
choco install steam-client
choco install discord

# Cleaning up
choco feature disable -n allowGlobalConfirmation

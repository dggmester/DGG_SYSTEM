[System.Windows.Forms.Application]::EnableVisualStyles()
$ErrorActionPreference        = 'SilentlyContinue'
$wshell                       = New-Object -ComObject Wscript.Shell
$Button                       = [System.Windows.MessageBoxButton]::YesNoCancel
$ErrorIco                     = [System.Windows.MessageBoxImage]::Error
$programf86                   = 'C:\Program Files (x86)'
$programf                     = 'C:\Program Files'
$chrome                       = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
$firefox                      = 'C:\Program Files\Mozilla Firefox\firefox.exe'
$thunderbird                  = 'C:\Program Files\Mozilla Thunderbird\thunderbird.exe'
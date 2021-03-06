#Requires -RunAsAdministrator

# Download and install Firefox silently.
$address = 'https://download.mozilla.org/?product=firefox-msi-latest-ssl&os=win64&lang=en-US'
$program = [System.IO.Path]::Combine($env:TEMP, 'FirefoxSetup.msi')
(New-Object System.Net.WebClient).DownloadFile($address, $program)
Start-Process -FilePath 'msiexec.exe' -ArgumentList "/i `"$program`" /qn DESKTOP_SHORTCUT=false INSTALL_MAINTENANCE_SERVICE=false" -NoNewWindow -Wait
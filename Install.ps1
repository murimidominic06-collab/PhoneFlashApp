$WshShell = New-Object -ComObject WScript.Shell
# Desktop
$Shortcut = $WshShell.CreateShortcut("$env:USERPROFILE\Desktop\PhoneFlashApp.lnk")
$Shortcut.TargetPath = "powershell.exe"
$Shortcut.Arguments = "-ExecutionPolicy Bypass -File G:\PhoneFlashApp\FlashApp.ps1"
$Shortcut.WorkingDirectory = "G:\PhoneFlashApp\"
$Shortcut.IconLocation = "G:\PhoneFlashApp\logo.ico"
$Shortcut.Save()

# Start Menu
$StartMenuPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\PhoneFlashApp.lnk"
$Shortcut2 = $WshShell.CreateShortcut($StartMenuPath)
$Shortcut2.TargetPath = "powershell.exe"
$Shortcut2.Arguments = "-ExecutionPolicy Bypass -File G:\PhoneFlashApp\FlashApp.ps1"
$Shortcut2.WorkingDirectory = "G:\PhoneFlashApp\"
$Shortcut2.IconLocation = "G:\PhoneFlashApp\logo.ico"
$Shortcut2.Save()

Write-Host "Installed! Check Desktop and Start Menu" -ForegroundColor Green

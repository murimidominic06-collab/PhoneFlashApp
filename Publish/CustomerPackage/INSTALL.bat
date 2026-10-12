@echo off
echo Installing PhoneFlashApp PAID 1000 KES...
mkdir "C:\PhoneFlashApp" 2>nul
copy PhoneFlashApp_PAID_1000KES.exe "C:\PhoneFlashApp\" /Y
copy price.txt "C:\PhoneFlashApp\" /Y
copy bank_details.txt "C:\PhoneFlashApp\" /Y
echo [Desktop Entry] > NUL
echo [Shortcut] Creating desktop icon...
powershell "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%USERPROFILE%\Desktop\PhoneFlashApp PAID.lnk'); $Shortcut.TargetPath = 'C:\PhoneFlashApp\PhoneFlashApp_PAID_1000KES.exe'; $Shortcut.Save()"

echo Installed! Price: 1000 KES
echo Check Desktop icon: PhoneFlashApp PAID
pause

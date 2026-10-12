@echo off
set /p newprice="Enter new price (e.g. 1500): "
echo %newprice% > G:\PhoneFlashApp\price.txt
echo Price changed to %newprice% KES
echo Now rebuilding EXE...
powershell -Command "Invoke-ps2exe 'G:\PhoneFlashApp\FlashApp_BankPaid.ps1' 'G:\PhoneFlashApp\Publish\PhoneFlashApp_PAID_%newprice%KES.exe' -noConsole"
pause

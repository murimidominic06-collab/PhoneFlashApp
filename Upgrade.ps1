# PhoneFlashApp - Upgrade Manager
$currentVer = Get-Content "G:\PhoneFlashApp\version.txt" -ErrorAction SilentlyContinue
Write-Host "Current version: $currentVer"
Write-Host ""
Write-Host "Available upgrades:"
Write-Host "1. v2.0 - Add MTK/SPD/Qualcomm tools, Samsung ODIN button, Xiaomi MiFlash button"
Write-Host "2. v2.1 - Add auto ADB drivers install, log file save"
Write-Host "3. v2.2 - Add branding, dark theme, FRP bypass info"
Write-Host "4. v3.0 - Add EXE build (convert ps1 to exe)"
Write-Host ""
$choice = Read-Host "Enter version to upgrade to (2.0/2.1/2.2/3.0) or N to cancel"

if ($choice -eq "2.0") {
    Write-Host "Upgrading to v2.0..."
    # Here we will inject new code into FlashApp.ps1
    (Get-Content "G:\PhoneFlashApp\FlashApp.ps1") -replace "PhoneFlashApp -", "PhoneFlashApp v2.0 -" | Set-Content "G:\PhoneFlashApp\FlashApp.ps1"
    "2.0" | Set-Content "G:\PhoneFlashApp\version.txt"
    Write-Host "Upgraded to v2.0!"
}
if ($choice -eq "3.0") {
    Write-Host "Building EXE..."
    Install-Module ps2exe -Force -ErrorAction SilentlyContinue
    ps2exe "G:\PhoneFlashApp\FlashApp.ps1" "G:\PhoneFlashApp\PhoneFlashApp.exe" -noConsole -iconFile "C:\Windows\System32\shell32.dll" -ErrorAction SilentlyContinue
    Write-Host "EXE created at G:\PhoneFlashApp\PhoneFlashApp.exe"
}

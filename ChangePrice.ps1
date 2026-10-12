$current = Get-Content "G:\PhoneFlashApp\price.txt"
Write-Host "Current price: $current KES"
$newPrice = Read-Host "Enter new price (e.g., 1500, 2000, 500)"
if ($newPrice) {
    $newPrice | Set-Content "G:\PhoneFlashApp\price.txt" -Force
    Write-Host "Price changed to $newPrice KES - App will show new price instantly!" -ForegroundColor Green
    # Rebuild EXE with new price
    Install-Module ps2exe -Force -Scope CurrentUser -ErrorAction SilentlyContinue
    Invoke-ps2exe "G:\PhoneFlashApp\FlashApp.ps1" "G:\PhoneFlashApp\Publish\PhoneFlashApp.exe" -noConsole -ErrorAction SilentlyContinue
    Write-Host "New EXE built with price $newPrice"
}

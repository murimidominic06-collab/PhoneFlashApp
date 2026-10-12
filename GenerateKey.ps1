$secret = "PhoneFlashApp2026SecretKey"
$price = Get-Content "G:\PhoneFlashApp\price.txt"
Write-Host "=== LICENSE KEY GENERATOR ==="
Write-Host "Current Price: $price KES"
$customerID = Read-Host "Enter customer PC ID or Phone number to generate key"
if (!$customerID) { $customerID = "DEMO" }
$raw = "$customerID-$secret"
$bytes = [System.Text.Encoding]::UTF8.GetBytes($raw)
$hash = [System.Security.Cryptography.SHA256]::Create().ComputeHash($bytes)
$key = [BitConverter]::ToString($hash).Replace("-","").Substring(0,16)
$keyFormatted = "$($key.Substring(0,4))-$($key.Substring(4,4))-$($key.Substring(8,4))-$($key.Substring(12,4))"
Write-Host ""
Write-Host "KEY FOR $customerID : $keyFormatted" -ForegroundColor Green
Write-Host "Price paid: $price KES" -ForegroundColor Yellow
$keyFormatted | Set-Clipboard
Write-Host "Key copied to clipboard!"
Read-Host "Press Enter to generate another or close"

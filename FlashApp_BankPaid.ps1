$pricePath = "G:\PhoneFlashApp\price.txt"
$bankPath = "G:\PhoneFlashApp\bank_details.txt"
$licensePath = "G:\PhoneFlashApp\license.key"

$price = "1000"
if (Test-Path $pricePath) { $price = Get-Content $pricePath }
$bankInfo = "BANK: Equity Bank Kenya`r`nACCOUNT: YOUR NUMBER`r`nM-PESA: YOUR NUMBER`r`nPRICE: $price KES"
if (Test-Path $bankPath) { $bankInfo = Get-Content $bankPath -Raw }

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "PhoneFlashApp PAID - $price KES"
$form.Size = New-Object System.Drawing.Size(700,550)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::White

$lbl = New-Object System.Windows.Forms.Label
$lbl.Location = New-Object System.Drawing.Point(10,10)
$lbl.Size = New-Object System.Drawing.Size(660,180)
$lbl.Text = "PAY $price KES TO ACTIVATE`r`n`r`n$bankInfo`r`n`r`nAfter payment, WhatsApp receipt to get license key"
$lbl.Font = New-Object System.Drawing.Font("Arial",11,[System.Drawing.FontStyle]::Bold)
$lbl.ForeColor = [System.Drawing.Color]::Black
$form.Controls.Add($lbl)

$txtKey = New-Object System.Windows.Forms.TextBox
$txtKey.Location = New-Object System.Drawing.Point(10,200)
$txtKey.Size = New-Object System.Drawing.Size(400,30)
$txtKey.Font = New-Object System.Drawing.Font("Arial",12)
$txtKey.Text = "Enter License Key"
$form.Controls.Add($txtKey)

$btn = New-Object System.Windows.Forms.Button
$btn.Location = New-Object System.Drawing.Point(420,200)
$btn.Size = New-Object System.Drawing.Size(250,30)
$btn.Text = "ACTIVATE - $price KES"
$btn.BackColor = [System.Drawing.Color]::Green
$btn.ForeColor = [System.Drawing.Color]::White
$btn.Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Bold)
$form.Controls.Add($btn)

$lblStatus = New-Object System.Windows.Forms.Label
$lblStatus.Location = New-Object System.Drawing.Point(10,250)
$lblStatus.Size = New-Object System.Drawing.Size(660,100)
$lblStatus.Text = "Status: Not activated. Pay $price KES then enter key."
$lblStatus.Font = New-Object System.Drawing.Font("Arial",10)
$form.Controls.Add($lblStatus)

$btn.Add_Click({
  $k = $txtKey.Text.Trim()
  if ($k.Length -gt 10) {
    Set-Content -Path $licensePath -Value $k -Force
    [System.Windows.Forms.MessageBox]::Show("Activated! Close and reopen your main FlashApp.","Success")
    $form.Close()
  } else {
    [System.Windows.Forms.MessageBox]::Show("Invalid key. Pay $price KES first.","Error")
  }
})

$form.ShowDialog()

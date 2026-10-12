# OWNER FREE - No payment check
$isOwner = $true  # Wewe ni owner

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "PhoneFlashApp v5.0 - OWNER FREE - DESKTOP-S8OLE0D"
$form.Size = New-Object System.Drawing.Size(900,600)
$form.BackColor = [System.Drawing.Color]::FromArgb(45,45,48)
$form.StartPosition = "CenterScreen"

$lbl = New-Object System.Windows.Forms.Label
$lbl.Text = "OWNER MODE - FREE - DOMINIC M. JOHN - No Payment Needed"
$lbl.ForeColor = [System.Drawing.Color]::Lime
$lbl.Font = New-Object System.Drawing.Font("Arial",11,[System.Drawing.FontStyle]::Bold)
$lbl.Location = New-Object System.Drawing.Point(20,15)
$lbl.Size = New-Object System.Drawing.Size(600,25)
$form.Controls.Add($lbl)

$btn1 = New-Object System.Windows.Forms.Button
$btn1.Text = "FORMAT PHONE"
$btn1.BackColor = [System.Drawing.Color]::Red
$btn1.ForeColor = [System.Drawing.Color]::White
$btn1.Location = New-Object System.Drawing.Point(20,480)
$btn1.Size = New-Object System.Drawing.Size(400,60)
$btn1.Add_Click({ [System.Windows.Forms.MessageBox]::Show("Phone Formatted! - OWNER FREE","Success") })
$form.Controls.Add($btn1)

$btn2 = New-Object System.Windows.Forms.Button
$btn2.Text = "RECOVERY WIPE"
$btn2.BackColor = [System.Drawing.Color]::Orange
$btn2.Location = New-Object System.Drawing.Point(440,480)
$btn2.Size = New-Object System.Drawing.Size(400,60)
$btn2.Add_Click({ [System.Windows.Forms.MessageBox]::Show("Wipe Done! - OWNER FREE","Success") })
$form.Controls.Add($btn2)

$form.ShowDialog()

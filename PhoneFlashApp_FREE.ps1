Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$form = New-Object System.Windows.Forms.Form
$form.Text = "PhoneFlashApp FREE v5.0"
$form.Size = New-Object System.Drawing.Size(900,600)
$form.BackColor = [System.Drawing.Color]::FromArgb(60,60,60)

$btn1 = New-Object System.Windows.Forms.Button
$btn1.Text = "FORMAT PHONE"
$btn1.BackColor = [System.Drawing.Color]::Red
$btn1.ForeColor = [System.Drawing.Color]::White
$btn1.Location = New-Object System.Drawing.Point(20,450)
$btn1.Size = New-Object System.Drawing.Size(400,60)
$btn1.Add_Click({ [System.Windows.Forms.MessageBox]::Show("Phone Format Started!") })
$form.Controls.Add($btn1)

$btn2 = New-Object System.Windows.Forms.Button
$btn2.Text = "RECOVERY WIPE"
$btn2.BackColor = [System.Drawing.Color]::Orange
$btn2.Location = New-Object System.Drawing.Point(450,450)
$btn2.Size = New-Object System.Drawing.Size(400,60)
$btn2.Add_Click({ [System.Windows.Forms.MessageBox]::Show("Wipe Started!") })
$form.Controls.Add($btn2)

$form.ShowDialog()

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$adb = "G:\PhoneFlashApp\Tools\platform-tools\adb.exe"
$fb = "G:\PhoneFlashApp\Tools\platform-tools\fastboot.exe"
$bgPath = "G:\PhoneFlashApp\background.png"
$logPath = "G:\PhoneFlashApp\logs\log_$(Get-Date -Format yyyy-MM-dd_HH-mm-ss).txt"
$version = "4.0 - PHONES BACKGROUND"

$form = New-Object System.Windows.Forms.Form
$form.Text = "PhoneFlashApp $version - G:\PhoneFlashApp"
$form.Size = New-Object System.Drawing.Size(1100,850)
$form.StartPosition = "CenterScreen"

# ADD BACKGROUND IMAGE OF PHONES
if (Test-Path $bgPath) {
    try {
        $img = [System.Drawing.Image]::FromFile($bgPath)
        $form.BackgroundImage = $img
        $form.BackgroundImageLayout = "Stretch"
    } catch {}
} else {
    $form.BackColor = [System.Drawing.Color]::FromArgb(30,30,35)
}

# Semi-transparent panel for controls
$panel = New-Object System.Windows.Forms.Panel
$panel.Location = New-Object System.Drawing.Point(10,10)
$panel.Size = New-Object System.Drawing.Size(1060,830)
$panel.BackColor = [System.Drawing.Color]::FromArgb(180,0,0,0)
$form.Controls.Add($panel)

$title = New-Object System.Windows.Forms.Label
$title.Location = New-Object System.Drawing.Point(10,10)
$title.Size = New-Object System.Drawing.Size(1040,30)
$title.Text = "PhoneFlashApp $version | PHONES BACKGROUND EDITION | G:\"
$title.Font = New-Object System.Drawing.Font("Consolas",12,[System.Drawing.FontStyle]::Bold)
$title.ForeColor = [System.Drawing.Color]::Lime
$title.BackColor = [System.Drawing.Color]::Transparent
$panel.Controls.Add($title)

$txt = New-Object System.Windows.Forms.TextBox
$txt.Location = New-Object System.Drawing.Point(10,50)
$txt.Size = New-Object System.Drawing.Size(1040,400)
$txt.Multiline = $true
$txt.ScrollBars = "Vertical"
$txt.Font = New-Object System.Drawing.Font("Consolas",10)
$txt.BackColor = [System.Drawing.Color]::FromArgb(220,0,0,0)
$txt.ForeColor = [System.Drawing.Color]::White
$txt.Text = "PhoneFlashApp $version`r`nBACKGROUND: Phones + Tools pattern`r`n`r`nNOT ROOTED = Only FORMAT and RECOVERY work`r`nROOTED = All work`r`n`r`nWaiting for phone...`r`n"
$panel.Controls.Add($txt)

$lbl = New-Object System.Windows.Forms.Label
$lbl.Location = New-Object System.Drawing.Point(10,460)
$lbl.Size = New-Object System.Drawing.Size(1040,30)
$lbl.Text = "Status: AUTO DETECTING - Connect phone..."
$lbl.Font = New-Object System.Drawing.Font("Arial",11,[System.Drawing.FontStyle]::Bold)
$lbl.ForeColor = [System.Drawing.Color]::Red
$lbl.BackColor = [System.Drawing.Color]::Transparent
$panel.Controls.Add($lbl)

# Buttons Row 1
$btnRemove = New-Object System.Windows.Forms.Button
$btnRemove.Location = New-Object System.Drawing.Point(10,500)
$btnRemove.Size = New-Object System.Drawing.Size(330,70)
$btnRemove.Text = "REMOVE PASSWORD`r`n(ROOTED ONLY)"
$btnRemove.BackColor = [System.Drawing.Color]::LightBlue
$btnRemove.Enabled = $false
$panel.Controls.Add($btnRemove)

$btnFormat = New-Object System.Windows.Forms.Button
$btnFormat.Location = New-Object System.Drawing.Point(360,500)
$btnFormat.Size = New-Object System.Drawing.Size(330,70)
$btnFormat.Text = "FORMAT COMPLETELY`r`nREAL WIPE - NOT ROOTED OK"
$btnFormat.BackColor = [System.Drawing.Color]::Red
$btnFormat.ForeColor = [System.Drawing.Color]::White
$btnFormat.Enabled = $false
$panel.Controls.Add($btnFormat)

$btnRec = New-Object System.Windows.Forms.Button
$btnRec.Location = New-Object System.Drawing.Point(710,500)
$btnRec.Size = New-Object System.Drawing.Size(340,70)
$btnRec.Text = "RECOVERY WIPE`r`n100% NOT ROOTED"
$btnRec.BackColor = [System.Drawing.Color]::Orange
$btnRec.Enabled = $false
$panel.Controls.Add($btnRec)

# Row 2
$btnSamsung = New-Object System.Windows.Forms.Button
$btnSamsung.Location = New-Object System.Drawing.Point(10,580)
$btnSamsung.Size = New-Object System.Drawing.Size(250,60)
$btnSamsung.Text = "SAMSUNG`r`nDownload Mode"
$btnSamsung.BackColor = [System.Drawing.Color]::FromArgb(0,102,204)
$btnSamsung.ForeColor = [System.Drawing.Color]::White
$panel.Controls.Add($btnSamsung)

$btnDrivers = New-Object System.Windows.Forms.Button
$btnDrivers.Location = New-Object System.Drawing.Point(275,580)
$btnDrivers.Size = New-Object System.Drawing.Size(250,60)
$btnDrivers.Text = "CHECK DRIVERS"
$btnDrivers.BackColor = [System.Drawing.Color]::Gray
$btnDrivers.ForeColor = [System.Drawing.Color]::White
$panel.Controls.Add($btnDrivers)

$btnManual = New-Object System.Windows.Forms.Button
$btnManual.Location = New-Object System.Drawing.Point(540,580)
$btnManual.Size = New-Object System.Drawing.Size(250,60)
$btnManual.Text = "FORCE RE-DETECT"
$btnManual.BackColor = [System.Drawing.Color]::LightGreen
$panel.Controls.Add($btnManual)

$btnSave = New-Object System.Windows.Forms.Button
$btnSave.Location = New-Object System.Drawing.Point(805,580)
$btnSave.Size = New-Object System.Drawing.Size(245,60)
$btnSave.Text = "OPEN LOGS FOLDER"
$btnSave.BackColor = [System.Drawing.Color]::Black
$btnSave.ForeColor = [System.Drawing.Color]::White
$panel.Controls.Add($btnSave)

$btnClear = New-Object System.Windows.Forms.Button
$btnClear.Location = New-Object System.Drawing.Point(10,650)
$btnClear.Size = New-Object System.Drawing.Size(510,50)
$btnClear.Text = "CLEAR LOG"
$panel.Controls.Add($btnClear)

$btnExit = New-Object System.Windows.Forms.Button
$btnExit.Location = New-Object System.Drawing.Point(540,650)
$btnExit.Size = New-Object System.Drawing.Size(510,50)
$btnExit.Text = "EXIT & SAVE LOG"
$panel.Controls.Add($btnExit)

$ver = New-Object System.Windows.Forms.Label
$ver.Location = New-Object System.Drawing.Point(10,710)
$ver.Size = New-Object System.Drawing.Size(1040,50)
$ver.Text = "v4.0 BACKGROUND EDITION - Background: G:\PhoneFlashApp\background.png - App: G:\PhoneFlashApp\FlashApp.ps1 - Logs: G:\PhoneFlashApp\logs\"
$ver.ForeColor = [System.Drawing.Color]::Silver
$ver.BackColor = [System.Drawing.Color]::Transparent
$panel.Controls.Add($ver)

function Write-Log($msg){ $txt.AppendText("$(Get-Date -Format HH:mm:ss) - $msg`r`n"); try{ "$(Get-Date) - $msg" | Out-File $logPath -Append }catch{} }

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 2000
$timer.Add_Tick({
 try {
  $adbOut = & $adb devices 2>&1 | Out-String
  $has = $false; foreach($l in $adbOut -split "`r`n"){ if($l -match "device" -and $l -notmatch "List of" -and $l.Trim().Length -gt 5){ $has=$true } }
  if($has -and -not $btnFormat.Enabled){ Write-Log "*** PHONE DETECTED ***"; $lbl.Text="PHONE DETECTED - Ready"; $lbl.ForeColor=[System.Drawing.Color]::Lime; $btnRemove.Enabled=$true; $btnFormat.Enabled=$true; $btnRec.Enabled=$true }
 } catch {}
})

$btnManual.Add_Click({ Write-Log "Re-Detect..."; & $adb kill-server | Out-Null; Start-Sleep 1; & $adb start-server | Out-Null; Write-Log (& $adb devices 2>&1 | Out-String) })
$btnClear.Add_Click({ $txt.Text="Log cleared v4.0`r`n" })
$btnSave.Add_Click({ Invoke-Item "G:\PhoneFlashApp\logs" })
$btnExit.Add_Click({ Write-Log "Exit"; $timer.Stop(); $form.Close() })
$btnSamsung.Add_Click({ Write-Log "Samsung Download Mode"; & $adb reboot download })
$btnDrivers.Add_Click({ Write-Log "Drivers check"; Write-Log (& $adb devices 2>&1 | Out-String) })
$btnRemove.Add_Click({ Write-Log "Remove attempt (rooted only)"; $o=& $adb shell "rm /data/system/locksettings.db*" 2>&1 | Out-String; Write-Log $o; & $adb reboot | Out-Null })
$btnFormat.Add_Click({
 $c=[System.Windows.Forms.MessageBox]::Show("REAL FORMAT - Delete everything?","FORMAT",[System.Windows.Forms.MessageBoxButtons]::YesNo,[System.Windows.Forms.MessageBoxIcon]::Warning)
 if($c -ne "Yes"){return}
 Write-Log "=== REAL FORMAT ==="; & $adb reboot bootloader | Out-Null; Start-Sleep 15; $o=& $fb -w 2>&1 | Out-String; Write-Log $o; $o2=& $fb reboot 2>&1 | Out-String; Write-Log $o2; Write-Log "DONE"
})
$btnRec.Add_Click({ Write-Log "Recovery wipe - Use phone volume keys"; & $adb reboot recovery })

$timer.Start()
$form.ShowDialog()

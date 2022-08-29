#[Console]::OutputEncoding
Add-Type -AssemblyName System.Windows.Forms
Import-Module -Name ..\MODULS\DGG_kernel.psm1 -Verbose

#Add-Type –memberDefinition @'
#[DllImport("user32.dll")] 
#public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow); 
#'@ -name Win32ShowWindowAsync -namespace Win32Functions
#$mode = [Win32Functions.Win32ShowWindowAsync]::ShowWindowAsync((Get-Process –id $pid).MainWindowHandle, 2) #true
#[Win32Functions.Win32ShowWindowAsync]::ShowWindowAsync((Get-Process –id $pid).MainWindowHandle, 10)
[System.Windows.Forms.Application]::EnableVisualStyles()
$ErrorActionPreference        = 'SilentlyContinue'
$wshell                       = New-Object -ComObject Wscript.Shell
$Button                       = [System.Windows.MessageBoxButton]::YesNoCancel
$ErrorIco                     = [System.Windows.MessageBoxImage]::Error

# GUI Specs
$programf86                   = 'C:\Program Files (x86)'
$programf                     = 'C:\Program Files'
$chrome                       = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
$firefox                      = 'C:\Program Files\Mozilla Firefox\firefox.exe'
$thunderbird                  = 'C:\Program Files\Mozilla Thunderbird\thunderbird.exe'

$Form                                          = New-Object system.Windows.Forms.Form
$Form.ClientSize                               = New-Object System.Drawing.Point(500,400) #magasság,szélesség
#$Form.ClientSize                              = '500, 500'
$Form.text                                     = "DGG System"
$Form.StartPosition                            = "CenterScreen"
$Form.TopMost                                  = $false
$Form.BackColor                                = [System.Drawing.ColorTranslator]::FromHtml("#e9e9e9")
$Form.AutoScaleDimensions                      = '192, 192'
$Form.AutoScaleMode                            = "Dpi"
$Form.AutoSize                                 = $true
$Form.AutoScroll                               = $True
 
$Form.FormBorderStyle                          = 'FixedSingle'

$Form.Width                                    = $objImage.Width
$Form.Height                                   = $objImage.Height

$Panel1                                        = New-Object system.Windows.Forms.Panel
$Panel1.height                                 = 500
$Panel1.width                                  = 500
$Panel1.location                               = New-Object System.Drawing.Point(0,0)

$a_0=5
$margin_left=5
$d=85

$dgg_AdBlock           = CreateItem "Reklám védelem" "Button" 80 12 $margin_left $a_0
$a_0=$a_0+$d
$dgg_InstCenter        = CreateItem "Telepítõ központ" "Button" 80 12 $margin_left $a_0
$a_0=$a_0+$d
$dgg_Commander         = CreateItem "Commander(TC, DC)" "Button" 80 12 $margin_left $a_0
$a_0=$a_0+$d
$dgg_Theme             = CreateItem "Témakezelõ" "Button" 80 12 $margin_left $a_0
$a_0=$a_0+$d
$dgg_Energy            = CreateItem "Fõkapcsoló kezelés" "Button" 80 12 $margin_left $a_0
$margin_left=95
$a_0=5
$dgg_Update            = CreateItem "Frissítések, Driverek" "Button" 80 12 $margin_left $a_0
$a_0=$a_0+$d
$dgg_tools             = CreateItem "Felügyeleti eszközök" "Button" 80 12 $margin_left $a_0
$a_0=$a_0+$d

#jobb oldali oszlop
$a_0=5
$margin_left=500-80-5

$dgg_Cell              = CreateItem "Cell(letíltva újra gondolás miatt)" "Button" 80 12 $margin_left $a_0
$dgg_Cell.Enabled      = $False
$a_0=$a_0+$d
$dgg_Network           = CreateItem "Hálózati eszközök" "Button" 80 12 $margin_left $a_0
$a_0=$a_0+$d
$dgg_Diag              = CreateItem "Rendszer diagnosztika" "Button" 80 12 $margin_left $a_0
$a_0=$a_0+$d
$dgg_Red               = CreateItem "RED edition letöltése" "Button" 80 12 $margin_left $a_0
$a_0=$a_0+$d
$dgg_DGGConect         = CreateItem "DGG hálózat beléptetés" "Button" 80 12 $margin_left $a_0
$margin_left=500-80-95-5
$a_0=5
$dgg_Extra             = CreateItem "Extrák" "Button" 80 12 $margin_left $a_0
$a_0=$a_0+$d
$dgg_Support           = CreateItem "Support" "Button" 80 12 $margin_left $a_0
$a_0=$a_0+$d

$Form.controls.AddRange(@($Panel1))
$Panel1.controls.AddRange(@($dgg_AdBlock,$dgg_InstCenter,$dgg_Commander,$dgg_Theme,$dgg_Energy,$dgg_Update,$dgg_tools,$dgg_Cell,$dgg_Network,$dgg_Diag,$dgg_Red,$dgg_DGGConect,$dgg_Extra,$dgg_Support))

$dgg_AdBlock.Add_Click({
	start-process powershell -argument "-windowstyle hidden ../SCRIPTS/dgg_AdBlock.ps1"
})

$dgg_InstCenter.Add_Click({
	start-process powershell -argument "-windowstyle hidden ../SCRIPTS/dgg_InstCenter.ps1"
})

$dgg_Cell.Add_Click({
	#Start-Process powershell -argument "-NoProfile -ExecutionPolicy Bypass -File ./dgg_cell.ps1" -Verb RunAs
	start-process powershell -argument "-windowstyle hidden ./DGG_Cell.ps1"
})

[void]$Form.ShowDialog()
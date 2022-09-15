$ROOT = Split-Path $MyInvocation.MyCommand.Path -Parent
Add-Type -AssemblyName System.Windows.Forms
Import-Module -Name $ROOT\MODULS\DGG_kernel.psm1 -Verbose
Import-Module -Name $ROOT\config.psm1 -Verbose

Write-Host "Checking winget..."
# Check if winget is installed
if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){
    'Winget Already Installed'
}  
else{
    # Installing winget from the Microsoft Store
	Write-Host "Winget not found, installing it now."
    $ResultText.text = "`r`n" +"`r`n" + "Installing Winget... Please Wait"
	Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
	$nid = (Get-Process AppInstaller).Id
	Wait-Process -Id $nid
	Write-Host Winget Installed
    $ResultText.text = "`r`n" +"`r`n" + "Winget Installed - Ready for Next Task"
}

$Form                                      = New-Object system.Windows.Forms.Form
#$Form.ClientSize                          = New-Object System.Drawing.Point(750,500) #magasság,szélesség
#$Form.ClientSize                           = New-Object System.Drawing.Point(650,500)
#$Form.ClientSize                           = '650, 500'
$Form.text                                 = "DGG System ::: Install Center"
$Form.StartPosition                        = "CenterScreen"
$Form.TopMost                              = $false
$Form.BackColor                            = [System.Drawing.ColorTranslator]::FromHtml("#e9e9e9")
$Form.AutoScaleDimensions                  = '192, 192'
$Form.AutoScaleMode                        = "Dpi"
$Form.AutoSize                             = $True
$Form.AutoScroll                           = $True
$Form.FormBorderStyle                      = 'FixedSingle'

#Panelek
$x_left         = 0
$y_top          = 0
$margin_left    = 5
$margin_top     = 5
$d_left         = 150
$d_top          = 15

#default, DGG
$Panel_default                                     = New-Object system.Windows.Forms.Panel
$Panel_default.height                              = 250
$Panel_default.width                               = $d_left-$margin_left
$Panel_default.location                            = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))

#Böngészõk
$y_top          = $y_top + 250
$Panel_browsers                                    = New-Object system.Windows.Forms.Panel
$Panel_browsers.height                             = 200
$Panel_browsers.width                              = $d_left-$margin_left
$Panel_browsers.location                           = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))

#MS APPS
$y_top          = $y_top + 200
$Panel_MS                                          = New-Object system.Windows.Forms.Panel
$Panel_MS.height                                   = 125
$Panel_MS.width                                    = $d_left-$margin_left
$Panel_MS.location                                 = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))


#utilities
$x_left          = $x_left + $d_left
$y_top           = 0
$Panel_utilities                                   = New-Object system.Windows.Forms.Panel
$Panel_utilities.height                            = 575
$Panel_utilities.width                             = $d_left-$margin_left
$Panel_utilities.location                          = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))

#media panel
$x_left          = $x_left + $d_left
$y_top           = 0
$Panel_media                                       = New-Object system.Windows.Forms.Panel
$Panel_media.height                                = 300
$Panel_media.width                                 = $d_left-$margin_left
$Panel_media.location                              = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))

#document tools
$y_top          = $y_top + 300
$Panel_docTools                                    = New-Object system.Windows.Forms.Panel
$Panel_docTools.height                             = 275
$Panel_docTools.width                              = $d_left-$margin_left
$Panel_docTools.location                           = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))

$Form.controls.AddRange(@($Panel_default,$Panel_browsers,$Panel_MS,$Panel_utilities,$Panel_media,$Panel_docTools))

#Panelek tartalma
$x_left         = 0
$y_top          = 0
$margin_left    = 5
$margin_top     = 5
$d_left         = 120
$d_top          = 50

#MEDIA:
$x_left         = 0
$y_top          = 0
$Label_media                                = New-Object system.Windows.Forms.Label
$Label_media.text                           = "Media eszközök:"
$Label_media.AutoSize                       = $true
$Label_media.width                          = $d_left-5
$Label_media.height                         = $d_top-5
$Label_media.location                       = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top-5))
$Label_media.Font                           = New-Object System.Drawing.Font('Microsoft Sans Serif',9,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$y_top          = $y_top + 15

$sharex                                             = New-Object system.Windows.Forms.Button
$sharex.text                                        = "ShareX (Screenshots)"
$sharex.width                                       = $d_left-5
$sharex.height                                      = $d_top-5
$sharex.location                                    = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,20)
$sharex.Font                                        = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$imageglass                                             = New-Object system.Windows.Forms.Button
$imageglass.text                                        = "ImageGlass (Image Viewer)"
$imageglass.width                                       = $d_left-5
$imageglass.height                                      = $d_top-5
$imageglass.location                                    = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,20)
$imageglass.Font                                        = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$gimp                                             = New-Object system.Windows.Forms.Button
$gimp.text                                        = "GIMP (Image Editor)"
$gimp.width                                       = $d_left-5
$gimp.height                                      = $d_top-5
$gimp.location                                    = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,20)
$gimp.Font                                        = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$vlc                                             = New-Object system.Windows.Forms.Button
$vlc.text                                        = "VLC"
$vlc.width                                       = $d_left-5
$vlc.height                                      = $d_top-5
$vlc.location                                    = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,20)
$vlc.Font                                        = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$mpc                                             = New-Object system.Windows.Forms.Button
$mpc.text                                        = "Media Player Classic"
$mpc.width                                       = $d_left-5
$mpc.height                                      = $d_top-5
$mpc.location                                    = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,20)
$mpc.Font                                        = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$Panel_media.controls.AddRange(@($Label_media,$sharex,$imageglass,$gimp,$vlc,$mpc))

#document:
$x_left         = 0
$y_top          = 0
$Label_docTools                                = New-Object system.Windows.Forms.Label
$Label_docTools.text                           = "Dokumentum eszközök:"
$Label_docTools.AutoSize                       = $true
$Label_docTools.width                          = $d_left-5
$Label_docTools.height                         = $d_top-5
$Label_docTools.location                       = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top-5))
$Label_docTools.Font                           = New-Object System.Drawing.Font('Microsoft Sans Serif',9,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$y_top          = $y_top + 15

$vscodium                                             = New-Object system.Windows.Forms.Button
$vscodium.text                                        = "VS Codium"
$vscodium.width                                       = $d_left-5
$vscodium.height                                      = $d_top-5
$vscodium.location                                    = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,20)
$vscodium.Font                                        = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$vscode                                             = New-Object system.Windows.Forms.Button
$vscode.text                                        = "VS Code"
$vscode.width                                       = $d_left-5
$vscode.height                                      = $d_top-5
$vscode.location                                    = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,20)
$vscode.Font                                        = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$notepadpp                                             = New-Object system.Windows.Forms.Button
$notepadpp.text                                        = "Notepad++"
$notepadpp.width                                       = $d_left-5
$notepadpp.height                                      = $d_top-5
$notepadpp.location                                    = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,20)
$notepadpp.Font                                        = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$adobereader                                             = New-Object system.Windows.Forms.Button
$adobereader.text                                        = "Adobe Reader DC"
$adobereader.width                                       = $d_left-5
$adobereader.height                                      = $d_top-5
$adobereader.location                                    = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,20)
$adobereader.Font                                        = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$sumatrapdf                                             = New-Object system.Windows.Forms.Button
$sumatrapdf.text                                        = "Sumatra PDF"
$sumatrapdf.width                                       = $d_left-5
$sumatrapdf.height                                      = $d_top-5
$sumatrapdf.location                                    = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,20)
$sumatrapdf.Font                                        = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$Panel_docTools.controls.AddRange(@($Label_docTools,$vscodium,$vscode,$notepadpp,$adobereader,$sumatrapdf))

#DGG eszközök:
$x_left         = 0
$y_top          = 0
$Label_default                                = New-Object system.Windows.Forms.Label
$Label_default.text                           = "DGG eszközök:"
$Label_default.AutoSize                       = $true
$Label_default.width                          = $d_left-5
$Label_default.height                         = $d_top-5
$Label_default.location                       = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top-5))
$Label_default.Font                           = New-Object System.Drawing.Font('Microsoft Sans Serif',9,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$y_top          = $y_top + 15

$dgg_NinitePro                                   = New-Object system.Windows.Forms.Button
$dgg_NinitePro.Enabled                           = $false
$dgg_NinitePro.text                              = "Ninite Indítása(PRO)"
$dgg_NinitePro.width                             = $d_left-5#85
$dgg_NinitePro.height                            = $d_top-5#10
$dgg_NinitePro.location                          = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,0+5)
$dgg_NinitePro.Font                              = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$dgg_NiniteFree                                   = New-Object system.Windows.Forms.Button
$dgg_NiniteFree.text                              = "Ninite Indítása(FREE)"
$dgg_NiniteFree.width                             = $d_left-5#85
$dgg_NiniteFree.height                            = $d_top-5#10
$dgg_NiniteFree.location                          = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,0+5)
$dgg_NiniteFree.Font                              = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$dgg_MSOffice6                                = New-Object system.Windows.Forms.Button
$dgg_MSOffice6.text                           = "MS Office telepítése[old, 6]"
$dgg_MSOffice6.width                          = $d_left-5#85
$dgg_MSOffice6.height                         = $d_top-5#10
$dgg_MSOffice6.location                       = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,0+5)
$dgg_MSOffice6.Font                           = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$dgg_MSOffice7                                = New-Object system.Windows.Forms.Button
$dgg_MSOffice7.text                           = "MS Office telepítése[new, 7]"
$dgg_MSOffice7.width                          = $d_left-5#85
$dgg_MSOffice7.height                         = $d_top-5#10
$dgg_MSOffice7.location                       = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,0+5)
$dgg_MSOffice7.Font                           = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$Panel_default.controls.AddRange(@($Label_default,$dgg_NinitePro,$dgg_NiniteFree,$dgg_MSOffice6,$dgg_MSOffice7))

#MS eszközök:
$x_left         = 0
$y_top          = 0
$Label_MS                                = New-Object system.Windows.Forms.Label
$Label_MS.text                           = "Microsoft APPs:"
$Label_MS.AutoSize                       = $true
$Label_MS.width                          = $d_left-5
$Label_MS.height                         = $d_top-5
$Label_MS.location                       = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top-5))
$Label_MS.Font                           = New-Object System.Drawing.Font('Microsoft Sans Serif',9,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$y_top          = $y_top + 15

$reinstallbloat                                   = New-Object system.Windows.Forms.Button
$reinstallbloat.text                              = "MS Appok újratelepítése"
$reinstallbloat.width                             = $d_left-5#85
$reinstallbloat.height                            = $d_top-5#10
$reinstallbloat.location                          = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,0+5)
$reinstallbloat.Font                              = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$removebloat                                   = New-Object system.Windows.Forms.Button
$removebloat.text                              = "MS Appok törlése"
$removebloat.width                             = $d_left-5#85
$removebloat.height                            = $d_top-5#10
$removebloat.location                          = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,0+5)
$removebloat.Font                              = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$Panel_MS.controls.AddRange(@($Label_MS,$reinstallbloat,$removebloat))

#Browsers:::
$x_left         = 0
$y_top          = 0

$Label_browsers                                    = New-Object system.Windows.Forms.Label
$Label_browsers.text                               = "Web Böngészõk:"
$Label_browsers.AutoSize                           = $true
$Label_browsers.width                              = $d_left-5#85
$Label_browsers.height                             = $d_top-5#10
$Label_browsers.location                           = New-Object System.Drawing.Point($x_left+$margin_left,$y_top+$margin_top)#(0+5,0+5)
$Label_browsers.Font                               = New-Object System.Drawing.Font('Microsoft Sans Serif',9,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$y_top          = $y_top + 15

$brave                                             = New-Object system.Windows.Forms.Button
$brave.text                                        = "Brave Browser"
$brave.width                                       = $d_left-5
$brave.height                                      = $d_top-5
$brave.location                                    = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,20)
$brave.Font                                        = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$firefox                                           = New-Object system.Windows.Forms.Button
$firefox.text                                      = "Firefox"
$firefox.width                                     = $d_left-5
$firefox.height                                    = $d_top-5
$firefox.location                                  = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,35)
$firefox.Font                                      = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$gchrome                                           = New-Object system.Windows.Forms.Button
$gchrome.text                                      = "Google Chrome"
$gchrome.width                                     = $d_left-5
$gchrome.height                                    = $d_top-5
$gchrome.location                                  = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))#(0+5,50)
$gchrome.Font                                      = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$Panel_browsers.controls.AddRange(@($Label_browsers,$brave,$firefox,$gchrome))

#Utils:::
$x_left         = 0
$y_top          = 0

$Label_utilities                          = New-Object system.Windows.Forms.Label
$Label_utilities.text                     = "Utilities:"
$Label_utilities.AutoSize                 = $true
$Label_utilities.width                    = $d_left-5
$Label_utilities.height                   = $d_top-5
$Label_utilities.location                 = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top-5))
$Label_utilities.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',9,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
$y_top          = $y_top + 15

$winterminal                              = New-Object system.Windows.Forms.Button
$winterminal.text                         = "Windows Terminal"
$winterminal.width                        = $d_left-5
$winterminal.height                       = $d_top-5
$winterminal.location                     = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$winterminal.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$powertoys                              = New-Object system.Windows.Forms.Button
$powertoys.text                         = "PowerToys"
$powertoys.width                        = $d_left-5
$powertoys.height                       = $d_top-5
$powertoys.location                     = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$powertoys.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$7zip                              = New-Object system.Windows.Forms.Button
$7zip.text                         = "7-Zip"
$7zip.width                        = $d_left-5
$7zip.height                       = $d_top-5
$7zip.location                     = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$7zip.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$autohotkey                              = New-Object system.Windows.Forms.Button
$autohotkey.text                         = "AutoHotkey"
$autohotkey.width                        = $d_left-5
$autohotkey.height                       = $d_top-5
$autohotkey.location                     = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$autohotkey.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$discord                              = New-Object system.Windows.Forms.Button
$discord.text                         = "Discord"
$discord.width                        = $d_left-5
$discord.height                       = $d_top-5
$discord.location                     = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$discord.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$github                              = New-Object system.Windows.Forms.Button
$github.text                         = "Github"
$github.width                        = $d_left-5
$github.height                       = $d_top-5
$github.location                     = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$github.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$translucenttb                              = New-Object system.Windows.Forms.Button
$translucenttb.text                         = "Translucent Taskbar"
$translucenttb.width                        = $d_left-5
$translucenttb.height                       = $d_top-5
$translucenttb.location                     = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$translucenttb.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$etcher                              = New-Object system.Windows.Forms.Button
$etcher.text                         = "Etcher USB Creator"
$etcher.width                        = $d_left-5
$etcher.height                       = $d_top-5
$etcher.location                     = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$etcher.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$putty                              = New-Object system.Windows.Forms.Button
$putty.text                         = "PuTTY + WinSCP"
$putty.width                        = $d_left-5
$putty.height                       = $d_top-5
$putty.location                     = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$putty.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$advancedipscanner                              = New-Object system.Windows.Forms.Button
$advancedipscanner.text                         = "Advanced IP Scanner"
$advancedipscanner.width                        = $d_left-5
$advancedipscanner.height                       = $d_top-5
$advancedipscanner.location                     = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$advancedipscanner.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$everythingsearch                              = New-Object system.Windows.Forms.Button
$everythingsearch.text                         = "Everything Search"
$everythingsearch.width                        = $d_left-5
$everythingsearch.height                       = $d_top-5
$everythingsearch.location                     = New-Object System.Drawing.Point(($x_left+$margin_left),($y_top+$margin_top))
$everythingsearch.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',9)
$y_top          = $y_top + $d_top

$Panel_utilities.controls.AddRange(@($Label_utilities,
$winterminal,$powertoys,$7zip,$autohotkey,$discord,$github,$translucenttb,
$etcher,$putty,$advancedipscanner,$everythingsearch
))

#szkriptek
$dgg_Ninite.Add_Click({
	$source = 'https://dggmester.hu/fs01/ninite.exe'
	$destination = 'ninite.exe'
	Invoke-WebRequest -Uri $source -OutFile $destination
	$CMD = 'ninite.exe'
	#$arg1 = '-no-remote'
	#$arg2 = '-Profile'
	#$arg3 = 'system\\kiadok.lira.hu\\firefox'
	#& $CMD # $arg1 $arg2 $arg3
	Start-Process $CMD -Verb runAs
})

$dgg_MSOffice6.Add_Click({
	$source = 'https://dggmester.hu/fs01/Office-2013-2019-C2R-Install-Lite-v6.7-master.zip'
	$destination = 'MSOffice6.zip'
	Invoke-WebRequest -Uri $source -OutFile $destination
})

$dgg_MSOffice7.Add_Click({
	$source = 'https://dggmester.hu/fs01/Office%202013-2021%20C2R%20Install%20-%20Install%20Lite%207.3.7%20[FileCR_PASS_123].zip'
	$destination = 'MSOffice7.zip'
	Invoke-WebRequest -Uri $source -OutFile $destination
})

[void]$Form.ShowDialog()
$ROOT = Split-Path $MyInvocation.MyCommand.Path -Parent
Add-Type -AssemblyName System.Windows.Forms
Import-Module -Name $ROOT\MODULS\DGG_kernel.psm1 -Verbose
Import-Module -Name $ROOT\config.psm1 -Verbose

$Form                                          = New-Object system.Windows.Forms.Form
$Form.ClientSize                               = New-Object System.Drawing.Point(300,400) #magass�g,sz�less�g
$Form.text                                     = "DGG System ::: Rekl�m v�delem"
$Form.StartPosition                            = "CenterScreen"
$Form.TopMost                                  = $false
$Form.BackColor                                = [System.Drawing.ColorTranslator]::FromHtml("#e9e9e9")
$Form.AutoScaleDimensions                      = '192, 192'
$Form.AutoScaleMode                            = "Dpi"
$Form.AutoSize                                 = $true
$Form.AutoScroll                               = $true

$Form.FormBorderStyle                          = 'FixedSingle'
							                   
$Form.Width                                    = $objImage.Width
$Form.Height                                   = $objImage.Height
							                   
$Panel1                                        = New-Object system.Windows.Forms.Panel
$Panel1.height                                 = 300
$Panel1.width                                  = 200
$Panel1.location                               = New-Object System.Drawing.Point(0,0)

$a_0=5
$margin_left=60
$d=85

$dgg_AdBlockHost              = CreateItem "Alap rekl�m blokkol�s(host file �t�r�s)" "Button" 80 10 $margin_left $a_0
if(Test-Path -Path $ROOT\DGG_AdBlock\HOSTS_back -PathType Leaf)
{
	$dgg_AdBlockHost.BackColor = 'GREEN'
}
else
{
	$dgg_AdBlockHost.BackColor = 'RED'
}

$a_0=$a_0+$d

$dgg_AdBlockApps              = CreateItem "Windows App rekl�m tilt�s" "Button" 80 10 $margin_left $a_0
$dgg_AdBlockApps.BackColor    = 'RED'
$a_0=$a_0+$d

$dgg_AdBlockBrowser           = CreateItem "Rekl�m tilt�s b�ng�sz�kben" "Button" 80 10 $margin_left $a_0
$dgg_AdBlockBrowser.BackColor = 'RED'
$a_0=$a_0+$d

$Form.controls.AddRange(@($Panel1))
$Panel1.controls.AddRange(@($dgg_AdBlockHost,$dgg_AdBlockApps,$dgg_AdBlockBrowser))

$dgg_AdBlockHost.Add_Click({
	if(Test-Path -Path $ROOT\DGG_AdBlock\HOSTS_back -PathType Leaf)
	{
		#rekl�mv�delem akt�v, vissza�llitjuk az eredetit
		#$date = Get-Date -Format "yyyy-MM-dd_HH-mm"
		Copy-Item "$ROOT\DGG_AdBlock\HOSTS_back" -Destination "$ROOT\DGG_AdBlock\HOSTS_$(get-date -f yyyy-MM-dd_HH-mm)"
		Start-Process PowerShell.exe -ArgumentList 'Copy-Item "$ROOT\DGG_AdBlock\HOSTS_back" -Destination "C:\Windows\System32\drivers\etc\hosts"' -Wait -Verb RunAs
		Remove-Item -Path "$ROOT\DGG_AdBlock\HOSTS_back" -Force
		$dgg_AdBlockHost.BackColor = 'RED'
	}
	else
	{
		#rekl�mv�delem inakt�v mentem a r�git f�jlt �s fel�l�rom az �jjal
		Copy-Item "C:\Windows\System32\drivers\etc\hosts" -Destination "$ROOT\DGG_AdBlock\HOSTS_back"
		Start-Process PowerShell.exe -ArgumentList 'Copy-Item "$ROOT\DGG_AdBlock\HOSTS_adblock" -Destination "C:\Windows\System32\drivers\etc\hosts"' -Wait -Verb RunAs
		$dgg_AdBlockHost.BackColor = 'GREEN'
	}
})

$dgg_AdBlockApps.Add_Click({
	if ($dgg_AdBlockApps.BackColor -eq 'RED')
	{
		$dgg_AdBlockApps.BackColor = 'GREEN'
	}
	else
	{
		$dgg_AdBlockApps.BackColor = 'RED'
	}
})

$dgg_AdBlockBrowser.Add_Click({
	if ($dgg_AdBlockBrowser.BackColor -eq 'RED')
	{
		$dgg_AdBlockBrowser.BackColor = 'GREEN'
	}
	else
	{
		$dgg_AdBlockBrowser.BackColor = 'RED'
	}
})

[void]$Form.ShowDialog()
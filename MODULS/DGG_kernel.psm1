function CreateItem
{
	Param
	(
		$text,
		$type,
		$dimension,
		$font,
		$left,
		$top
    )
	Add-Type -AssemblyName System.Windows.Forms
	$tmp           = New-Object system.Windows.Forms.Button
	$tmp.text      = $text
	$tmp.width     = $dimension
	$tmp.height    = $dimension
	$tmp.location  = New-Object System.Drawing.Point($left,$top)
	$tmp.Font      = New-Object System.Drawing.Font('Microsoft Sans Serif',$font)
	return $tmp
}
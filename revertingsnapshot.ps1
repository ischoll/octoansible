
$vc="10.0.0.197"

Connect-VIServer -Server $vc


foreach($vm in Get-Folder 555varnish | Get-VM){
	$snap = Get-Snapshot -VM $vm | Sort-Object -Property Created -Descending | Select -First 1
	Set-VM -VM $vm -SnapShot $snap -Confirm:$false
}

Disconnect-Viserver * -Confirm:$false



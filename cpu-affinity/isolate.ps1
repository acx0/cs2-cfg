# note: run as admin to pin system processes too

Write-Host "disabled; skipping"
return

foreach ($process in Get-Process) {
    if ($process.ProcessorAffinity -eq $null) {
        continue
    }

    $process.ProcessorAffinity = [Convert]::ToInt64("00FF", 16)
}

# prereq: enable powershell script execution:
#   > Set-ExecutionPolicy -Scope CurrentUser RemoteSigned

if (!(Get-Process cs2 -ErrorAction SilentlyContinue)) {
    # note: launching cs2.exe directly won't allow joining VAC-protected servers
    start steam://rungameid/730

    Write-Host -NoNewline "waiting for cs2.exe"
    while (!(Get-Process cs2 -ErrorAction SilentlyContinue)) {
        sleep 1
        Write-Host -NoNewline "."
    }
    Write-Host
} else {
    Write-Host "cs2.exe already running"
}

Write-Host -NoNewline "setting affinity..."
(Get-Process cs2).ProcessorAffinity = [Convert]::ToInt64("1111111100000000", 2)
Write-Host "done"

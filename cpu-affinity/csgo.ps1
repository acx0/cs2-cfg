# prereq: enable powershell script execution:
#   > Set-ExecutionPolicy -Scope CurrentUser RemoteSigned

Write-Host "deprecated; use cs2.ps1"
return

if (!(Get-Process csgo -ErrorAction SilentlyContinue)) {
    # note: running csgo.exe directly throws error now
    start steam://rungameid/730

    Write-Host -NoNewline "waiting for csgo.exe"
    while (!(Get-Process csgo -ErrorAction SilentlyContinue)) {
        sleep 1
        Write-Host -NoNewline "."
    }
    Write-Host
} else {
    Write-Host "csgo.exe already running"
}

Write-Host -NoNewline "setting affinity..."
# (Get-Process csgo).ProcessorAffinity = [Convert]::ToInt64("5500", 16)
(Get-Process csgo).ProcessorAffinity = [Convert]::ToInt64("0101010100000000", 2)
Write-Host "done"

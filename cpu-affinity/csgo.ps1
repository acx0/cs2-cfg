# prereq: enable powershell script execution:
#   > Set-ExecutionPolicy -Scope CurrentUser RemoteSigned

# misc: observed heavy stuttering on macbook pro (i7-9750H) until cores were pinned to 0,2,4,6

if (!(Get-Process csgo -ErrorAction SilentlyContinue)) {
    # note: running csgo.exe directly throws error now
    start steam://rungameid/730

    Write-Host "waiting for csgo.exe..."
    while (!(Get-Process csgo -ErrorAction SilentlyContinue)) {
        sleep 2
    }
} else {
    Write-Host "csgo.exe already running"
}

Write-Host -NoNewline "setting affinity..."
# (Get-Process csgo).ProcessorAffinity = [Convert]::ToInt64("5500", 16)
(Get-Process csgo).ProcessorAffinity = [Convert]::ToInt64("0101010100000000", 2)
Write-Host "done"

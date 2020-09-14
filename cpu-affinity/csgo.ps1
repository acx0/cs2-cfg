# prereq: enable powershell script execution:
#   > Set-ExecutionPolicy -Scope CurrentUser RemoteSigned

# misc: observed heavy stuttering on macbook pro (i7-9750H) until cores were pinned to 0,2,4,6

if (!(Get-Process csgo -ErrorAction SilentlyContinue)) {
    # note: running csgo.exe directly throws error now
    start steam://rungameid/730
    sleep 5
} else {
    Write-Host "csgo.exe already running"
}

(Get-Process csgo).ProcessorAffinity = [Convert]::ToInt64("5500", 16)

@echo off

:: /affinity takes hex value that represents bitmask of which cores to use
:: e.g. 0101010100000000 means cores 8,10,12,14
start "Steam" /affinity 000F "C:\Program Files (x86)\Steam\steam.exe"

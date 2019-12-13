@echo off

:: /affinity takes hex value that represents bitmask of which cores to use
:: e.g. 0101010100000000 means cores 8,10,12,14
:: note:
::   - "-steam" required otherwise game launched in insecure mode
::   - custom launch options need to be explicitly (re)specified
start "CS:GO" /affinity 5500 "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo.exe" -steam -novid -tickrate 128 -freq 155

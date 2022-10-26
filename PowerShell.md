| Command | Description |
| :---: | :----: |
| Get-ChildItem -Recurse \| Select-String "dummy" -List \| Select Path | Search string in files recursively |
| Invoke-WebRequest -Uri <url> -OutFile ( New-Item <item> -Force )| wget alternative|

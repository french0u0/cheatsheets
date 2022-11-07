| Command | Description |
| :---: | :----: |
| Get-ChildItem -Recurse \| Select-String "dummy" -List \| Select Path | Search string in files recursively |
| Invoke-WebRequest -Uri \<url\> -OutFile ( New-Item <item> -Force )| wget alternative|
| winget uninstall --name '\<appname\>' | uninstall by name |
| winget list \| grep '\<appname\>' | search for app |
| winget upgrade | show upgradeable |
| winget upgrade --all | upgrade all|

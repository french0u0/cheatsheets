Download Plugin Manager:

PowerShell:
Invoke-WebRequest -Uri https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -OutFile ( New-Item ~\AppData\Local\nvim\autoload/plug.vim -Force )
  

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



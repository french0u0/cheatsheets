# Location: C:\Users\[User]\Documents\WindowsPowerShell\profile.ps1

# PowerShellGet
# install: Install-Module -Name PowerShellGet -Force
# Exit

# PSReadLine
#install: Install-Module PSReadLine

# oh-my-posh https://ohmyposh.dev/docs/
# install: winget install JanDeDobbeleer.OhMyPosh -s winget

# terminal-icons https://github.com/devblackops/Terminal-Icons
# install: Install-Module -Name Terminal-Icons -Repository PSGallery
# or scoop bucket add extras and then scoop install terminal-icons

# posh-git https://github.com/dahlbyk/posh-git
# install: PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
# update: PowerShellGet\Update-Module posh-git

oh-my-posh --init --shell pwsh --config $env:POSH_THEMES_PATH\unicorn.omp.json | Invoke-Expression
Import-Module -Name Terminal-Icons
Set-Alias g git
Import-Module posh-git

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

function setLocationToGit {
    Set-Location C:\Users\fjacobs\Documents\workspace\git
}

New-Alias -Name gotoGit -Value setLocationToGit
New-Alias vi "nvim"
New-Alias ctags "ctags --recurse=yes --exclude=.git"

Set-Location C:\Users\fjacobs\Documents\workspace\git

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
# Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -EditMode Windows

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# This key handler shows the entire or filtered history using Out-GridView. The
# typed text is used as the substring pattern for filtering. A selected command
# is inserted to the command line without invoking. Multiple command selection
# is supported, e.g. selected by Ctrl + Click.
#Set-PSReadLineKeyHandler -Key F7 `
#                         -BriefDescription History `
#                         -LongDescription 'Show command history' `
#                         -ScriptBlock {
#    $pattern = $null
#    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$pattern, [ref]$null)
#    if ($pattern)
#    {
#        $pattern = [regex]::Escape($pattern)
#    }
#
#    $history = [System.Collections.ArrayList]@(
#        $last = ''
#        $lines = ''
#        foreach ($line in [System.IO.File]::ReadLines((Get-PSReadLineOption).HistorySavePath))
#        {
#            if ($line.EndsWith('`'))
#            {
#                $line = $line.Substring(0, $line.Length - 1)
#                $lines = if ($lines)
#                {
#                    "$lines`n$line"
#                }
#                else
#                {
#                    $line
#                }
#                continue
#            }
#
#            if ($lines)
#            {
#                $line = "$lines`n$line"
#                $lines = ''
#            }
#
#            if (($line -cne $last) -and (!$pattern -or ($line -match $pattern)))
#            {
#                $last = $line
#                $line
#            }
#        }
#    )
#    $history.Reverse()
#
#    $command = $history | Out-GridView -Title History -PassThru
#    if ($command)
#    {
#        [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
#        [Microsoft.PowerShell.PSConsoleReadLine]::Insert(($command -join "`n"))
#    }
#}
#
## This will add the command to history.
#Set-PSReadLineKeyHandler -Key Ctrl+g `
#                         -BriefDescription GoToGit `
#                         -LongDescription "Set location at my git repos" `
#                         -ScriptBlock {
#    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
#    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("Set-Location C:\Users\fjacobs\Documents\workspace\Repos\gitrepos")
#    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
#}
#
## This is an example of a macro that you might use to execute a command.
## This will add the command to history.
#Set-PSReadLineKeyHandler -Key Ctrl+b `
#                         -BriefDescription BuildCurrentDirectory `
#                         -LongDescription "Build the current directory" `
#                         -ScriptBlock {
#    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
#    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("msbuild")
#    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
#}
#
## The built-in word movement uses character delimiters, but token based word
## movement is also very useful - these are the bindings you'd use if you
## prefer the token based movements bound to the normal emacs word movement
## key bindings.
#Set-PSReadLineKeyHandler -Key Alt+d -Function ShellKillWord
#Set-PSReadLineKeyHandler -Key Alt+Backspace -Function ShellBackwardKillWord
#Set-PSReadLineKeyHandler -Key Alt+b -Function ShellBackwardWord
#Set-PSReadLineKeyHandler -Key Alt+f -Function ShellForwardWord
#Set-PSReadLineKeyHandler -Key Alt+B -Function SelectShellBackwardWord
#Set-PSReadLineKeyHandler -Key Alt+F -Function SelectShellForwardWord
#
## Sometimes you enter a command but realize you forgot to do something else first.
## This binding will let you save that command in the history so you can recall it,
## but it doesn't actually execute.  It also clears the line with RevertLine so the
## undo stack is reset - though redo will still reconstruct the command line.
#Set-PSReadLineKeyHandler -Key Alt+w `
#                         -BriefDescription SaveInHistory `
#                         -LongDescription "Save current line in history but do not execute" `
#                         -ScriptBlock {
#    param($key, $arg)
#
#    $line = $null
#    $cursor = $null
#    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
#    [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($line)
#    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
#}
#
## F1 for help on the command line - naturally
#Set-PSReadLineKeyHandler -Key F1 `
#                         -BriefDescription CommandHelp `
#                         -LongDescription "Open the help window for the current command" `
#                         -ScriptBlock {
#    param($key, $arg)
#
#    $ast = $null
#    $tokens = $null
#    $errors = $null
#    $cursor = $null
#    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$ast, [ref]$tokens, [ref]$errors, [ref]$cursor)
#
#    $commandAst = $ast.FindAll( {
#        $node = $args[0]
#        $node -is [CommandAst] -and
#            $node.Extent.StartOffset -le $cursor -and
#            $node.Extent.EndOffset -ge $cursor
#        }, $true) | Select-Object -Last 1
#
#    if ($commandAst -ne $null)
#    {
#        $commandName = $commandAst.GetCommandName()
#        if ($commandName -ne $null)
#        {
#            $command = $ExecutionContext.InvokeCommand.GetCommand($commandName, 'All')
#            if ($command -is [AliasInfo])
#            {
#                $commandName = $command.ResolvedCommandName
#            }
#
#            if ($commandName -ne $null)
#            {
#                Get-Help $commandName -ShowWindow
#            }
#        }
#    }
#}
#
##
## Ctrl+Shift+j then type a key to mark the current directory.
## Ctrj+j then the same key will change back to that directory without
## needing to type cd and won't change the command line.
#
##
#$global:PSReadLineMarks = @{}
#
#Set-PSReadLineKeyHandler -Key Ctrl+J `
#                         -BriefDescription MarkDirectory `
#                         -LongDescription "Mark the current directory" `
#                         -ScriptBlock {
#    param($key, $arg)
#
#    $key = [Console]::ReadKey($true)
#    $global:PSReadLineMarks[$key.KeyChar] = $pwd
#}
#
#Set-PSReadLineKeyHandler -Key Ctrl+j `
#                         -BriefDescription JumpDirectory `
#                         -LongDescription "Goto the marked directory" `
#                         -ScriptBlock {
#    param($key, $arg)
#
#    $key = [Console]::ReadKey()
#    $dir = $global:PSReadLineMarks[$key.KeyChar]
#    if ($dir)
#    {
#        cd $dir
#        [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
#    }
#}
#
#Set-PSReadLineKeyHandler -Key Alt+j `
#                         -BriefDescription ShowDirectoryMarks `
#                         -LongDescription "Show the currently marked directories" `
#                         -ScriptBlock {
#    param($key, $arg)
#
#    $global:PSReadLineMarks.GetEnumerator() | % {
#        [PSCustomObject]@{Key = $_.Key; Dir = $_.Value} } |
#        Format-Table -AutoSize | Out-Host
#
#    [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
#}
#
#
#

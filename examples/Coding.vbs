' Coding session: VS Code + Claude + lofi coding playlist
Set objShell = CreateObject("WScript.Shell")

' Lofi coding music in a new Chrome window
objShell.Run """chrome.exe"" --new-window ""https://www.youtube.com/watch?v=jfKfPfyJRdk""", 1, False
WScript.Sleep 1000

' Claude as a tab in the same window
objShell.Run """chrome.exe"" ""https://claude.ai""", 1, False

' VS Code
objShell.Run """code""", 1, False

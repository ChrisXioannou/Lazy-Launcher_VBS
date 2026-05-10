' Wind-down: YouTube + Instagram + Reddit
Set objShell = CreateObject("WScript.Shell")

objShell.Run """chrome.exe"" --new-window ""https://www.youtube.com""", 1, False
WScript.Sleep 1000

objShell.Run """chrome.exe"" ""https://www.instagram.com""", 1, False
objShell.Run """chrome.exe"" ""https://www.reddit.com""", 1, False

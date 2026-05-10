Set objShell = CreateObject("WScript.Shell")

' HTB Academy in new Chrome window
objShell.Run """chrome.exe"" --new-window ""https://academy.hackthebox.com/dashboard""", 1, False
WScript.Sleep 1000

' Jupyter Lab (conda env: ai)
objShell.Run "cmd /k ""call C:\Users\chris\scoop\apps\miniconda3\current\Scripts\activate.bat ai && cd /d ""C:\Users\chris\Desktop\FULL CONTAINER\CYBER SECURITY\AI Hack the Box"" && jupyter lab""", 1, False

' OpenVPN (elevated - prompts UAC once)
objShell.Run "powershell -Command ""Start-Process 'C:\Program Files\OpenVPN\bin\openvpn.exe' -ArgumentList '--config','""C:\Users\chris\Desktop\FULL CONTAINER\CYBER SECURITY\AI Hack the Box\academy-regular.ovpn""' -Verb RunAs""", 0, False

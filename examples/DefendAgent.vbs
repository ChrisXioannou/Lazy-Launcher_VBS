Set objShell = CreateObject("WScript.Shell")

objShell.Run """chrome.exe"" --new-window ""https://hpanel.hostinger.com/vps/<YOUR_VPS_ID>/overview""", 1, False
WScript.Sleep 1000

objShell.Run """chrome.exe"" ""https://n8n.<YOUR_DOMAIN>/home/workflows""", 1, False
objShell.Run """chrome.exe"" ""http://localhost:8080/""", 1, False
objShell.Run """chrome.exe"" ""https://supabase.com/dashboard/project/<YOUR_PROJECT_ID>""", 1, False

objShell.Run """code""", 1, False

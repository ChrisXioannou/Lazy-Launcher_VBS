' Full-stack project: dashboards + local dev server + editor
Set objShell = CreateObject("WScript.Shell")

' Vercel project dashboard in new Chrome window
objShell.Run """chrome.exe"" --new-window ""https://vercel.com/dashboard""", 1, False
WScript.Sleep 1000

' Supabase + Hostinger panel as tabs
objShell.Run """chrome.exe"" ""https://supabase.com/dashboard/projects""", 1, False
objShell.Run """chrome.exe"" ""https://hpanel.hostinger.com""", 1, False

' Local dev server tab (open after the server starts)
objShell.Run """chrome.exe"" ""http://localhost:3000""", 1, False

' Run the dev server in a terminal (replace path + command for your project)
objShell.Run "cmd /k ""cd /d ""C:\Users\<you>\projects\my-app"" && npm run dev""", 1, False

' VS Code
objShell.Run """code""", 1, False

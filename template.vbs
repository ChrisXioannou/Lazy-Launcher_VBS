' ============================================================
' Windows Taskbar Launcher - Template
' Replace <PLACEHOLDERS> with your own values, delete blocks
' you don't need.
' ============================================================

Set objShell = CreateObject("WScript.Shell")

' --- Open a URL in a new Chrome window ---
objShell.Run """chrome.exe"" --new-window ""<URL_1>""", 1, False
WScript.Sleep 1000

' --- Open additional URLs in the same window (tabs) ---
objShell.Run """chrome.exe"" ""<URL_2>""", 1, False
objShell.Run """chrome.exe"" ""<URL_3>""", 1, False

' --- Run a command in a new terminal (e.g. Jupyter, dev server) ---
' Use cmd /k to keep the window open after the command runs.
objShell.Run "cmd /k ""cd /d ""<WORKING_DIR>"" && <COMMAND>""", 1, False

' --- Run a conda environment + command ---
objShell.Run "cmd /k ""call <CONDA_ACTIVATE_PATH> <ENV_NAME> && cd /d ""<WORKING_DIR>"" && <COMMAND>""", 1, False

' --- Run something as administrator (UAC prompt) ---
objShell.Run "powershell -Command ""Start-Process '<EXE_PATH>' -ArgumentList '<ARG_1>','<ARG_2>' -Verb RunAs""", 0, False

' --- Open an app (must be on PATH) ---
objShell.Run """<APP_NAME>""", 1, False

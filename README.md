# Windows Taskbar Launcher

Pin a one-click launcher to your Windows taskbar that opens **all the apps, browser tabs, terminals, and VPNs** you need to start your work — in one click.

No AutoHotkey. No PowerToys. No Raycast. Just a `.vbs` file Windows has shipped since 1996, and a `.lnk` shortcut.

**Why I built this:** every morning I was opening 5 Chrome tabs, activating a conda env, starting Jupyter, and connecting a VPN. ~45 seconds of clicking. Now it's one click on my taskbar.

---

## What you'll end up with

A taskbar icon that, when clicked:
- Opens specific URLs (some in new windows, some as tabs)
- Starts terminals with commands pre-running (e.g. `jupyter lab` in a conda env)
- Launches programs that need admin rights (e.g. OpenVPN) with a single UAC prompt
- Opens any app on your PATH (VS Code, Cursor, etc.)

---

## Step 1 — Copy the template

Grab [`template.vbs`](./template.vbs) from this repo. Save it somewhere **permanent** like:

```
C:\Users\<you>\Scripts\MyLauncher.vbs
```

> ⚠️ Don't move the file after creating the shortcut — the shortcut path will break.

---

## Step 2 — Edit the template

Open `MyLauncher.vbs` in Notepad or VS Code. Replace the `<PLACEHOLDERS>`. Delete the blocks you don't need.

### Open a URL in a new Chrome window

```vbs
objShell.Run """chrome.exe"" --new-window ""<URL_1>""", 1, False
WScript.Sleep 1000
```

Replace `<URL_1>` with your URL. The `Sleep 1000` waits 1 second so the next URLs open as tabs in *this* window instead of opening another window.

### Open more URLs as tabs in the same window

```vbs
objShell.Run """chrome.exe"" ""<URL_2>""", 1, False
objShell.Run """chrome.exe"" ""<URL_3>""", 1, False
```

### Run a command in a terminal

```vbs
objShell.Run "cmd /k ""cd /d ""<WORKING_DIR>"" && <COMMAND>""", 1, False
```

`cmd /k` keeps the terminal open after the command runs. Use this for dev servers, watchers, anything you need to monitor.

### Run a conda environment

```vbs
objShell.Run "cmd /k ""call <CONDA_ACTIVATE_PATH> <ENV_NAME> && cd /d ""<WORKING_DIR>"" && <COMMAND>""", 1, False
```

To find your `<CONDA_ACTIVATE_PATH>`: open `cmd` and run `where conda`. The activate script lives next to `conda.exe` in `Scripts\activate.bat`. Common locations:

- Anaconda: `C:\Users\<you>\anaconda3\Scripts\activate.bat`
- Miniconda: `C:\Users\<you>\miniconda3\Scripts\activate.bat`
- Scoop install: `C:\Users\<you>\scoop\apps\miniconda3\current\Scripts\activate.bat`

### Run a program as administrator

```vbs
objShell.Run "powershell -Command ""Start-Process '<EXE_PATH>' -ArgumentList '<ARG_1>','<ARG_2>' -Verb RunAs""", 0, False
```

Triggers a single UAC prompt. Use this for OpenVPN, network tools, anything needing admin rights.

### Open an app on your PATH

```vbs
objShell.Run """<APP_NAME>""", 1, False
```

E.g. `"""code"""` for VS Code, `"""cursor"""` for Cursor.

---

## Step 3 — Test it

Double-click `MyLauncher.vbs`. Everything should fire off. Fix any path issues now — easier than debugging from a shortcut later.

---

## Step 4 — Create a shortcut (.lnk)

Windows blocks pinning `.vbs` files to the taskbar directly. Workaround: create a `.lnk` that runs the `.vbs`.

1. Right-click your Desktop → **New → Shortcut**
2. In the location field, paste:
   ```
   wscript.exe "C:\Users\<you>\Scripts\MyLauncher.vbs"
   ```
3. Name it whatever you want (e.g. "Work Launcher"). Click Finish.

---

## Step 5 — Set a custom icon (optional)

1. Right-click the shortcut → **Properties**
2. Click **Change Icon...** → **Browse**
3. Pick a `.ico` file. (Free icons: [icon-icons.com](https://icon-icons.com), or convert a PNG at [convertio.co](https://convertio.co/png-ico/))
4. **OK** → **Apply**

---

## Step 6 — Pin to taskbar

**Windows 11:**
- Right-click the shortcut → **Show more options** → **Pin to taskbar**
- If "Pin to taskbar" is missing: drag shortcut to Start menu first, then right-click in Start → **Pin to taskbar**

**Windows 10:**
- Right-click the shortcut → **Pin to taskbar**

Done. Click the icon to launch your entire workflow.

---

## Examples

Real configurations from my own setup:

- [`examples/HackTheBox.vbs`](./examples/HackTheBox.vbs) — opens HTB Academy, starts a Jupyter Lab in a conda env, connects an OpenVPN config (elevated)
- [`examples/DefendAgent.vbs`](./examples/DefendAgent.vbs) — opens Hostinger panel, n8n, localhost dev server, Supabase dashboard, then launches VS Code

---

## Troubleshooting

**"chrome.exe is not recognized"** — Chrome isn't on your PATH. Use the full path: `"""C:\Program Files\Google\Chrome\Application\chrome.exe"""`.

**Conda activate fails** — wrong activate.bat path. Run `where conda` in cmd and adjust.

**UAC prompt every time you launch** — that's expected for the OpenVPN block. To skip it, use OpenVPN GUI (runs as a service) instead, or schedule the launch via Task Scheduler with "Run with highest privileges."

**Jupyter opens in the wrong directory** — check the `cd /d` path. Use `cd /d "C:\path\with spaces"` (the `/d` switches drives if needed).

**VS Code opens but you don't want it to** — delete the `objShell.Run """code"""` line.

---

## Why .vbs and not .bat or .ps1?

- **.bat** flashes a black console window every time you click it. Ugly.
- **.ps1** is blocked by default execution policies on most Windows installs. Friction.
- **.vbs** runs silently via `wscript.exe`. No visible console. Available since Windows 98.

---

## License

MIT — copy, fork, do what you want.

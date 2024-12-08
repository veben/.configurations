# Windows Configurations
> For Windows 10

## I. Setups
### 1. Dark Theme
Activate Dark mode using PowerShell:
- For system default:
```sh
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0 -Type Dword -Force
```
- For applications:
```sh
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0 -Type Dword -Force
```

### 2. QWERTY International Keyboard
#### Option 1: via Powershell
Enter these lines in Powershell:
```sh
$LangList = New-WinUserLanguageList en-US
$LangList[0].InputMethodTips.Add("0409:00020409") # United States-International QWERTY keyboard
$LangList[0].InputMethodTips.Remove("0409:00000409") # US QWERTY keyboard
Set-WinUserLanguageList $LangList
```

#### Option 2: via the Interface
- Navigate to `Settings > Time & Language > Language`
- Click on the default Preferred Language: **English (United States)**
- Select the preferred language and click `Options`
- Add "United States-International" QWERTY keyboard
- Remove "US" QWERTY keyboard

### 3. Hide the Recycle Bin from the Desktop
Hide the Recycle Bin from the Desktop using Poweshell:
```sh
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{645FF040-5081-101B-9F08-00AA002F954E}" -Value 1
```

## II. Nerd Font Setup
- Download Ubuntu Nerd Font:
```sh
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/UbuntuMono.zip
```
- Extract all the fonts
- Select all fonts > Right click > Install

## III. Tools Setup
### 1. WSL2 + Ubuntu 22.04
For detailed instructions, see [WSL2 + Ubuntu 22.04 Setup Guide](wsl2/README.md)
### 2. Wezterm
For configuration and customization, refer to [Wezterm Setup](wezterm/README.md)
### 3. VSCode
For installation and settings, check [VSCode Setup](vscode/README.md)
### 4. Obsidian
For installation and settings, check [Obsidian Setup](obsidian/README.md)
### 5. Syncthing
For installation and settings, check [Syncthing Setup](syncthing/README.md)
### 6. Slack
1. Install Slack and sign in to the Slack workspace you’d like to customize.
2. Open Slack and go to the Preferences via `Ctrl/⌘+,`.
3. Click on **Theme**, **Custom Theme**, **Import**
4. Copy the following Nord's color values.
```plaintext
#2E3440,#3B4252,#88C0D0,#2E3440,#3B4252,#D8DEE9,#A3BE8C,#81A1C1
```
### 7. Brave
1. Install Brave browser
2. Configure sync following this address: `brave://settings/braveSync/setup`
3. Install Nord theme following this [link](https://chromewebstore.google.com/detail/nord/abehfkkfjlplnjadfcjiflnejblfmmpj)

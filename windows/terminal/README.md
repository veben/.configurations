# Windows Terminal installation and configuration
> See: https://learn.microsoft.com/en-us/windows/terminal/install

## 1. Installation

### 1.1 Installed by default
With recent versions of Windows, Windows terminal is installed by default.

### 1.2 Install it from store
> Recommanded Install Windows terminal from store or clicking here: https://www.microsoft.com/fr-fr/p/windows-terminal-preview/9n0dx20hk701?rtc=1&activetab=pivot:overviewtab

### 1.3 Install it from Github
> Do this method if the previous are not available

1. Download last stable release from [here](https://github.com/microsoft/terminal/releases)
2. Open Powershell and add app with command:
```sh
Add-AppxPackage .\Microsoft.WindowsTerminal_1.7.1033.0_8wekyb3d8bbwe.msixbundle
```

## 2. Configuration
Copy `settings.json` to `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState` folder

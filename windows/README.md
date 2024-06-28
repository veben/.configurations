# Windows Configurations
> For Windows 10

## Table of Contents
1. [Setups](#i-setups)
   - [Dark Theme](#1-dark-theme)
   - [QWERTY International Keyboard](#2-qwerty-international-keyboard)
2. [Tools Installation](#ii-tools-installation)
   - [WSL2 + Ubuntu 22.04](#1-wsl2--ubuntu-2204)
   - [Windows Terminal](#2-windows-terminal)
   - [VSCode](#3-vscode)

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
- Navigate to `Settings > Language Settings > Language`
- Select the preferred language and click `Options`
- Choose they keyboard "QWERTY United States-International"

## II. Tools installation
### 1. WSL2 + Ubuntu 22.04
For detailed instructions, see [WSL2 + Ubuntu 22.04 Setup Guide](wsl2/README.md)

### 2. Windows Terminal
For configuration and customization, refer to [Windows Terminal Setup](terminal/README.md)

### 3. VSCode
For installation and settings, check [VSCode Setup](vscode/README.md)
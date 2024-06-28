# WSL2 + Ubuntu 22.04 Installation

> See official guide: https://docs.microsoft.com/en-us/windows/wsl/install-win10

## I. Install WSL2

> From Powershell as administrator
1. Enable **WSL**:
```sh
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
2. Enable Virtual Machine feature:
```sh
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
3. Set **WSL2** as default:
```sh
wsl --set-default-version 2
```

## II. Install Ubuntu

> From Powershell as administrator
1. Open [Windows store](https://aka.ms/wslstore), download **Ubuntu** and install it
2. Launch it and configure a root user
3. Install Linux kernel from here: https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
4. Check that Ubuntu use version 2:
```sh
wsl --list --verbose
```
8. If not, change the version:
```sh
wsl --set-version ubuntu 2
```

## III. Update configurations
- Shutdown WSL typing this command in a Powershell:
```sh
wsl --shutdown
```
- Copy `.wslconfig` file to `%USERPROFILE%` folder
- Restart WSL typing this command in a Powershell:
```sh
wsl
```
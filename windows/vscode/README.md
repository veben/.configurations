# VScode installation and configuration

## 1. Installation
> See: https://code.visualstudio.com/download

## 2. Configuration
### 2.1 Manage settings and keybinds
Copy `settings.json` to `%APPDATA%\Code\User` folder

### 2.2 Manage keybinds
Copy `keybindings.json` to `%APPDATA%\Code\User` folder

### 2.3 Manage extensions
#### Install extensions for VSCode local
> Use Powershell
- Install extensions:
```sh
for /f "tokens=*" %f in (local-extensions.txt) do code --install-extension %f
```
- If you need to backup again the extensions:
```sh
code --list-extensions > local-extensions.txt
```

#### Configure Markdown Preview Enhancer
Copy `style.less` file in `%USERPROFILE%\.crossnote` folder
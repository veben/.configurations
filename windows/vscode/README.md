# Windows Terminal configuration

## 1. Installation
> See: https://code.visualstudio.com/download

## 2. Configuration
### 2.1 Manage settings and keybinds
Copy `settings.json` to `%APPDATA%\Code\User` folder


### 2.1 Manage keybinds
Copy `keybindings.json` to `%APPDATA%\Code\User` folder

### 2.3 Manage extensions
#### Install extensions for VSCode local
- Install extensions:
```sh
for /f "tokens=*" %f in (local-extensions.txt) do code --install-extension %f
```
- If you need to backup again the extensions:
```sh
code --list-extensions > local-extensions.txt
```

#### Install extensions for VSCode in WSL
- Install extensions:
```sh
cat extensions.txt | xargs -L 1 code --install-extension
```
- If you need to backup again the extensions:
```sh
code --list-extensions > wsl-extensions.txt
```

#### Configure Markdown Preview Enhancer
Copy `style.less` file in `%USERPROFILE%\.crossnote` folder
# Windows Terminal configuration

## 1. Installation
> See: https://code.visualstudio.com/download

## 2. Configuration
### 2.1 Manage settings and keybinds
- Copy `settings.json` to `%APPDATA%\Code\User` folder
- Copy `keybindings.json` to `%APPDATA%\Code\User` folder

### 2.2 Manage extensions
- Install extensions:
```sh
cat extensions.txt | xargs -L 1 code --install-extension
```

- If you need to backup again the extensions:
```sh
code --list-extensions > extensions.txt
```
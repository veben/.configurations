# Ubuntu Configurations
> For Ubuntu 22.04 in WSL 2

## Table of Contents
1. [Update and Upgrade](#1-update-and-upgrade)
2. [Nerd Font Installation](#2-nerd-font-installation)
3. [Zsh Setup](#3-zsh-setup)
4. [Starship Installation](#4-starship-installation)
5. [EZA Installation](#5-eza-installation)
6. [Git Configuration](#6-git-configuration)
7. [Docker Setup](#7-docker-setup)
8. [Scripts](#8-scripts)

## 1. Update and Upgrade
```sh
sudo apt update && sudo apt upgrade -y
```

## 2. Nerd Font Installation
- Download Ubuntu Mono Nerd Font:
```sh
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/UbuntuMono.tar.xz
```

- Extract and install:
```sh
mkdir -p ~/.local/share/fonts/UbuntuMonoNerdFont
tar -xf Ubuntu.tar.xz -C ~/.local/share/fonts/UbuntuMonoNerdFont
```
- Update font cache:
```sh
fc-cache -fv
```
Verify installation:
```sh
fc-list | grep -i "ubuntu"
```
- Clean up:
```sh
rm UbuntuMono.tar.xz
```

## 3. Zsh Setup
- Install **Zsh**:
```sh
sudo apt-get install -y zsh
```
- Set as default shell:
```sh
chsh -s /bin/zsh
```
- Copy configuration files:
```sh
cp .zshrc ~/.zshrc
cp .zprofile ~/.zprofile
cp .bash_aliases ~/.bash_aliases
```

## 4. Starship Installation
> https://starship.rs/guide/

- Install Starship
```sh
curl -sS https://starship.rs/install.sh | sh
```
- Verify this is at the end of `~/.zshrc`
```plaintext
eval "$(starship init zsh)"
```
- Copy Starship configuration file:
```sh
mkdir -p ~/.config
cp .config/starship.toml ~/.config/starship.toml
```

## 5. Installation
> https://github.com/eza-community/eza/blob/main/INSTALL.md

Download latest version and copy it to `/usr/local/bin` folder:
```sh
wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
sudo chmod +x eza
sudo chown root:root eza
sudo mv eza /usr/local/bin/eza
```

## 6. Git Configuration
> See: https://blog.gitguardian.com/8-easy-steps-to-set-up-multiple-git-accounts/

- Create directories for personal and work repositories:
```sh
mkdir -p ~/personal
mkdir -p ~/work
```
- Copy configurations:
```sh
cp .gitconfig.pers ~/personal/
cp .gitconfig.work ~/work/
cp .gitconfig ~/
```

## 7. Docker Setup
> See: https://nickjanetakis.com/blog/install-docker-in-wsl-2-without-docker-desktop

- Install Docker, you can ignore the warning from Docker about using WSL
```sh
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```
- Add user to Docker group:
```sh
sudo usermod -aG docker $USER
```
- Verify installation:
```sh
docker --version
docker-compose version
```

- For Ubuntu 22.04 or Debian 10+, configure iptables:
```sh
sudo update-alternatives --config iptables
```

- Verify these lines are in the `~/.zprofile`
```plaintext
if grep -q "microsoft" /proc/version > /dev/null 2>&1; then
    if service docker status 2>&1 | grep -q "is not running"; then
        wsl.exe --distribution "${WSL_DISTRO_NAME}" --user root \
            --exec /usr/sbin/service docker start > /dev/null 2>&1
    fi
fi
```
- Restart terminal and verify:
```sh
ps aux | grep docker
docker run hello-world
```

## 8. Scripts
See [Scripts](scripts/README.md)
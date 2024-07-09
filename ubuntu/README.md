# Ubuntu Configurations
> For Ubuntu 22.04 in WSL 2

## Table of Contents

1. [Update and Upgrade](#1-update-and-upgrade)
2. [Utilities Installation](#2-utilities-installation)
3. [GitHub Setup](#3-github-setup)
4. [Nerd Font Installation](#4-nerd-font-installation)
5. [Zsh Installation](#5-zsh-installation)
6. [Configurations Installation](#6-configurations-installation)
7. [Starship Installation](#7-starship-installation)
8. [Eza Installation](#8-eza-installation)
9. [Fzf Installation](#9-fzf-installation)
10. [Lazygit Installation](#10-lazygit-installation)
11. [Docker Installation](#11-docker-installation)
12. [Scripts](#12-scripts)

## 1. Update and Upgrade
```sh
sudo apt update && sudo apt upgrade -y
```

## 2. Utilities Installation
- Install useful tools
```sh
sudo apt-get install -y xclip jq
```

## 3. GitHub Setup
- Define your Git username replacing `<git_username>`
```sh
export GIT_USER=<git_username>
```
- Generate personal **ED25519 SSH keys**:
```sh
ssh-keygen -t ed25519 -C "veben" -f ~/.ssh/perso_github_$GIT_USER
```
- Copy public key:
```sh
xclip -sel clip < ~/.ssh/perso_github_$GIT_USER
```
- Add the key to your GitHub account
- Test the connection:
```sh
ssh -T git@github.com
```

## 4. Nerd Font Installation
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

## 5. Zsh Installation
- Install **Zsh**:
```sh
sudo apt-get install -y zsh
```
- Set as default shell:
```sh
chsh -s /bin/zsh
```

## 6. Configurations Installation
> See: https://blog.gitguardian.com/8-easy-steps-to-set-up-multiple-git-accounts/

- Run the `setup.sh` script:
```sh
./setup.sh
```

## 7. Starship Installation
> https://starship.rs/guide/

- Install Starship
```sh
curl -sS https://starship.rs/install.sh | sh
```
- Verify this line is in the `.zshrc` file
```plaintext
eval "$(starship init zsh)"
```

## 8. Eza Installation
> https://github.com/eza-community/eza/blob/main/INSTALL.md

Download latest version and copy it to `/usr/local/bin` folder:
```sh
wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
sudo chmod +x eza
sudo chown root:root eza
sudo mv eza /usr/local/bin/eza
```

## 9. Fzf Installation
> https://github.com/junegunn/fzf

- Download latest version:
```sh
sudo apt install fzf
```
- Look at `fzf` version:
```sh
fzf -version
```
- For version **0.48.0** or later, add this line to `.zshrc` file to add shortcuts:
```plaintext
source <(fzf --zsh)
```

## 10. Lazygit Installation
> https://github.com/jesseduffield/lazygit?tab=readme-ov-file#ubuntu

- Download and install last version:
```sh
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```
- Verify the installation:
```sh
lazygit --version
```
- Clean installation files:
```sh
rm -rf lazygit lazygit.tar.gz
```

## 11. Docker Installation
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
- Verify these lines are in the `.zprofile` file
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

## 12. Scripts
See [Scripts](scripts/README.md)
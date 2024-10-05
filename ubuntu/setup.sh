#!/bin/bash

echo "Please enter your personal username (for git configuration):"
read GIT_USER
echo "Please enter your personal email (for git configuration):"
read GIT_EMAIL

echo "Define Git personal folder: "
export GIT_PERSO=$HOME/perso
mkdir -p $GIT_PERSO
echo $GIT_PERSO

echo "Define config folder: "
export XDG_CONFIG_HOME=$HOME/.config
mkdir -p $XDG_CONFIG_HOME
echo $XDG_CONFIG_HOME

echo "Copy configurations..."
cp -r .config/bat/ $XDG_CONFIG_HOME
cp -r .config/git/ $XDG_CONFIG_HOME
cp -r .config/k9s/ $XDG_CONFIG_HOME
cp -r .config/lazygit/ $XDG_CONFIG_HOME
cp -r .config/vscode/ $XDG_CONFIG_HOME
cp -r .config/zsh/ $XDG_CONFIG_HOME
cp .config/starship.toml $XDG_CONFIG_HOME
cp .local/state/crossnote/style.less $HOME/.local/state/crossnote/

echo "Overwrite personal user and email in git configurations"
sed -i 's/<name_perso>/$GIT_USER/g' $XDG_CONFIG_HOME/git/.gitconfig.perso
sed -i 's/<email_perso>/$GIT_EMAIL/g' $XDG_CONFIG_HOME/git/.gitconfig.perso
sed -i 's/<key_perso>/perso_github_$GIT_USER/g' $XDG_CONFIG_HOME/git/.gitconfig.perso

echo "Install VSCode extensions"
cat $XDG_CONFIG_HOME/vscode/wsl-extensions.txt | xargs -L 1 code --install-extension

echo "Create symbolic links for configurations..."
ln -sf $XDG_CONFIG_HOME/git/.gitconfig $HOME/.gitconfig
ln -sf $XDG_CONFIG_HOME/vscode/settings.json $HOME/.vscode-server/data/Machine/settings.json
ln -sf $XDG_CONFIG_HOME/vscode/style.less $HOME/.local/state/crossnote/style.less
ln -sf $XDG_CONFIG_HOME/zsh/.zshrc $HOME/.zshrc

echo "Create ZSH cache folder: "
mkdir -p $HOME/.cache/zsh/
echo $HOME/.cache/zsh/

echo "Source .zshrc file..."
source $HOME/.zshrc

read -p "Press a key to continue ..."
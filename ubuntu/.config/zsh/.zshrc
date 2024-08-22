XDG_CONFIG_HOME=$HOME/.config
ZDOTDIR=$XDG_CONFIG_HOME/zsh
GIT_PERSO=$HOME/perso
GIT_PRO=$HOME/pro

# Source other configurations
configs=(
    "$ZDOTDIR/.zaliases"
    "$ZDOTDIR/.zprofile"
    "$ZDOTDIR/.zplugins"
    "$ZDOTDIR/.zhistory"
)
for config in "${configs[@]}"; do
    if [ -f "$config" ]; then
        source "$config"
    fi
done

# Run Fastfetch if it's installed
if command -v fastfetch &> /dev/null
then
    fastfetch
fi
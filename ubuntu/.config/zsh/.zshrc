# Source other configurations
configs=(
    "$ZDOTDIR/.zaliases"
    "$ZDOTDIR/.zplugins"
    "$ZDOTDIR/.zhistory"
)
for config in "${configs[@]}"; do
    if [ -f "$config" ]; then
        source "$config"
    fi
done

# Enable Bash completion compatibility
autoload -U +X bashcompinit && bashcompinit
# Set up Terraform completion
complete -C /usr/bin/terraform terraform

# Starship
eval "$(starship init zsh)"
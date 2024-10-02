export PATH=$PATH:$HOME/.local/bin

# Go
export PATH=$PATH:/usr/local/go/bin

# Pulumi
export PATH=$PATH:$HOME/.pulumi/bin

# Ruby
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# EZA
export EZA_COLORS="ur=92:uw=95:ux=0:ue=0:gr=92:gw=95:gx=0:tr=92:tw=95:tx=0:su=0:sf=0:xa=0:uu=0:un=0:gu=95:gn=95:da=95"

# FZF-TAB
LS_COLORS="$LS_COLORS:ow=1;34:" ; export LS_COLORS
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Allows for case-insensitive matching of completion options
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # set list-colors to enable filename colorizing
zstyle ':completion:*' menu no # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # preview directory's content with eza when completing cd

# Completion
autoload -U +X bashcompinit && bashcompinit # Enables Bash completion compatibility
complete -C /usr/bin/terraform terraform # Set up Terraform completion

# Theme
# Nord Palette: https://www.nordtheme.com/docs/colors-and-palettes
NORD_PALETTE=("#3b4252" "#434c5e" "#4c566a" "#d8dee9" "#e5e9f0" "#eceff4" "#8fbcbb" "#88c0d0" "#81a1c1" "#5e81ac" "#bf616a" "#d08770" "#ebcb8b" "#a3be8c" "#b48ead")

export MY_THEME=nord
if [[ "$MY_THEME" == "catpuccin_mocha" ]]; then
    export FZF_DEFAULT_OPTS=" \
        --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
        --multi"
    [ -f $ZDOTDIR/plugins/zsh-syntax-highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh ] && source $ZDOTDIR/plugins/zsh-syntax-highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh
    export BAT_THEME="Catppuccin Mocha"
elif [[ "$MY_THEME" == "nord" ]]; then
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=${NORD_PALETTE[10]}"
    export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
        --color=fg:${NORD_PALETTE[5]},bg:${NORD_PALETTE[1]},hl:${NORD_PALETTE[9]}
        --color=fg+:${NORD_PALETTE[5]},bg+:${NORD_PALETTE[1]},hl+:${NORD_PALETTE[9]}
        --color=info:${NORD_PALETTE[13]},prompt:${NORD_PALETTE[11]},pointer:${NORD_PALETTE[15]}
        --color=marker:${NORD_PALETTE[14]},spinner:${NORD_PALETTE[15]},header:${NORD_PALETTE[14]}"
    typeset -A ZSH_HIGHLIGHT_STYLES
    export ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=${NORD_PALETTE[11]},bold"
    export ZSH_HIGHLIGHT_STYLES[command]="fg=${NORD_PALETTE[14]},bold"
    export ZSH_HIGHLIGHT_STYLES[alias]="fg=${NORD_PALETTE[14]},bold"
    export ZSH_HIGHLIGHT_STYLES[builtin]="fg=${NORD_PALETTE[14]},bold"
    export BAT_THEME="Nord"
fi

# This script is designed to check if the current environment is running on a WSL
# and, if so, ensure that the Docker service is running
if grep -q "microsoft" /proc/version > /dev/null 2>&1; then
    if service docker status 2>&1 | grep -q "is not running"; then
        wsl.exe --distribution "${WSL_DISTRO_NAME}" --user root \
            --exec /usr/sbin/service docker start > /dev/null 2>&1
    fi
fi



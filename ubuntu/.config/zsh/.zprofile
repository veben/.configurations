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
export MY_THEME=catpuccin_mocha
if [[ "$MY_THEME" == "catpuccin_mocha" ]]; then
    export FZF_DEFAULT_OPTS=" \
        --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
        --multi"
elif [[ "$MY_THEME" == "nord" ]]; then
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#81a1c1'
    export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
        --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
        --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
        --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
        --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
fi

# This script is designed to check if the current environment is running on a WSL
# and, if so, ensure that the Docker service is running
if grep -q "microsoft" /proc/version > /dev/null 2>&1; then
    if service docker status 2>&1 | grep -q "is not running"; then
        wsl.exe --distribution "${WSL_DISTRO_NAME}" --user root \
            --exec /usr/sbin/service docker start > /dev/null 2>&1
    fi
fi



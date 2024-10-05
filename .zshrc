export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git 
    # zsh-eza
    zsh-z
    aws 
    conda-zsh-completion 
    # zsh-autocomplete 
    zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export PATH="/Users/mkhoatd/bin/:$GEM_HOME/bin:/opt/homebrew/bin:~/Library/Application Support/JetBrains/Toolbox/:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin

eval "$(op completion zsh)"; compdef _op op

eval "$(/opt/homebrew/bin/brew shellenv)"

alias "crc"="code ~/.zshrc"
alias "nrc"="nvim ~/.zshrc"
alias "src"="source ~/.zshrc"
alias "tf"="terraform"
alias "ma"="mamba activate"
alias "mi"="mamba install"
alias "mc"="mamba create -n"
__conda_setup="$('/Users/mkhoatd/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mkhoatd/miniforge3/etc/profile.d/conda.sh" ]; then
# . "/Users/mkhoatd/miniforge3/etc/profile.d/conda.sh"  # commented out by conda initialize
    else
# export PATH="/Users/mkhoatd/miniforge3/bin:$PATH"  # commented out by conda initialize
    fi
fi
unset __conda_setup

if [ -f "/Users/mkhoatd/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/mkhoatd/miniforge3/etc/profile.d/mamba.sh"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# # >>> aps initialize >>>
# # !! Contents within this block are managed by 'aps' !!
# source ~/aps/.aps_config
# alias aps="aps && source ~/aps/.aps_config"
# # <<< aps initialize <<<

export IDF_CCACHE_ENABLE=1
alias matter="source ~/esp-idf/export.sh && source ~/esp-matter/export.sh"
# alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig
export GEM_HOME=$HOME/.gem
export LC_ALL=en_US.UTF-8

[[ "$TERM_PROGRAM" == "CodeEditApp_Terminal" ]] && . "/Applications/CodeEdit.app/Contents/Resources/codeedit_shell_integration.zsh"
alias vim="nvim"

export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

function yt {
    yt-dlp  -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]" $1  2>&1 &
}

export TERM="xterm-256color"
[[ -n $TMUX ]] && export TERM="screen-256color"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export SRC_ENDPOINT="https://sourcegraph.com/"
export SRC_ACCESS_TOKEN="sgp_a0d7ccb4f752ea73_4937d4170826fd93892a88b0da980f2f3fad462f"

export OPENAI_API_KEY="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"


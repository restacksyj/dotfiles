
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /Users/yashjajoo/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
set fish_greeting

# alias vi="nvim ."
# alias oldvim="\vim"

function current_branch  
    set ref (git symbolic-ref HEAD 2> /dev/null); or \
    set ref (git rev-parse --short HEAD 2> /dev/null); or return
    echo $ref | sed -e 's|^refs/heads/||'
end

alias cl="clear"
alias c="clear"
alias cat="bat"
alias ls="exa"
alias rm="trash"

# Git aliases

alias gc="git commit"
alias gcm="git commit -m"
alias gs="git status"
alias ga="git add"
alias gfa="git fetch --all"
alias gsw="git switch"
alias gpl="git pull origin (current_branch)"
alias gpu="git push origin (current_branch)"
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim "
alias f="z"


function vi
    if count $argv > /dev/null
        nvim $argv
    else
        nvim .
    end
end

#set theme_color_theme tide
starship init fish | source
zoxide init fish | source
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$HOME/.cargo/bin:$PATH"
# load_nvm > /dev/stderr
# alias vi=nvim
# neofetch
# export PATH=/Users/yashjajoo/.local/share/solana/install/active_release/bin
# :/Users/yashjajoo/.local/share/solana/install/active_release/bin:/Users/yashjajoo/opt/anaconda3/bin:/Users/yashjajoo/opt/anaconda3/condabin:/Users/yashjajoo/.local/share/nvm/v12.22.12/bin:/usr/local/opt/php@7.1/sbin:/usr/local/opt/php@7.1/bin:/usr/local/opt/php@7.3/sbin:/usr/local/opt/php@7.3/bin:/usr/local/opt/php@7.2/sbin:/usr/local/opt/php@7.2/bin:/Users/yashjajoo/.fig/bin:/Users/yashjajoo/Documents/development/flutter/bin:/Users/yashjajoo/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/usr/local/share/dotnet:~/.dotnet/tools:/usr/local/go/bin:/Applications/Wireshark.app/Contents/MacOS:/Applications/kitty.app/Contents/MacOS:/Applications/Visual Studio Code.app/Contents/Resources/app/bin

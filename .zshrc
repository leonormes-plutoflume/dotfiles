alias config='/usr/bin/git --git-dir=/Users/leonormes/.cfg/ --work-tree=/Users/leonormes'
export KEYTIMEOUT=1
bindkey -v
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-history-substring-search"
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "plugins/vi-mode",   from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "b4b4r07/ultimate", as:theme
zplug "peterhurford/git-aliases.zsh"
zplug "robertzk/send.zsh"
zplug "zdharma/history-search-multi-word"
zplug "supercrabtree/k"
zplug "RobertAudi/tsm"
zplug "plugins/git",   from:oh-my-zsh
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
autoload -U promptinit; promptinit
prompt pure
zplug load --verbose

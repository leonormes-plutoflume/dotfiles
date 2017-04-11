alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
export KEYTIMEOUT=1
bindkey -v
source ~/.zplug/init.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "rupa/z", use:z.sh
zplug "plugins/vi-mode",   from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "peterhurford/git-aliases.zsh"
zplug "robertzk/send.zsh"
zplug "supercrabtree/k"
zplug "RobertAudi/tsm"
zplug "plugins/git",   from:oh-my-zsh
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/leonormes/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/leonormes/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/leonormes/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/leonormes/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

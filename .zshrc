source ~/aws_mta_staging_creds.sh
source ~/.zplug/init.zsh
fpath=(~/.zsh/completion $fpath)
export SHELL="/bin/zsh"
export FZF_DEFAULT_OPTS='--height=70% --color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81
--color info:144,prompt:161,spinner:135,pointer:135,marker:118'
export EDITOR='code'
export USE_EDITOR=$EDITOR
export TERM="xterm-256color"
export VISUAL=$EDITOR
export KEYTIMEOUT=1
export PATH="$HOME/.local/:/usr/share/applications:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases
alias sshout="ssh -i files/staging/ssh_keys/mta-staging-common.key core@ec2-52-50-178-80.eu-west-1.compute.amazonaws.com"
alias sshjou="ssh -i files/staging/ssh_keys/mta-staging-common.key core@ec2-34-245-246-119.eu-west-1.compute.amazonaws.com"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias deploy12="ansible-playbook mta-tenant.yml -e ENVIRONMENT=staging -e TENANT=quivertest12"
alias ls='ls --color'
alias la='ls -alF'

LC_CTYPE=en_GB.UTF-8
LC_ALL=en_GB.UTF-8
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt CORRECT
setopt histignorealldups sharehistory
setopt NO_FLOW_CONTROL
bindkey -v
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "rupa/z", use:z.sh
zplug "plugins/vi-mode",   from:oh-my-zsh
zplug 'so-fancy/diff-so-fancy'
zplug "zdharma/history-search-multi-word"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "supercrabtree/k"
zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi
zplug load
autoload -Uz compinit && compinit -i

# fuzzy grep open via ag with line number
vg() {
  local file
  local line

  read -r file line <<<"$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"

  if [[ -n $file ]]
  then
     code -g "$file:$line"
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
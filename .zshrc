alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
fpath=(~/.zsh/completion $fpath)
export SHELL="/bin/zsh"
export EDITOR='code'
export USE_EDITOR=$EDITOR
export TERM="xterm-256color"
export VISUAL=$EDITOR
LC_CTYPE=en_GB.UTF-8
LC_ALL=en_GB.UTF-8
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
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
export KEYTIMEOUT=1
bindkey -v
source ~/.zplug/init.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "rupa/z", use:z.sh
zplug "plugins/vi-mode",   from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "supercrabtree/k"
zplug "mafredri/zsh-async", from:github
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi
zplug load
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height=70% --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
--color info:150,prompt:110,spinner:150,pointer:167,marker:174' 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
autoload -Uz compinit && compinit -i

# fuzzy grep open via ag with line number
vg() {
  local file
  local line

  read -r file line <<<"$(ag -nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"

  if [[ -n $file ]]
  then
     code -g "$file:$line"
  fi
}

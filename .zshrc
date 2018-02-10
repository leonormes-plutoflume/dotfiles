alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
fpath=(~/.zsh/completion $fpath)
export SHELL="/bin/zsh"
export EDITOR='vim'
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
alias tat='tmux -2 new-session -As $(basename "$PWD" | tr . -)'
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
zplug "peterhurford/git-aliases.zsh"
zplug "robertzk/send.zsh"
zplug "supercrabtree/k"
zplug "mafredri/zsh-async", from:github
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
zplug "RobertAudi/tsm"
zplug "plugins/git",   from:oh-my-zsh
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi
zplug load
tm() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
    tmux attach-session -t "$session" || tmux new-session -s $newsession
}
export PATH=$HOME/.cargo/bin:$PATH
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules,yarn.lock}/*"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
autoload -Uz compinit && compinit -i

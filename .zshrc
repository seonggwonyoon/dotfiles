alias c="clear"
alias k="kubectl"
alias u="brew upgrade; brew cu -acy"
export GPG_TTY=$(tty)
export ZSH="/Users/seonggwonyoon/.oh-my-zsh"
ZSH_THEME="cypher"
plugins=(
  git
  docker
  docker-compose
)
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

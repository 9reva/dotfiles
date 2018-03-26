if [[ ! -f ~/.antigen/antigen.zsh ]]; then
    curl -L git.io/antigen --create-dirs -o ~/.antigen/antigen.zsh
fi

if [[ -f ~/.antigen/antigen.zsh ]]; then
    source ~/.antigen/antigen.zsh
    antigen bundle zsh-users/zsh-completions
    antigen bundle zsh-users/zsh-autosuggestions
    antigen apply
fi
bindkey -e
bindkey "\e[Z" reverse-menu-complete

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

autoload -Uz compinit && compinit -u
zstyle ':completion:*' menu select interactive
setopt MENU_COMPLETE

compinit -u
if [ -e ~/.zsh/completion ]; then
    fpath=(~/.zsh/completion $fpath)
fi
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

if [ -e ~/.antigen/bundles/zsh-users/zsh-completions/src ]; then
    fpath=(~/.antigen/bundles/zsh-users/zsh-completions/src $fpath)
fi

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補を詰めて表示
setopt list_packed
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select

setopt correct
setopt no_beep

autoload -Uz vcs_info

# PROMPT変数内で変数参照
setopt prompt_subst

# prompt
autoload -Uz vcs_info
autoload -Uz colors # black red green yellow blue magenta cyan white
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'


precmd() { vcs_info }
PROMPT='%F{green}%n@%m:%f%~%F{green}$%f '
RPROMPT='${vcs_info_msg_0_}'


# alias
alias ls='ls -aF'
alias ll='ls -l'
alias vi='vim'
alias cat='cat -n'
alias less='less -NM'
alias gs='git status' 
alias gp='git push' 
alias gf='git fetch' 
alias ag='ag -S -p ~/.ignore' 

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

git config --global user.name "x1nyuan"
git config --global user.email "yao.ntno@gmail.com"
git config --global push.default simple
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
git config --global mergetool.keepBackup false
git config --global credential.helper cache
git config --global core.autocrlf false
git config --global credential.helper 'cache --timeout 28800'
git config --global http.postBuffer 52428800
stty -ixon

export FZF_DEFAULT_COMMAND='ag -S -p ~/.ignore --files-with-matches .'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export EDITOR=vim
export TERM=xterm-256color
export PATH="$HOME/.yarn/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

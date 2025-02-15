#
# Frans .zshrc
# 


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Load the functions and then call them
autoload -Uz compinit promptinit colors && colors
compinit
promptinit


# Emacs keys
bindkey -e


# Enable substitution in prompt
setopt PROMPT_SUBST


ulimit -u 3000		# Protect against fork bombs by limiting max user procs to 3000


# Exports
export TERM='xterm-256color'
export BROWSER='/usr/bin/brave'
export EDITOR='/usr/bin/vim'
export VISUAL='/usr/bin/vim'
export PAGER='/usr/bin/less'
export PATH=$PATH:~/scripts/
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth:erasedups
export HISTFILE=~/.cache/zsh/history


# Aliases
alias updateall='sudo pacman -Syu'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias ls='ls --color=auto'
alias v='vim'
alias vcfg='vim ~/.vimrc'
alias pic='~/Pictures'
alias doc='~/Documents'
alias dow='~/Downloads'
alias grep='grep --color=auto'
alias r='ranger'
alias zzz='systemctl suspend'


# Prompt before overwriting
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'



# Add the exit code to the prompt if != 0 
prompt() {
  value=$?
  [[ $value -ne 0 ]] && echo $value
}


# Prompt
PS1='%B%F{green}[%F{red}%n%F{green}@%F{yellow}%m%F{green}]%F{green}:%F{red}$(prompt)%B%F{white}~%b%f $ '


source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

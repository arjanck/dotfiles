 autoload -U colors && colors
 setopt prompt_subst
 function git_prompt() {
     function __git_prompt_git() {
         GIT_OPTIONAL_LOCKS=0 command git "$@"
     }
     if ! __git_prompt_git rev-parse --git-dir &>/dev/null; then
         return 0
     fi
     local ref
     ref=$(__git_prompt_git symbolic-ref --short HEAD 2>/dev/null) ||
         ref=$(__git_prompt_git rev-parse --short HEAD 2>/dev/null) ||
         return 0
     local dirty
     [[ -n $(__git_prompt_git status --porcelain 2>/dev/null | tail -1) ]] && dirty=" ✗"
     echo " %{$fg[yellow]%}git:(%{$fg[red]%}${ref}%{$fg[yellow]%})%{$fg[red]%}${dirty}"
 }
 
 source ~/my_zsh/zsh-defer/zsh-defer.plugin.zsh
 
 autoload -Uz git_prompt
 
 function precmd() {
     git_prompt >/dev/null
 }
 
 PROMPT=" %B%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) "
 
 if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ "$(whoami)" = "achakr33" ]; then
     PROMPT+="%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[cyan]%}@%{$fg[yellow]%}%M%{$fg[red]%}] "
 fi
 
 PROMPT+='%{$fg[cyan]%}%1~$(git_prompt)%{$reset_color%}%b '
 
 zsh-defer source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
 
 alias vim="nvim"
 alias ls="ls -hG"
 alias rm="rm -v"
 
 alias sshfastx="ssh -Y achakr33@fastx-cluster.cs.brown.edu"
 alias sshbrown="ssh -Y achakr33@ssh.cs.brown.edu"
 alias sshccv="ssh achakr33@sshcampus.ccv.brown.edu"
 
 wifi-password() {
     if [[ -n "$1" ]]; then
         wifi="$1"
     else
         wifi=$(networksetup -getairportnetwork en0 | sed 's/^Current Wi-Fi Network: //')
     fi
     
     if [[ -z $wifi ]]; then
         echo "Currently not connected to a Wi-Fi network..."
         return 1
     fi 
 
     password=$(security find-generic-password -wga "$wifi" 2>&1)
 
     if [[ $? -eq 0 ]]; then
         echo "$password" 
     else
         echo "Password not found or no access to keychain for $wifi"
     fi
 }
 
 function conda_startup() {
     __conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
     if [ $? -eq 0 ]; then
         eval "$__conda_setup"
     else
         if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
             . "$HOME/miniconda3/etc/profile.d/conda.sh"
         else
             export PATH="$HOME/miniconda3/bin:$PATH"
         fi
     fi
     unset __conda_setup
 }
 
# function setup_nvm() {
#     export NVM_DIR="$HOME/.nvm"
#     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#     [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# }
# zsh-defer setup_nvm
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

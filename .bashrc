
# Check for an interactive session
[ -z "$PS1" ] && return

#alias ssh='ssh -X'

export EDITOR='vim'
export VISUAL='vim'

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

export DEVKITPRO=/opt/devkitpro
export DEVKITPPC=$DEVKITPRO/devkitPPC
export PATH=$PATH:$DEVKITPPC/usr/local/bin:/bin
PATH=$PATH:/Users/n00shie/.local/bin


hostn=$(hostname -s)
usern=$(whoami)

userc="\[\e[1;30m\]"
# timec="\[\e[1;30m\]"
# typec="\[\e[1;30m\]"
dirc="\[\e[1;30m\]"
nc="\[\e[0m\]"

function prompt {

ctime=$(date +%R)
prmpt="-[${usern}@${hostn}][${PWD}][${ctime}]"
cols=$(tput cols)
let FILLS=${cols}-${#prmpt}
LINE=""

if [[ "$PWD" =~ "/home/$usern" ]]
 then
  let FILLS=$FILLS+5+${#usern}
fi

parse_git_branch(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

for (( f=0; f<$FILLS; f++ ))
  do
   LINE=$LINE
  done
   #PS1="\n$nc\[\e(0l\e(B\]<$userc\[\e[0;35m\]\u@\H \[\e[0;36m\]\w\[\e[0;36m\]$nc>${LINE}<$timec${ctime}$nc>\n"
   #PS1=$PS1"\[\e(0\]m$typec\[\e[0;31m\]\$\[\e[m\]$nc\[\e(0\]\[\e(B\] "
   PS1='\n\[\e[0;34m\]\u\[\e[0;0m\]@\[\e[1;0m\]\h\[\e[0;0m\]:\[\e[1;32m\]\w\[\e[0;0m\]$LINE<$timec${ctime}>$(parse_git_branch)\n'
   PS1=$PS1"\[\e(0\]m$typec\[\e[0;31m\]\$\[\e[m\]$nc\[\e(0\]\[\e(B\]"

} 
PROMPT_COMMAND=prompt

alias ls='ls -lh'
alias l='ls'
alias chrome='google-chrome &'
alias skype='skype &'

#Windows directory
alias whome='cd /media/6DD9E4B7509CC187'
alias wprog='cd /media/6DD9E4B7509CC187/My\ Programs/'
alias wmus='cd /media/6DD9E4B7509CC187/Music'

#git
alias gc='git commit'
alias gs='git status'
alias gco='git checkout'
alias ga='git add'
alias gbr='git branch'
alias grb='git rebase'
alias gps='git push'
alias gpl='git pull'

#ssh
alias sshuw='ssh asaidmur@linux.student.cs.uwaterloo.ca'
alias asai='asaidmur@linux.student.cs.uwaterloo.ca'
alias poop='echo poop'

#Drush
alias dcc='drush cc all'
alias dccjs='drush cc css+js'

mkcd () {
	mkdir -p $1;  
	cd $1;
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

print_before_the_prompt () {
    printf "\n $txtred%s: $bldgrn%s $txtpur%s\n$txtrst" "$USER" "$PWD" "$(vcprompt)"
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[ -s "/Users/n00shie/.scm_breeze/scm_breeze.sh" ] && source "/Users/n00shie/.scm_breeze/scm_breeze.sh"

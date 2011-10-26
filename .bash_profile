
# 
# This loads RVM into a shell session.
#
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#
# GIT helpful commands
#
function __current_branch_action {
  echo  "git $1`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`"
  eval  "git $1`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`"
}

#
# $ gmox
# 
# This is equivalent of typing in the following
#
# $ git merge origin CURRENTBRANCH
#
function gmox {
  __current_branch_action "merge origin/"
}


#
# $ grox
# 
# This is equivalent of typing in the following
#
# $ git rebase origin CURRENTBRANCH
#
function grox {
  __current_branch_action "rebase origin/"
}

#
# $ gpox
#
# This is equivalent of typing in the following:
#
# $ git push origin CURRENTBRANCH
#
function gpox {
  __current_branch_action "push origin "
}

#
# RVM / GIT Prompt.
#
#  - This prompt will show the RVM version/gemset with the git branch that are
#    currently on.
#
function prompt {

local LIGHT_RED="\[\033[1;31m\]"
local LIGHT_GREEN="\[\033[1;32m\]"
local NO_COLOUR="\[\033[0m\]"

local TITLEBAR='\[\033]0;\u@\h\007\]'

source ~/.git-completion.bash

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_SHOWSTASHSTATE=true

PS1="$TITLEBAR\n\w/$LIGHT_GREEN\$(__git_ps1 ' (%s)') $LIGHT_RED\$(~/.rvm/bin/rvm-prompt i v g)\n$NO_COLOUR$ "

}

#call the prompt function to set things in motion
prompt



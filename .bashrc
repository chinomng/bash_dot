# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

. ~/.shell/aliases
#. ~/.shell/variables
#. ~/.shell/functions

# bash completion
for f in $HOME/.shell/completion.d/*; do
   . $f
done

export PYTHONSTARTUP=$HOME/.pythonrc.py

export WORKON_HOME=~/Envs
source ~/.local/bin/virtualenvwrapper.sh

# xinput -list | grep -i key
# ThinkPad Extra Buttons id=14 [slave  keyboard (3)]
x1_id=$(xinput list | sed -n 's/.*ThinkPad Extra Buttons.*id=\([0-9]*\).*keyboard.*/\1/p')
setxkbmap -device $x1_id -layout us -variant altgr-intl -option nodeadkeys
# HID 04f3:0103 id=16 [slave  keyboard (3)]
genius_id=$(xinput list | sed -n 's/.*HID 04f3:0103.*id=\([0-9]*\).*keyboard.*/\1/p')
setxkbmap -device $genius_id -layout es 

xset r rate 700 50

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias python=python3


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

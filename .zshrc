# http://www.zsh.org/
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt hist_save_no_dups

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s

#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' menu select

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


source ~/.shell/aliases
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'

source ~/.oh-my-zsh
source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle django
antigen bundle git-extras
antigen bundle pip
antigen bundle sudo
antigen bundle command-not-found

antigen bundle pip
antigen bundle python
antigen bundle virtualenv

antigen bundle docker

antigen bundle autojump

antigen bundle dirhistory

antigen bundle web-search

antigen bundle common-aliases

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load the theme.
antigen theme amuse

# Tell Antigen that you're done.
antigen apply


# xinput -list | grep -i key
# ThinkPad Extra Buttons id=14 [slave  keyboard (3)]
x1_id=$(xinput list | sed -n 's/.*ThinkPad Extra Buttons.*id=\([0-9]*\).*keyboard.*/\1/p')
setxkbmap -device $x1_id -layout us -variant altgr-intl -option nodeadkeys
# HID 04f3:0103 id=16 [slave  keyboard (3)]
genius_id=$(xinput list | sed -n 's/.*HID 04f3:0103.*id=\([0-9]*\).*keyboard.*/\1/p')
setxkbmap -device $genius_id -layout es 


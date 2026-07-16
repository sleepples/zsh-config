bindkey -v
# fix unable to delete some text
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    echo -ne "\e[6 q"
}

# paste from sys clipboarright bufferd {{{
vi-append-x-selection () {
  # RBUFFER is all characters to the right
  # this sets the RBUFFER to the first character of RBUFFER then
  # appends the clipboard then appends the rest of the RBUFFER
  RBUFFER=$RBUFFER[1]$(xclip -o -sel c </dev/null)$RBUFFER[2,-1]
}
zle -N vi-append-x-selection
bindkey -a 'p' vi-append-x-selection
# }}}

zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

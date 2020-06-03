# Change cursor according to vim-mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
     echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]]; then
       echo -ne '\e[5 q'
  fi

  zle reset-prompt
}

zle -N zle-keymap-select

function zle-line-finish {
  echo -ne '\e[5 q'
}
zle -N zle-line-finish

_fix_cursor() {
   echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)
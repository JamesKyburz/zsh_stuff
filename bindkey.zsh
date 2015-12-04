set -o vi

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

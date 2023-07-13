# Setup fzf
# ---------
if [[ ! "$PATH" == */home/vianney/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/vianney/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/vianney/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/vianney/.fzf/shell/key-bindings.zsh"
# reset ALT-c as it used by tmux
bindkey -r "^[c"

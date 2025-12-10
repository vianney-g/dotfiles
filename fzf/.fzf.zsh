# Setup fzf
# ---------
if [[ ! "$PATH" == */home/vianney/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/vianney/.fzf/bin"
fi

source <(fzf --zsh)

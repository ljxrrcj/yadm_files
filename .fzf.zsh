# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ljx/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/ljx/.fzf/bin"
fi

source <(fzf --zsh)

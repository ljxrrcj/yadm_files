# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ljx/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/ljx/.fzf/bin"
fi

export FZF_CTRL_T_OPTS="
  --preview 'cat -n {}'
  --walker file,follow
  --walker-skip out" # if you want to search files in out/, please go into out/ and use fzf to search

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --walker-skip out # if you want to search files in out/, please go into out/ and use fzf to search
  --preview 'tree -C {}'"

eval "$(fzf --bash)"

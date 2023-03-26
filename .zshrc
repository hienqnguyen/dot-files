# https://github.com/iggredible/Learn-Vim/blob/master/ch03_searching_files.md#setup
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi

if [[ -d $HOME/.github.com/cmds/bin ]]; then
  export PATH=$PATH:$HOME/.github.com/cmds/bin
  source $HOME/.github.com/cmds/completions.zsh
fi

# https://github.com/iggredible/Learn-Vim/blob/master/ch03_searching_files.md#setup
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi

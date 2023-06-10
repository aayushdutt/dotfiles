alias c="clear"
alias alss="nvim ~/.bash_aliases"
alias alsss="source ~/.bash_aliases"
alias claer="clear"
alias tt="gio trash" # to trash

# git
alias gpoh="git push origin head"
alias gs="git status"
alias rbranches="git branch -v --sort=-committerdate"


alias bat="batcat"

function edt() {
	nvim `find ./* -name $1 | fzf`
}

function findig() {
  # Find command for fzf which ignores the directories passed from arg
  local exclude=()
  local dir
  for dir in "$@"; do
    exclude+=( -path "/$dir/" -o )
  done
  find . -type d \( "${exclude[@]}" -false \) -prune -o -print
}


# Mac
notify() {
  osascript -e 'display notification "'$1'" with title "'$2'"'
}


# Virtual Env
installvenv() {
    virtualenv -p $(pyenv which python) $1
}
alias srcv="source ~/venv3/bin/activate"
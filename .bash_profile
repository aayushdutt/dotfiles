[[ -r ~/.bashrc ]] && . ~/.bashrc
# fzf keybindings
source /usr/share/doc/fzf/examples/key-bindings.bash

# History size
HISTSIZE=10000
HISTFILESIZE=10000


parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ ['$'\u2387'' \1]/p'
}
# git_icon() {
#   # NOTE: printing icon requires install font on http://fontawesome.io/
#   # Choose one icon you like
#   #printf ' \uf126 '  # http://fontawesome.io/icon/code-fork/
#   # printf ' \uf09b '  # http://fontawesome.io/icon/github/
#   printf '\u2387'  # http://fontawesome.io/icon/github/
# }
COLOR_DEF='%f'
COLOR_USR='%F{246}'
COLOR_DIR='%F{42}'
COLOR_GIT='%F{105}'
COLOR_PROMPT='%F{6}'
NEWLINE=$'\n'
# setopt PROMPT_SUBST
# export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~${COLOR_GIT}$(parse_git_branch) ⌚ ${COLOR_USR}%*${NEWLINE}${COLOR_DIR}\$ ${COLOR_DEF}'


# locale fix
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
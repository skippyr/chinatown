# Enables prompt substitution.
#
# This makes ZSH substitute variables and functions inside of the PROMPT
# variables. For it to work, they must be defined using single quotes.
setopt promptsubst
# Disables the default changes made to the prompt when sourcing a virtual
# environment.
export VIRTUAL_ENV_DISABLE_PROMPT="1"

# Prints the name of sourced virtual environments.
function _chinatown::print_venv {
  typeset -r venv=${VIRTUAL_ENV##*/}
  [[ -n ${venv} ]] &&
  echo "%K{green} %F{black}  ${venv} %F{green}%K{red} %F{black}" ||
  echo "%K{red} %F{black}"
}

# Prints the current directory path abbreviating the name of parent directories.
function _chinatown::print_pwd {
  typeset pwd=("${(s./.)PWD/${HOME}/~}")
  [[ ${#pwd} > 1 ]] &&
  for splits_iterator in {1..$((${#pwd} - 1))}; do
    [[ "${pwd[splits_iterator]}" == .* ]] &&
    pwd[splits_iterator]=${pwd[splits_iterator][1,2]} ||
    pwd[splits_iterator]=${pwd[splits_iterator][1]}
  done
  echo ${(j./.)pwd}
}

# If inside a Git repository, it prints a decorator whenever there are changes
# to be commited.
function _chinatown::print_git_changes {
  [[ -n $(git status --porcelain 2>/dev/null) ]] &&
  echo "✗"
}

# If inside a Git repository, it prints the latest tag.
function _chinatown::print_git_tag {
  typeset -r tag=$(git describe --tags --abbrev=0 2>/dev/null)
  [[ -n ${tag} ]] &&
  echo "%F{yellow}%K{magenta} %F{black}  ${tag} %F{magenta}%k" ||
  echo "%F{yellow}%k"
}

# If inside a Git repository, it prints name of the branch.
function _chinatown::print_git_branch {
  typeset -r branch=$(git branch --show-current 2>/dev/null)
  [[ -n ${branch} ]] &&
  echo "%K{yellow} %F{black} 󰘬 ${branch}$(_chinatown::print_git_changes) $(_chinatown::print_git_tag)" ||
  echo ""
}

# The precmd function is a ZSH builtin function that gets executed every time
# before the prompt gets printed.
#
# This one is a workaround to make it print a new line character before the
# prompt and make it more comfortable to use.
function precmd {
  function precmd {
    echo
  }
}

PROMPT='%K{black}%F{red} %f %(?..🔥)🐉 %n@%m %F{black}%K{8} %F{8}$(_chinatown::print_venv)  $(_chinatown::print_pwd) %k%F{red}$(_chinatown::print_git_branch) 
%F{8} ✗%f '

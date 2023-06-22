# Enables ZSH prompt substitution.
#
# This make it substitute variables and functions in the prompt variables, but
# they need to be defined using single quotes for it to work.
setopt promptsubst
# Prevents the default changes made to the prompt when sourcing a virtual
# environment.
export VIRTUAL_ENV_DISABLE_PROMPT="1"

# To avoid conflicts with possible user defined functions, all functions defined
# in this theme use the "chinatown::" prefix.
#
# They might also use an underline character (_) at their start to make them
# harder to find when using a regular tab completition.

# If using a virtual environment, prints its base name.
function _chinatown::print_venv {
  typeset -r venv=${VIRTUAL_ENV##*/}
  [[ -n ${venv} ]] &&
  echo "%K{green} %F{black}  ${venv} %F{green}%K{red} %F{black}" ||
  echo "%K{red} %F{black}"
}

# Prints the current directory path (PWD) with the name of parent directories
# abbreviated. A tilde character (~) substitutes the ${HOME} directory.
function _chinatown::print_pwd_abbreviated {
  typeset -a pwd=("${(s./.)PWD/${HOME}/~}")
  [[ ${#pwd} > 1 ]] &&
  for splits_iterator in {1..$((${#pwd} - 1))}; do
    [[ "${pwd[splits_iterator]}" == .* ]] &&
    pwd[splits_iterator]="${pwd[splits_iterator][1,2]}" ||
    pwd[splits_iterator]="${pwd[splits_iterator][1]}"
  done
  echo "${(j./.)pwd}"
}

# If inside a Git repository, prints a decorator if there are changes to be
# commited.
function _chinatown::print_git_changes {
  [[ -n $(git status --porcelain 2>/dev/null) ]] &&
  echo "✗"
}

# If inside a Git repository, prints the latest tag if it is available.
function _chinatown::print_git_tag {
  typeset -r tag=$(git describe --tags --abbrev=0 2>/dev/null)
  [[ -n ${tag} ]] &&
  echo "%F{yellow}%K{magenta} %F{black}  ${tag} %F{magenta}%k" ||
  echo "%F{yellow}%k"
}

# If inside a Git repository, prints the name of the branch, if there are
# changes to be commited and the latest tag.
function _chinatown::print_git_info {
  typeset -r branch=$(git branch --show-current 2>/dev/null)
  [[ -n ${branch} ]] &&
  echo "%K{yellow} %F{black} 󰘬 ${branch}$(_chinatown::print_git_changes) $(_chinatown::print_git_tag)" ||
  echo ""
}

# The "precmd" function is a ZSH builtin function that gets executed every time
# before the prompt gets printed.
#
# This setup is a work-around to make it print a new line after each command to
# make the theme be more comfortable to use.
function precmd {
  function precmd {
    echo
  }
}

PROMPT='%K{black}%F{red} %f %(?..🔥)🐉 %n@%m %F{black}%K{8} %F{8}$(_chinatown::print_venv)  $(_chinatown::print_pwd_abbreviated) %k%F{red}$(_chinatown::print_git_info) %f
%F{8} ✗%f '

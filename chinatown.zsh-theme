setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

_chinatown() {
  get_virtual_environment() {
    [[ ${VIRTUAL_ENV} ]] &&
      echo "%K{2} %F{0}  ${VIRTUAL_ENV##*/} %K{1}%F{2} " || echo "%K{1} "
  }

  get_directory() {
    typeset -a directory_splits=("${(s./.)PWD/${HOME}/~}")
    [[ ${#directory_splits} -gt 1 ]] &&
      for directory_split_index in {1..$((${#directory_splits} - 1))}; do
        [[ "${directory_splits[directory_split_index]}" == .* ]] &&
          directory_splits[directory_split_index]=${directory_splits[directory_split_index][1,2]} ||
          directory_splits[directory_split_index]=${directory_splits[directory_split_index][1]}
      done
    echo ${(j./.)directory_splits}
  }

  get_tag() {
    typeset -r tag=$(git describe --tags --abbrev=0 2>/dev/null)
    [[ ${tag} ]] && echo "%K{5} %F{0}  ${tag} %k%F{5} " || echo "%k "
  }

  get_branch() {
    typeset -r branch=$(git branch --show-current 2>/dev/null)
    [[ ${branch} ]] &&
      echo "%K{3} %F{0} 󰘬 ${branch} %F{3}$(get_tag)" || echo "%k "
  }

  echo\
    "%K{0}%F{1} %F{7}%(?..🔥)🐉 %n@%m %K{8}%F{0}%F{8}"\
    "$(get_virtual_environment)%F{0}  $(get_directory)"\
    "%F{1}$(get_branch)\n%F{8} ✗%f "
}

PROMPT='$(_chinatown)'

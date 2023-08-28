export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

_chinatown() {
  get_venv() {
    [[ ${VIRTUAL_ENV} ]] && echo "%K{2}   ${VIRTUAL_ENV##*/} %F{2}"
  }

  get_cwd() {
    d=("${(s./.)PWD/${HOME}/~}")
    [[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
      [[ ${d[i]} == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
    done
    echo ${(j./.)d}
  }

  get_tag() {
    t=$(git describe --tags --abbrev=0 2>/dev/null)
    [[ ${t} ]] && echo "%K{5} %F{0}  ${t} %F{5}"
  }

  get_branch() {
    b=$(git branch --show-current 2>/dev/null)
    [[ ${b} ]] && echo "%K{3} %F{0} 󰘬 ${b} %F{3}$(get_tag)"
  }

  echo "%K{0}%F{1} %F{7}%(?..🔥)🐉 %n@%m %F{0}$(get_venv)%K{1} %F{0} "\
       "$(get_cwd) %F{1}$(get_branch)%k %F{8}\n ✗%f "
}

PROMPT='$(_chinatown)'

export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function _chinatown_get_venv() {
  [[ ${VIRTUAL_ENV} ]] && "%K{2} %F{0}  ${VIRTUAL_ENV##*/}"                  \
                          "%K{1}%F{2} %F{0}" || echo "%K{1} "
}

function _chinatown_get_dir_abbr() {
  local d=("${(s./.)PWD/${HOME}/~}")
  [[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
    [[ ${d[i]} == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
  done
  echo ${(j./.)d}
}

function _chinatown_get_tag() {
  local t=$(git describe --tags --abbrev=0 2>/dev/null)
  [[ ${t} ]] && echo "%K{5} %F{0}  ${t} %k%F{5} " || echo "%k "
}

function _chinatown_get_branch() {
  local b=$(git branch --show-current 2>/dev/null)
  [[ ${b} ]] && echo "%K{3} %F{0} 󰘬 ${b}%F{3} $(_chinatown_get_tag)" ||
                echo "%k "
}

PROMPT='%K{0}%F{1} %F{7}%(?..🔥)🐉 %n@%m %F{0}$(_chinatown_get_venv)  \
$(_chinatown_get_dir_abbr) %F{1}$(_chinatown_get_branch) '

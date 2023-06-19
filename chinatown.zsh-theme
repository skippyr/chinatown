setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT="1"

function _chinatown::venv {
	typeset -r venv=${VIRTUAL_ENV##*/}
	[[ -n ${venv} ]] &&
	echo "%K{green} %F{black}  ${venv} %F{green}%K{red}%F{black}" ||
	echo "%K{red}%F{black}"
}

function _chinatown::pwd {
	typeset pwd=("${(s./.)PWD/${HOME}/~}")
	[[ ${#pwd} > 1 ]] &&
	for splits_iterator in {1..$((${#pwd} - 1))}; do
		[[ "${pwd[splits_iterator]}" == .* ]] &&
		pwd[splits_iterator]=${pwd[splits_iterator][1,2]} ||
		pwd[splits_iterator]=${pwd[splits_iterator][1]}
	done
	echo ${(j./.)pwd}
}

function _chinatown::changes {
	[[ -n $(git status --porcelain 2>/dev/null) ]] &&
	echo "✗"
}

function _chinatown::tag {
	typeset -r tag=$(git describe --tags 2>/dev/null)
	[[ -n ${tag} ]] &&
	echo "%F{yellow}%K{magenta}%F{black}   ${tag} %F{magenta}%k" ||
	echo "%F{yellow}%k"
}

function _chinatown::branch {
	typeset -r branch=$(git branch --show-current 2>/dev/null)
	[[ -n ${branch} ]] &&
	echo "%K{yellow}%F{black}  󰘬 ${branch}$(_chinatown::changes) $(_chinatown::tag)" ||
	echo ""
}

function precmd {
	function precmd {
		echo
	}
}

PROMPT='%K{black} %n@%m %F{black}$(_chinatown::venv)   $(_chinatown::pwd) %k%F{red}$(_chinatown::branch) 
 %(?..🔥)🐉 %F{yellow}⇢%f  '

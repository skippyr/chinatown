setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT="1"

function _chinatown::venv {
	typeset -r venv=${VIRTUAL_ENV##*/}
	if [[ -n ${venv} ]]; then
		echo "%K{green}   %B${venv}%b %F{green}%K{red}%F{black}"
	else
		echo "%K{red}"
	fi
}

function _chinatown::pwd {
	typeset pwd=("${(s./.)PWD/${HOME}/~}")
	if [[ ${#pwd} > 1 ]]; then
		for splits_iterator in {1..$((${#pwd} - 1))}; do
			if [[ "${pwd[splits_iterator]}" == .* ]]; then
				pwd[splits_iterator]=${pwd[splits_iterator][1,2]}
			else
				pwd[splits_iterator]=${pwd[splits_iterator][1]}
			fi
		done
	fi
	echo ${(j./.)pwd}
}

function _chinatown::branch_changes {
	[[ -n $(git status --porcelain 2>/dev/null) ]] && echo "✗"
}

function _chinatown::branch {
	typeset -r branch=$(git branch --show-current 2>/dev/null)
	if [[ -n ${branch} ]]; then
		echo "%K{yellow}%F{black}  󰘬 %B${branch}%b$(_chinatown::branch_changes) %F{yellow}%k"
	else
		echo ""
	fi
}

precmd() { precmd() {
		echo
} }

PROMPT='%K{black} %(?..🔥)🐉 %n@%B%m%b %F{black}$(_chinatown::venv)   %B$(_chinatown::pwd)%b %k%F{red}$(_chinatown::branch)%f  '

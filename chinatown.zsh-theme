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

function _chinatown::branch_changes {
	typeset -r changes=$(git status --porcelain 2>/dev/null)
	[[ -n ${changes} ]] && echo "✗"
}

function _chinatown::branch {
	typeset -r branch=$(git branch --show-current 2>/dev/null)
	if [[ -n ${branch} ]]; then
		echo "%K{yellow}%F{black}  󰘬 %B${branch}%b$(_chinatown::branch_changes) %F{yellow}%k"
	else
		echo ""
	fi
}

PROMPT=' %(?..🔥)🐉 %n@%B%m%b %F{black}$(_chinatown::venv)   %B%1~%b %k%F{red}$(_chinatown::branch)%f  '

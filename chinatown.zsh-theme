setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT="1"

function _venv() {
	typeset -r venv=${VIRTUAL_ENV##*/}
	if [[ -n ${venv} ]]; then
		echo "%F{black}%K{green}   %B${venv}%b %F{green}%K{red}%F{black}"
	else
		echo "%F{black}%K{red}"
	fi
}

PROMPT=' %(?..🔥)🐉 %n $(_venv)   %B%1~%b %k%F{red}%f  '

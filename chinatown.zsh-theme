export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

__c_gve() {
	[[ ${VIRTUAL_ENV} ]] && echo "%K{2}   ${VIRTUAL_ENV##*/} %F{2}"
}

__c_gda() {
	d=("${(s./.)PWD/${HOME}/~}")
	[[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
		[[ ${d[i]} == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
	done
	echo ${(j./.)d}
}

__c_gtg() {
	t=$(git describe --tags --abbrev=0 2>/dev/null)
	[[ ${t} ]] && echo "%K{5} %F{0}  ${t} %F{5}"
}

__c_gbr() {
	b=$(git branch --show-current 2>/dev/null)
	[[ ${b} ]] && echo "%K{3} %F{0} 󰘬 ${b} %F{3}$(__c_gtg)"
}

PROMPT='%K{0}%F{1} %F{7}%(?..🔥)🐉 %n@%m %F{0}$(__c_gve)%K{1} %F{0}  \
$(__c_gda) %F{1}$(__c_gbr)%k %F{8}
 ✗%f '

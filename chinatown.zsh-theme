setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

__Chinatown()
{
	Get_Virtual_Environment()
	{
		[[ ${VIRTUAL_ENV} ]] && echo "%K{2}%F{8} %F{0}  ${VIRTUAL_ENV##*/}"\
		                             "%K{1}%F{2} %F{0}" ||
		                        echo "%K{1}%F{8} %F{0}"
	}

	Get_Directory()
	{
		typeset -a d=("${(s./.)PWD/${HOME}/~}")
		[[ ${#d} > 1 ]] && for i in {1..$((${#d} - 1))}; do
			[[ "${d[i]}" == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
		done
		echo ${(j./.)d}
	}

	Get_Tag()
	{
		typeset -r t=$(git describe --tags --abbrev=0 2>/dev/null)
		[[ ${t} ]] && echo "%K{5}%F{3} %F{0}  ${t} %k%F{5} %f" ||
		              echo "%k%F{3} %f"
	}

	Get_Branch()
	{
		typeset -r b=$(git branch --show-current 2>/dev/null)
		[[ ${b} ]] && echo "%K{3}%F{1} %F{0} 󰘬 ${b} $(Get_Tag)" ||
		              echo "%k%F{1} %f"
	}

	echo "%K{0}%F{1} %F{7}%(?..🔥)🐉 %n@%m %K{8}%F{0}"\
	     "$(Get_Virtual_Environment)  $(Get_Directory) $(Get_Branch)%k%f"
}

PROMPT='$(__Chinatown)
%F{8} ✗%f '


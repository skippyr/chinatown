export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function __Chinatown__Get_Virtual_Environment()
{
    [[ ${VIRTUAL_ENV} ]] && echo "%K{2} %F{0}  ${VIRTUAL_ENV##*/}"           \
                                 "%K{1}%F{2} %F{0}" || echo "%K{1} "
}

function __Chinatown__Get_Directory_Abbreviated()
{
    typeset -a directory_splits=("${(s./.)PWD/${HOME}/~}")
    [[ ${#directory_splits} -gt 1 ]] &&
        for directory_split_index in {1..$((${#directory_splits} - 1))}; do
            [[ "${directory_splits[directory_split_index]}" == .* ]] &&
                directory_splits[directory_split_index]=${directory_splits[directory_split_index][1,2]} ||
                directory_splits[directory_split_index]=${directory_splits[directory_split_index][1]}
        done
    echo ${(j./.)directory_splits}
}

function __Chinatown__Get_Git_Tag()
{
    typeset -r tag=$(git describe --tags --abbrev=0 2>/dev/null)
    [[ ${tag} ]] && echo "%K{5} %F{0}  ${tag} %k%F{5} " || echo "%k "
}

function __Chinatown__Get_Git_Branch()
{
    typeset -r branch=$(git branch --show-current 2>/dev/null)
    [[ ${branch} ]] && echo "%K{3} %F{0} 󰘬 ${branch}%F{3}"                    \
                            "$(__Chinatown__Get_Git_Tag)" || echo "%k "
}

PROMPT='%K{0}%F{1} %F{7}%(?..🔥)🐉 %n@%m %F{0}$(__Chinatown__Get_Virtual_Environment)  $(__Chinatown__Get_Directory_Abbreviated) %F{1}$(__Chinatown__Get_Git_Branch)
%F{8} ✗%f '

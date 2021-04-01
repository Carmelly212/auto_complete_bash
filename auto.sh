#/usr/bin/env bash

PROJECT_SCRIPT="./func_project"

_main ()
{
    COMPREPLY=();
    local word="${COMP_WORDS[COMP_CWORD]}";
    #echo "[${COMP_WORDS[@]}]"
    opts="$(${PROJECT_SCRIPT} complete ${COMP_WORDS[@]})"
    COMPREPLY=($(compgen -W "${opts}" -- "$word"))
}

# activate auto-complete's main function
complete -F _main ${PROJECT_SCRIPT}

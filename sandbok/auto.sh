#!/bin/bash

PROJECT_SCRIPT="./project.sh"

_main_alon (){

    COMPREPLY=();
    COMPREPLY=($(compgen -W "complete" -- "${word}"))

    local word="${COMP_WORDS[COMP_CWORD]}";
    if [ "$COMP_CWORD" -gt 1 ]; then
    _second
    fi
 
}

_second (){
    opts="$(${PROJECT_SCRIPT} complete ${COMP_WORDS[@]})"
    COMPREPLY=($(compgen -W "${opts}" -- "$word"))
}


complete -F _main_alon ${PROJECT_SCRIPT}

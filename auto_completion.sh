#/usr/bin/env bash


proj_commands="tree build git"
git_next="sync push reset"
tree_next="gen cmake build"
modules=$(<module_list.txt)
opts="--help -h --install -i --run -r --rebuild -rb -ps --stop --logs -l --bash -b --unit-tests -t"

_main ()
{
    COMPREPLY=();
    local word="${COMP_WORDS[COMP_CWORD]}";
    local prev="${COMP_WORDS[COMP_CWORD-1]}";
    local first="${COMP_WORDS[COMP_CWORD-2]}";
    # main command
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${proj_commands}" -- "$word"));
    else

        case ${prev} in
            git) _git ;;
            tree) _tree ;;
            build) _switches ;;
        esac

        if [[ ${prev} == -* ]];then
            case $first in
                git) _git ;;
                tree) _tree ;;
            esac
        fi

        if [[ ${word} == -* ]]; then
            _switches
        else
            case $prev in
                sync|push|reset) _modules ;;
                gen|cmake|build) _modules ;;
            esac

            if [[ "${modules}" == *"${prev}"* ]]; then
                _rest_of_modules
            elif [[ ${word} == -* ]]; then
                _switches
            elif [[ ${prev} == -* ]]; then
                _modules
            fi
        fi

        if [[ ${word} == -* ]]; then
            _switches
        else
            case $first in
                sync|push|reset) _modules ;;
                gen|cmake|build) _modules ;;
            esac

            if [[ "${modules}" == *"${prev}"* ]]; then
                _rest_of_modules
            elif [[ ${word} == -* ]]; then
                _switches
            fi
        fi


    fi
}

_rest_of_modules()
{
    disclude=""
    for mod in ${modules};
    do

        if [[ $@ != $mod ]]; then
            disclude+="$mod "
        else true
        fi


    done
    local word="${COMP_WORDS[COMP_CWORD]}";
    COMPREPLY=();
    COMPREPLY=( $(compgen -W "${disclude}" -- "$word") )
}
# _rest_of_modules
_switches()
{
    local word="${COMP_WORDS[COMP_CWORD]}";
    local prev="${COMP_WORDS[COMP_CWORD-1]}";
    if [[ ${word} == -* ]]; then
        COMPREPLY=();
        COMPREPLY=($(compgen -W "${opts}" -- "$word"));
    else
        COMPREPLY=( $(compgen -W "${modules}" -- "$word") )
    fi
}

# actions for the git module
_git ()
{
    COMPREPLY=();
    local word="${COMP_WORDS[COMP_CWORD]}";
    local prev="${COMP_WORDS[COMP_CWORD-1]}";
    COMPREPLY=($(compgen -W "${git_next}" -- "$word"));
}

# actions for tree module
_tree ()
{
    COMPREPLY=();
    local word="${COMP_WORDS[COMP_CWORD]}";
    local prev="${COMP_WORDS[COMP_CWORD-1]}";
    COMPREPLY=($(compgen -W "${tree_next}" -- "$word"));
}

#display available modules
_modules ()
{
    COMPREPLY=();
    local word="${COMP_WORDS[COMP_CWORD]}";
    local prev="${COMP_WORDS[COMP_CWORD-1]}";
    COMPREPLY=($(compgen -W "${modules}" -- "$word"));

}

# activate auto-complete's main function
complete -F _main ./project.sh

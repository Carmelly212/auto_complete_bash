#/usr/bin/env bash
_main ()
{
    var="alon"
    proj_commands="tree build git"
    COMPREPLY=();
    local word="${COMP_WORDS[COMP_CWORD]}";
    local prev="${COMP_WORDS[COMP_CWORD-1]}";
    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=($(compgen -W "${proj_commands}" -- "$word"));
    else
      case ${prev} in
    git) _git ;;
    tree) _tree ;;
    esac
    fi
}
_git ()
{
    proj_next="sync push reset"
    COMPREPLY=();
    local word="${COMP_WORDS[COMP_CWORD]}";
    local prev="${COMP_WORDS[COMP_CWORD-1]}";
    if [ "$COMP_CWORD" -eq 2 ]; then
        COMPREPLY=($(compgen -W "${proj_next}" -- "$word"));
    fi
}

_tree ()
{
    proj_next="gen cmake build"
    COMPREPLY=();
    local word="${COMP_WORDS[COMP_CWORD]}";
    local prev="${COMP_WORDS[COMP_CWORD-1]}";
    if [ "$COMP_CWORD" -eq 2 ]; then
        COMPREPLY=($(compgen -W "${proj_next}" -- "$word"));
    fi
}


complete -F _main ./project.sh

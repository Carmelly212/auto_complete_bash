#!/usr/bin/env bash

function _auto {

    modules="mfc llvm cafe"
    def_opts="--manifest --makefile"
    shift 3 # complete ./project.sh
    if [ $# == 0 ]; then
        echo "git module tree list utest"
    elif [ $# == 1 ]; then
        case $1 in
            git) echo "sync push reset status diff" ;;
            module) echo "build cmake" ;;
            tree) echo "gen cmake build install" ;;
            list) echo "all cmake dev" ;;
            utest) echo "all dev" ;;
            *) echo "git module tree list utest" ;;
        esac
        exit 0
    else
        case $1 in
            git)
                case $2 in
                    sync) op="git_sync" ;;
                    push) op="git_push" ;;
                    reset) op="git_reset" ;;
                    status) op="git_status" ;;
                    diff) op="git_diff" ;;
                    *) echo "sync push reset status diff" ;;
                esac
                ;;
            module)
                case $2 in
                    build) op="module_build" ;;
                    cmake) op="module_cmake" ;;
                    *) echo "build cmake" ;;
                esac
                ;;
            tree)
                case $2 in
                    gen) op="tree_gen" ;;
                    cmake) op="tree_cmake" ;;
                    build) op="tree_build" ;;
                    install) op="tree_install" ;;
                    *) echo "gen cmake build install" ;;
                esac
                ;;
            list)
                case $2 in
                    all) op="list_all" ;;
                    cmake) op="list_cmake" ;;
                    dev) op="list_dev" ;;
                    *) echo "all cmake dev" ;;
                esac
                ;;
            *) exit 0 ;;
            utest)
                case $2 in
                    all) op="utest_all" ;;
                    dev) op="utest_dev" ;;
                    *) echo "all dev" ;;
                esac
                ;;
            *) exit 0 ;;
        esac

        case "$op" in
            git_sync) echo ${modules} ${def_opts} "--serial --schema" ;;
            git_push) echo ${modules} ${def_opts} "--serial --schema" ;;
            git_reset ) echo ${modules} ${def_opts} "--schema" ;;
            git_status ) echo ${modules} ${def_opts} "--schema" ;;
            git_diff ) echo ${modules} ${def_opts} "--schema" ;;
            module_build ) echo ${modules} ${def_opts} "--serial --schema --gen --target make ninja" ;;
            module_cmake ) echo "not implemented yet" ;;
            tree_gen ) echo ${modules} ;;
            tree_cmake ) echo "${modules} --manifest --schema --gen make ninja" ;;
            tree_build ) echo "--menifest --schema --target" ;;
            list_cmake )  echo "--menifest --schema --full" ;;
            list_dev )  echo "--menifest --schema --full" ;;
            list_all )  echo "--menifest --schema --full" ;;
            utest_all ) echo "all" ;;
            utest_dev ) echo "dev" ;;

        esac
    fi

}
shift 1

if [ "$#" == 0 ]; then

 _auto "$@"

fi